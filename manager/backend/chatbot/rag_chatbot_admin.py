from flask import Flask, request, jsonify
from langchain_community.vectorstores import FAISS
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_core.documents import Document
import requests
import uuid
import json
from config import CLOVA_API_KEY, CLOVA_REQUEST_ID

app = Flask(__name__)

# 1. 벡터 DB 로드
embedding_model = HuggingFaceEmbeddings(model_name="snunlp/KR-SBERT-Medium-klueNLI-klueSTS")
db = FAISS.load_local("vector_store_admin", embedding_model, index_name="index", allow_dangerous_deserialization=True)

# 2. HyperCLOVA API 호출 함수
class CompletionExecutor:
    def __init__(self, host, api_key):
        self._host = host
        self._api_key = api_key

    def execute(self, completion_request):
        headers = {
            'Authorization': self._api_key,
            'X-NCP-CLOVASTUDIO-REQUEST-ID': str(uuid.uuid4()),
            'Content-Type': 'application/json; charset=utf-8',
            'Accept': 'text/event-stream'
        }

        response = requests.post(
            self._host + '/testapp/v3/chat-completions/HCX-005',
            headers=headers,
            json=completion_request,
            stream=True
        )

        if response.status_code != 200:
            print("❌ 요청 실패:", response.status_code, response.text)
            return "Error: 클로바 응답 오류"

        final_answer = ""
        try:
            for line in response.iter_lines():
                if line:
                    decoded = line.decode("utf-8", errors="ignore")
                    if decoded.startswith("data:"):
                        payload = json.loads(decoded[5:])
                        if "message" in payload:
                            final_answer += payload["message"].get("content", "")
        except Exception as e:
            print("❌ 예외 발생:", e)
            return "Error: 응답 처리 중 오류"

        return final_answer

# 3. 질의 처리 API
@app.route("/api/admin/rag", methods=["POST"])
def rag_chat():
    data = request.json
    query = data.get("query")
    if not query:
        return jsonify({"error": "No query provided"}), 400

    # 쿼리 벡터화 및 검색
    docs = db.similarity_search(query, k=5)
    references = [{"text": d.page_content, "source": d.metadata.get("source", "")} for d in docs]

    # 프롬프트 설정
    preset_texts = [{
        "role": "system",
        "content": "너는 WMS 시스템에 대한 관리자용 문서를 기반으로 질문에 답변하는 챗봇이야. 주어진 reference 외 지식은 사용하지마. 관련 문서 없으면 '제가 가지고 있는 정보로는 답변할 수 없습니다.' 라고 말해.\n 답변은 너무 길지 않게, 최대한 반복되는 내용이 없도록 만들어. "
    }]
    for ref in references:
        preset_texts.append({
            "role": "user",
            "content": f"reference: {ref['text']}, url: {ref['source']}"
        })
    preset_texts.append({"role": "user", "content": query})

    # 요청 데이터 생성
    request_data = {
        'messages': preset_texts,
        'topP': 0.8,
        'topK': 0,
        'maxTokens': 512,
        'temperature': 0.5,
        'repetitionPenalty': 1.5,
        'stop': [],
        'includeAiFilters': False
    }

    # HCX 모델 응답 호출
    executor = CompletionExecutor(
        host="https://clovastudio.stream.ntruss.com",
        api_key=f"Bearer {CLOVA_API_KEY}"
    )

    response = executor.execute(request_data)
    return jsonify({
        "answer": response,
        "sources": references
    })

if __name__ == "__main__":
    app.run(port=5081)
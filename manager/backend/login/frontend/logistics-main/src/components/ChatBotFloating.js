import React, { useState } from "react";
import "./ChatBotFloating.css";
import axios from "axios";

const ChatBotFloating = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [query, setQuery] = useState("");
  const [answer, setAnswer] = useState("");

  const handleChatSubmit = async () => {
    try {
      const res = await axios.post("http://34.64.211.3:5050/api/admin/rag", {
        query: query,
      });
      setAnswer(res.data.answer);
    } catch (err) {
      setAnswer("❌ 서버 응답 실패: " + err.message);
    }
  };

  return (
    <div className="chatbot-floating-container">
      <button className="chatbot-floating-button" onClick={() => setIsOpen(!isOpen)}>
        💬
      </button>
      {isOpen && (
        <div className="chatbot-popup">
          <textarea
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="질문을 입력하세요"
            className="chatbot-textarea"
          />
          <button onClick={handleChatSubmit} className="chatbot-submit">전송</button>
          <div className="chat-answer">{answer}</div>
        </div>
      )}
    </div>
  );
};

export default ChatBotFloating;

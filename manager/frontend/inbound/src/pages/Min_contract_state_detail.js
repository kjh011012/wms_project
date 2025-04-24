import React, { useState, useEffect } from 'react';
import Min_estimate_calculator from './Min_estimate_calculator';
import { StorageMap } from './StorageMap'; // 가상의 StorageMap 컴포넌트

function Min_contract_state_detail({ contract, isOpen, onClose }) {
  const [currentPage, setCurrentPage] = useState(1);
  const [barcodeUrl, setBarcodeUrl] = useState('');
  const [contractForm, setContractForm] = useState({
    title: '',
    content: '',
    terms: '',
    signature: ''
  });
  const [isEditable, setIsEditable] = useState(true);
  const [isSaveEnabled, setIsSaveEnabled] = useState(true);

  const [selectedRowData, setSelectedRowData] = useState(null); // 선택된 행 데이터
  const [formData, setFormData] = useState({});                 // 실견적 계산용 form 상태
  const [activeFields, setActiveFields] = useState({});         // 수정 필드 추적용

  // 계약서 폼 데이터 가져오기
  const fetchContractForm = async (contractId) => {
    try {
      const response = await fetch(`http://34.64.211.3:5001/contract-status/${contractId}`);
      if (!response.ok) throw new Error('데이터 로드 실패');
      const data = await response.json();
      console.log("불러온 계약서 데이터:", data);
      
      if (data) {
        setContractForm({
          title: data.title || '',
          content: data.content || '',
          terms: data.terms || '',
          signature: data.signature || ''
        });
        // 👉 여기에 입고 관련 데이터도 state로 저장
        setSelectedRowData(data);  // 실견적 계산기 등에서 활용 
      }
    } catch (error) {
      console.error('계약서 폼 로드 실패:', error);
    }
  };

  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    if (contract?.id) {
      setIsLoading(true);
      fetchContractForm(contract.id).finally(() => setIsLoading(false));
      setBarcodeUrl(`http://34.64.211.3:5001/barcode/${contract.id}.png`);
      setSelectedRowData(contract);  // 여기에 복사해두면 estimate 접근도 바로 가능
      setIsEditable(true);
      setIsSaveEnabled(true);
      }
  }, [contract]);

  const handleInputChange = (field, value) => {
    setContractForm(prev => ({
      ...prev,
      [field]: value
    }));
  };

  const handleFormSubmit = async (e) => {
    e.preventDefault();
    const cid = contract.id;
  
    try {
      // 먼저 계약서 존재 여부 확인
      const checkRes = await fetch(`http://34.64.211.3:5001/contract-form/${cid}`, {
        credentials: "include",
      });
  
      let method = 'POST';
      if (checkRes.ok) {
        // 이미 존재하면 수정으로 간주
        method = 'POST'; // 이미 이 API는 update만 POST로 받는 구조라면 유지
      }
  
      const response = await fetch(`http://34.64.211.3:5001/contract-form/${cid}`, {
        credentials: "include",
        method,
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          title: contractForm.title,
          content: contractForm.content,
          terms: contractForm.terms,
          signature: contractForm.signature
        }),
      });
  
      if (!response.ok) {
        throw new Error('계약서 저장 실패');
      }
  
      alert('계약서가 저장되었습니다.');
      setIsEditable(false);
      setIsSaveEnabled(false);
  
    } catch (error) {
      console.error('계약서 저장 중 오류:', error);
      alert('계약서 저장 중 오류가 발생했습니다.');
    }
  };

  const handleClose = (e) => {
    if (e) e.preventDefault();
    onClose();
  };

  const handlePrint = () => {
    window.print();
  };

  const handleEdit = () => {
    setIsEditable(true);
    setIsSaveEnabled(true);
  };

  if (!isOpen) return null;

  // 스타일 정의
  const modalStyle = {
    position: 'fixed',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    zIndex: 1000
  };

  const contentStyle = {
    backgroundColor: '#ffffff',
    padding: '30px',
    borderRadius: '12px',
    height: '80%',
    width: '600px',
    boxShadow: '0 4px 8px rgba(0, 0, 0, 0.2)',
    position: 'relative',
    textAlign: 'center',
  };

  const formContainerStyle = {
    padding: '20px'
  };

  const labelStyle = {
    display: 'block',
    marginBottom: '8px',
    fontWeight: '500',
    color: '#333'
  };

  const inputStyle = {
    width: '100%',
    height: 'auto',
    padding: '10px',
    marginBottom: '15px',
    border: '1px solid #ddd',
    borderRadius: '4px',
    fontSize: '14px',
    backgroundColor: '#f9f9f9'
  };

  const buttonStyle = {
    padding: '10px 20px',
    margin: '10px 5px',
    borderRadius: '5px',
    border: 'none',
    cursor: 'pointer',
    color: 'white',
    fontSize: '14px',
  };

  const fixedButtonContainer = {
    position: 'sticky',
    bottom: 0,
    backgroundColor: 'white',
    padding: '15px 0',
    borderTop: '1px solid #eee',
    marginTop: '20px',
    display: 'flex',
    gap: '10px',
    width: '100%',
    justifyContent: 'center'
  };

  const pageButtonStyle = {
    padding: '8px 16px',
    margin: '0 5px',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer',
    backgroundColor: '#f0f0f0',
    color: '#333',
    fontSize: '14px',
    transition: 'all 0.3s ease'
  };

  const activePageStyle = {
    ...pageButtonStyle,
    backgroundColor: '#6f47c5',
    color: 'white'
  };

  const sectionTitleStyle = {
    fontSize: '20px',
    fontWeight: 'bold',
    color: '#333',
    marginBottom: '20px',
    borderBottom: '2px solid #6f47c5',
    paddingBottom: '10px',
  };

  
  const cid = contract?.contract_id || contract?.id;
  

  return (
    <div style={modalStyle} onClick={handleClose}>
      <div style={contentStyle} onClick={(e) => e.stopPropagation()}>
        <button 
          style={{
            position: 'absolute',
            top: '10px',
            right: '10px',
            border: 'none',
            borderRadius: '50%',
            background: '#b794ff',
            fontSize: '20px',
            cursor: 'pointer',
            color: 'white',
          }} 
          onClick={handleClose}
        >
          &times;
        </button>
        
        <div style={{ marginBottom: '10px', textAlign: 'center' }}>
          <button 
            style={currentPage === 1 ? activePageStyle : pageButtonStyle}
            onClick={() => setCurrentPage(1)}
          >
            실견적 계산기
          </button>
          <button 
            style={currentPage === 2 ? activePageStyle : pageButtonStyle}
            onClick={() => setCurrentPage(2)}
          >
            창고 현황
          </button>
          <button 
            style={currentPage === 3 ? activePageStyle : pageButtonStyle}
            onClick={() => setCurrentPage(3)}
          >
            계약서 작성
          </button>
          <button 
            style={currentPage === 4 ? activePageStyle : pageButtonStyle}
            onClick={() => setCurrentPage(4)}
          >
            계약 상세 정보
          </button>
        </div>

        {currentPage === 1 && (
            <Min_estimate_calculator
            selectedRowData={selectedRowData}
            onUpdate={async (updated) => {
              try {
                const response = await fetch(`http://34.64.211.3:5002/inbound-status/${contract?.id}`, {
                  method: 'PUT',
                  headers: {
                    'Content-Type': 'application/json',
                  },
                  body: JSON.stringify(updated),
                });
          
                if (!response.ok) throw new Error('서버 저장 실패');
          
                const result = await response.json();
                console.log("📦 저장 완료:", result);
          
                // 저장 성공 시, 계약서 상태도 업데이트
                setContractForm((prev) => ({
                  ...prev,
                  ...updated
                }));
          
                alert("입고 정보 저장 성공!");
          
              } catch (err) {
                console.error("❌ 저장 실패:", err);
                alert("입고 정보 저장 중 오류가 발생했습니다.");
              }
            }}
            onClose={() => setCurrentPage(2)}
            />
          )}

        {currentPage === 2 && (
          <div style={{ height: '600px', overflow: 'auto' }}>
            <StorageMap />
          </div>
        )}

        {currentPage === 3 && (
          <form onSubmit={handleFormSubmit}>
            <h2 style={sectionTitleStyle}>계약서</h2>
            <div style={{ display: 'flex', gap: '40px', alignItems: 'flex-start', height: '400px', weight: '500px' }}>
              {/* 왼쪽: 제목, 계약 내용, 서명 */}
              <div style={{ flex: '1', display: 'flex', flexDirection: 'column' }}>
                <div>
                  <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>제목</label>
                  <input
                    type="text"
                    value={contractForm.title}
                    onChange={(e) => handleInputChange('title', e.target.value)}
                    style={{...inputStyle, height: '25px', backgroundColor: '#f9f9f9'}}
                    disabled={!isEditable}
                  />
                </div>

                <div>
                  <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>계약 내용</label>
                  <textarea
                    value={contractForm.content}
                    onChange={(e) => handleInputChange('content', e.target.value)}
                    style={{...inputStyle, height: '250px', overflowY: 'auto', backgroundColor: '#f9f9f9'}}
                    disabled={!isEditable}
                  />
                </div>

                <div>
                  <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>서명</label>
                    <input
                      type="text"
                      value={contractForm.signature}
                      onChange={(e) => handleInputChange('signature', e.target.value)}
                      style={{ ...inputStyle, height: '25px', backgroundColor: '#f9f9f9' }}
                      disabled={!isEditable}
                    />
                </div>
              </div>

              {/* 오른쪽: 견적서 정보 */}
              <div style={{ width: '90%', margin: "0 auto", flex: '1', display: 'flex', flexDirection: 'column'}}>
                <div>
                  <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>견적서 정보</label>
                  <div 
                      style={{ 
                        ...inputStyle, 
                        height: '425px', 
                        overflowY: 'auto',
                        whiteSpace: 'pre-line',
                        backgroundColor: '#f9f9f9',
                        fontSize: '11px',
                        width: '100%', margin: "0 auto",
                      }}
                  >
                    {isLoading
                    ? '견적서 정보 로딩 중...'
                    : contract?.estimate || '견적서 정보 없음'}
                  </div>
                </div>
              </div>
            </div>
            
                {/* 버튼 영역 */}
                <div style={{
                  position: 'absolute',
                  bottom: '20px',
                  left: '50%',
                  transform: 'translateX(-50%)',
                  display: 'flex',
                  gap: '20px',
                }}>
                  <button
                      type="submit"
                      style={{
                        ...buttonStyle,
                        backgroundColor: isSaveEnabled ? '#6f47c5' : '#cccccc',
                        cursor: isSaveEnabled ? 'pointer' : 'not-allowed'
                      }}
                      disabled={!isSaveEnabled}
                    >
                      저장
                  </button>
                  <button
                    type="button"
                    onClick={handleEdit}
                    style={{
                      ...buttonStyle,
                      backgroundColor: !isEditable ? '#6f47c5' : '#cccccc',
                      cursor: !isEditable ? 'pointer' : 'not-allowed'
                    }}
                    disabled={isEditable}
                  >
                    수정
                  </button>
                  <button
                    type="button"
                    onClick={handlePrint}
                    style={{
                      ...buttonStyle,
                      backgroundColor: '#b794ff'
                    }}
                  >
                    출력
                  </button>
                </div>
          </form>
        )}
        {currentPage === 4 && contract && (
          <>
            <h2 style={sectionTitleStyle}>계약 상세 정보</h2>
            <div style={{ display: 'flex', gap: '40px', alignItems: 'flex-start', marginTop: '20px' }}>
              {/* 왼쪽: 계약 정보 테이블 */}
              <table style={{ height: '500px', width: '60%', borderCollapse: 'collapse' }}>
                <tbody>
                  <tr>
                    <td style={cellHeaderStyle}>계약 ID</td>
                    <td style={cellBodyStyle}>{contract?.id}</td>
                  </tr>
                  <tr>
                    <td style={cellHeaderStyle}>회사</td>
                    <td style={cellBodyStyle}>{contract?.company_name}</td>
                  </tr>
                  <tr>
                    <td style={cellHeaderStyle}>상품명</td>
                    <td style={cellBodyStyle}>{contract?.product_name}</td>
                  </tr>
                  <tr>
                    <td style={cellHeaderStyle}>수량</td>
                    <td style={cellBodyStyle}>{contract?.inbound_quantity}</td>
                  </tr>
                  <tr>
                    <td style={cellHeaderStyle}>창고위치</td>
                    <td style={cellBodyStyle}>{contract?.warehouse_location}</td>
                  </tr>
                  <tr>
                    <td style={cellHeaderStyle}>보관창고</td>
                    <td style={cellBodyStyle}>{contract?.warehouse_type}</td>
                  </tr>
                  <tr>
                    <td style={cellHeaderStyle}>계약 날짜</td>
                    <td style={cellBodyStyle}>{contract?.contract_date || '계약 대기'}</td>
                  </tr>
                </tbody>
              </table>

              {/* 오른쪽: 바코드 이미지 */}
              {barcodeUrl && (
                <div style={{
                  height: '460px',
                  width: '35%',
                  textAlign: 'center',
                  border: '1px solid #eee',
                  padding: '20px',
                  borderRadius: '8px',
                  backgroundColor: '#fafafa'
                }}>
                  <img 
                    src={barcodeUrl} 
                    alt="바코드" 
                    style={{ maxWidth: '200px' }}
                    onError={(e) => {
                      console.error('바코드 이미지 로드 실패');
                      e.target.style.display = 'none';
                    }}
                  />
                </div>
              )}
            </div>


            {/* 버튼 영역 */}
            <div style={{
              position: 'absolute',
              bottom: '20px',
              left: '50%',
              transform: 'translateX(-50%)',
              display: 'flex',
              gap: '20px',
            }}>
              <button
                onClick={handlePrint}
                style={{
                  ...buttonStyle,
                  backgroundColor: '#b794ff'
                }}
              >
                출력
              </button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}

const cellHeaderStyle = {
  border: '1px solid #e0dff3',
  padding: '12px 16px',
  fontWeight: 600,
  backgroundColor: '#f4f1fb',
  color: '#5a3ea1',
  width: '35%',
  fontSize: '14px',
  textAlign: 'left',
  borderRadius: '8px 0 0 8px',
};

const cellBodyStyle = {
  border: '1px solid #e0dff3',
  padding: '12px 16px',
  backgroundColor: '#ffffff',
  fontSize: '14px',
  color: '#333',
  textAlign: 'left',
  borderRadius: '0 8px 8px 0',
};


export default Min_contract_state_detail;

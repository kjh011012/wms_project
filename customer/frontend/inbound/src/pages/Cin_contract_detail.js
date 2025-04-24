import React, { useEffect, useState } from 'react';

function CustomerDetail({ contract, isOpen, onClose, onContractUpdate }) {
  const [barcodeUrl, setBarcodeUrl] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [contractForm, setContractForm] = useState({
    title: '',
    content: '',
    terms: '',
    signature: ''
  });
  const [contractDate, setContractDate] = useState('계약 대기'); // 계약일 표시용
  const [companyName, setCompanyName] = useState('');
  const [productName, setProductName] = useState('');
  const [inboundQuantity, setInboundQuantity] = useState(0);
  const [warehouseLocation, setWarehouseLocation] = useState('');
  const [warehouseType, setWarehouseType] = useState('');

  useEffect(() => {
    console.log('계약 정보:', contract);
    if (contract && (contract.contract_id || contract.id)) {
      const cid = contract.contract_id || contract.id; 
      setBarcodeUrl(`http://34.64.211.3:5012/barcode/${cid}.png`);
      fetchContractForm(cid);
    }
  }, [contract]);

  const fetchContractForm = async (cid) => {
    try {
      const response = await fetch(`http://34.64.211.3:5012/contract-form/${cid}`);
      if (response.ok) {
        const data = await response.json();
        console.log("받아온 계약서 데이터:", data); // 디버깅용
        
        // ContractForms 테이블의 데이터 설정
        setContractForm({
          title: data.title || '',
          content: data.content || '',
          terms: data.terms || '',
          signature: data.signature || ''
        });

        // MainTable의 데이터 설정
        setCompanyName(contract.company_name || '');
        setProductName(contract.product_name || '');
        setInboundQuantity(contract.inbound_quantity || 0);
        setWarehouseLocation(contract.warehouse_location || '');
        setWarehouseType(contract.warehouse_type || '');
        setContractDate(contract.contract_date || '계약 대기');
      }
    } catch (error) {
      console.error('계약서 양식 로드 실패:', error);
    }
  };

  const handleFormSubmit = async (e) => {
    e.preventDefault();
    const cid = contract.contract_id || contract.id;
    try {
      const response = await fetch(`http://34.64.211.3:5012/contract-form/${cid}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(contractForm),
      });
      
      if (response.ok) {
        const result = await response.json();
        alert('계약서가 저장되었습니다.');
        setBarcodeUrl(`http://34.64.211.3:5012/barcode/${cid}`);
        setCurrentPage(2);
      }
    } catch (error) {
      console.error('계약서 저장 실패:', error);
    }
  };

  const handleApprove = async () => {
    try {
      const response = await fetch(`http://34.64.211.3:5012/approve-contract/${contract.id}`, {
        method: 'POST'
      });
      
      if (!response.ok) {
        const error = await response.json();
        alert(error.message || "계약 승인 중 오류가 발생했습니다.");
        return;
      }
      
      const result = await response.json();
      alert(result.message);
      
      // 승인 후 계약일 업데이트
      setContractDate(new Date().toISOString().split('T')[0]);
      
      // 부모 컴포넌트의 데이터 갱신을 위한 콜백
      if (onContractUpdate) {
        onContractUpdate();
      }
    } catch (error) {
      console.error("계약 승인 실패:", error);
      alert("계약 승인 중 오류가 발생했습니다.");
    }
  };

  const handleInputChange = (e) => {
    // 읽기전용이므로 더 이상 값 변경 X
    // 기존 코드 유지하지만 읽기전용이므로 실제 변화는 없음.
  };

  const handlePrint = () => {
    window.print();
  };

  const handleClose = (e) => {
    if (e) {
      e.preventDefault();
      e.stopPropagation();
    }
    onClose();
  };

  if (!isOpen) return null;

  // 스타일 정의
  const pageButtonStyle = {
    padding: '10px 20px',
    margin: '20px 5px',
    border: 'none',
    borderRadius: '5px',
    cursor: 'pointer',
    backgroundColor: '#f0f0f0',
    color: '#333',
    fontSize: '14px',
    transition: 'all 0.3s ease'
  };

  const activePageStyle = {
    ...pageButtonStyle,
    backgroundColor: '#6f47c5',
    color: 'white',
    padding: '10px 20px',
    borderRadius: '5px',
  };

  const formContainerStyle = {
    padding: '20px'
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

  const labelStyle = {
    display: 'block',
    marginBottom: '8px',
    fontWeight: '500',
    color: '#333'
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
    zIndex: 1000,
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

  const sectionTitleStyle = {
    fontSize: '20px',
    fontWeight: 'bold',
    color: '#333',
    marginBottom: '20px',
    borderBottom: '2px solid #6f47c5',
    paddingBottom: '10px',
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

  const printButtonStyle = {
    padding: '10px 20px',
    background: '#2196F3',
    color: 'white',
    border: 'none',
    borderRadius: '5px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 'bold',
    backgroundColor: '#b794ff',
  };

  const approveButtonStyle = {
    padding: '10px 20px',
    color: 'white',
    border: 'none',
    borderRadius: '5px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 'bold',
    backgroundColor: '#6f47c5',
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
            background: '#b794ff',
            borderRadius: '50%',
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
            계약서 작성(읽기전용)
          </button>
          <button 
            style={currentPage === 2 ? activePageStyle : pageButtonStyle}
            onClick={() => setCurrentPage(2)}
          >
            계약 상세정보
          </button>
        </div>

        {currentPage === 1 ? (
        // 읽기 전용 계약서 페이지
        <div> 
          <h2 style={sectionTitleStyle}>계약서(읽기전용)</h2>
          <div style={{ ...formContainerStyle, display: 'flex', gap: '40px', alignItems: 'flex-start', height: '400px', weight: '500px' }}>
            {/* 왼쪽: 제목, 계약 내용, 서명 */}
            <div style={{ flex: '1', display: 'flex', flexDirection: 'column' }}>
              <div>
                <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>제목</label>
                <div style={{ ...inputStyle, height: '25px', backgroundColor: '#f9f9f9' }}>{contractForm.title}</div>
              </div>

              <div>
                <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>계약 내용</label>
                <div style={{ ...inputStyle, height: '250px', scrollbarWidth: 'thin', scrollbarColor: '#6f47c5 #f1f1f1', backgroundColor: '#f9f9f9' }}>
                  {contractForm.content}
                </div>
              </div>

              <div>
                <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>서명</label>
                <div style={{ ...inputStyle, height: '25px', backgroundColor: '#f9f9f9' }}>{contractForm?.signature}</div>
              </div>
            </div>

            {/* 오른쪽: 견적서 정보 */}
            <div style={{ flex: '1', display: 'flex', flexDirection: 'column' }}>
              <div>
                <label style={{ ...labelStyle, textAlign: 'left', display: 'block', marginBottom: '5px', fontWeight: 'bold' }}>견적서 정보</label>
                <div style={{
                  ...inputStyle,
                  height: '425px',
                  overflowY: 'auto',
                  whiteSpace: 'pre-line',
                  backgroundColor: '#f9f9f9',
                  fontSize: '11px',
                }}>
                  {contract?.estimate || '견적서 정보가 없습니다.'}
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
            <button onClick={handleApprove} style={approveButtonStyle}>계약 승인</button>
            <button onClick={handlePrint} style={printButtonStyle}>출력</button>
          </div>
        </div>
        ) : (
          <>
            <h2 style={sectionTitleStyle}>계약 상세 정보</h2>
            <table style={{ width: '100%', borderCollapse: 'collapse', marginTop: '20px' }}>
              <tbody>
                <tr>
                  <td style={{ border: '1px solid #ddd', padding: '8px', fontWeight: 'bold', backgroundColor: '#f4f4f4' }}>계약 ID</td>
                  <td style={{ border: '1px solid #ddd', padding: '8px' }}>{cid}</td>
                </tr>
                <tr>
                  <td style={{ border: '1px solid #ddd', padding: '8px', fontWeight: 'bold', backgroundColor: '#f4f4f4' }}>회사</td>
                  <td style={{ border: '1px solid #ddd', padding: '8px' }}>{companyName}</td>
                </tr>
                <tr>
                  <td style={{ border: '1px solid #ddd', padding: '8px', fontWeight: 'bold', backgroundColor: '#f4f4f4' }}>상품명</td>
                  <td style={{ border: '1px solid #ddd', padding: '8px' }}>{productName}</td>
                </tr>
                <tr>
                  <td style={{ border: '1px solid #ddd', padding: '8px', fontWeight: 'bold', backgroundColor: '#f4f4f4' }}>수량</td>
                  <td style={{ border: '1px solid #ddd', padding: '8px' }}>{inboundQuantity}</td>
                </tr>
                <tr>
                  <td style={{ border: '1px solid #ddd', padding: '8px', fontWeight: 'bold', backgroundColor: '#f4f4f4' }}>창고위치</td>
                  <td style={{ border: '1px solid #ddd', padding: '8px' }}>{warehouseLocation}</td>
                </tr>
                <tr>
                  <td style={{ border: '1px solid #ddd', padding: '8px', fontWeight: 'bold', backgroundColor: '#f4f4f4' }}>보관창고</td>
                  <td style={{ border: '1px solid #ddd', padding: '8px' }}>{warehouseType}</td>
                </tr>
                <tr>
                  <td style={{ border: '1px solid #ddd', padding: '8px', fontWeight: 'bold', backgroundColor: '#f4f4f4' }}>계약 날짜</td>
                  <td style={{ border: '1px solid #ddd', padding: '8px' }}>{contractDate || '계약 대기'}</td>
                </tr>
              </tbody>
            </table>

            <div style={{ textAlign: 'center', marginTop: '20px' }}>
              {barcodeUrl && (
                <div style={{ margin: '10px 0' }}>
                  <h4>바코드</h4>
                  <img 
                    src={barcodeUrl} 
                    alt="바코드" 
                    style={{
                      maxWidth: '250px',
                    }}
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

export default CustomerDetail;

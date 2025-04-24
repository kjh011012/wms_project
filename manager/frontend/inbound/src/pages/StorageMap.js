// src/StorageMap.js
import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { MapContainer, TileLayer, Marker, Popup } from "react-leaflet";
import axios from "axios";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import customIconUrl from '../components/location.png';

import '../index.css'

// 서버 주소 설정
const API_BASE = "http://34.64.211.3:5002";

// 기본 마커 아이콘 설정 (안하면 안 나옴)
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: require("leaflet/dist/images/marker-icon-2x.png"),
  iconUrl: require("leaflet/dist/images/marker-icon.png"),
  shadowUrl: require("leaflet/dist/images/marker-shadow.png"),
});

const locations = [
  { id: 1, name: "보관소 A", lat: 37.5665, lng: 126.9780 },
  { id: 2, name: "보관소 B", lat: 37.5700, lng: 126.9900 },
  { id: 3, name: "보관소 C", lat: 37.5800, lng: 126.9750 },
];


// ✅ 보관소 지도 페이지
export const StorageMap = () => {
  const navigate = useNavigate();
  const [slotData, setSlotData] = useState([]);
  const [unassignedData, setUnassignedData] = useState([]);
  const [selectedLocation, setSelectedLocation] = useState(null);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const fetchSlotInfo = async (locationId) => {
    try {
      const [slotsRes, unassignedRes] = await Promise.all([
        fetch(`http://34.64.211.3:5002/storage/slots/${locationId}`),
        fetch(`http://34.64.211.3:5002/storage/unassigned/${locationId}`)
      ]);
  
      const slots = await slotsRes.json();
      const unassigned = await unassignedRes.json();
  
      setSlotData(slots);
      setUnassignedData(unassigned);
    } catch (err) {
      console.error("📛 슬롯 정보 로드 실패:", err);
    }
  };

  const customIcon = new L.Icon({
    iconUrl: customIconUrl,
    iconSize: [30, 30],
    iconAnchor: [15, 42],
    popupAnchor: [0, -40],
  });


  return (
    <div style={styles.container}>
      <div style={styles.content}>
        <h2 style={styles.sectionTitle}>창고 현황</h2>
  
        <MapContainer
          center={[37.5665, 126.9780]}
          zoom={14}
          scrollWheelZoom={true}
          style={{ 
            height: "600px",
            width: "100%",
            borderRadius: "12px",
            boxShadow: "0 6px 12px rgba(0,0,0,0.1)",
            overflow: "hidden" }}
        >
          <TileLayer
            url="https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png"
            attribution='&copy; <a href="https://carto.com/">CARTO</a>'
          />
          {locations.map(loc => (
            <Marker
              key={loc.id}
              position={[loc.lat, loc.lng]}
              icon={customIcon}
              eventHandlers={{ click: () => fetchSlotInfo(loc.id) }}
            >
              <Popup className="custom-popup">
                <div style={{
                  padding: "10px",
                  textAlign: "center",
                  width: "150px",
                }}>
                  <h4 style={{
                    marginBottom: "12px",
                    fontSize: "16px",
                    color: "#6f47c5",
                    fontWeight: "bold"
                  }}>
                    📦 {loc.name}
                  </h4>
  
                  <div style={{
                    backgroundColor: "#e3ddff",
                    padding: "8px",
                    borderRadius: "6px",
                    marginBottom: "8px",
                    fontSize: "13px",
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "center"
                  }}>
                    <span>✅ 배정 슬롯</span>
                    <strong style={{ color: "#4a27c5" }}>
                      {slotData.filter(s => !s.available).length}개
                    </strong>
                  </div>

                  <div style={{
                    backgroundColor: "#e7f8ec",
                    padding: "8px",
                    borderRadius: "6px",
                    marginBottom: "10px",
                    fontSize: "13px",
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "center"
                  }}>
                    <span>✅ 남은 슬롯</span>
                    <strong style={{ color: "#4a27c5" }}>
                      {slotData.filter(s => s.available).length}개
                    </strong>
                  </div>
  
                  <div style={{
                    backgroundColor: "#ffe3e3",
                    padding: "8px",
                    borderRadius: "6px",
                    marginBottom: "10px",
                    fontSize: "13px",
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "center"
                  }}>
                    <span>⛔ 미배정</span>
                    <strong style={{ color: "#c54242" }}>
                      {unassignedData.length}건
                    </strong>
                  </div>
  
                  <button
                    onClick={() => {
                      setSelectedLocation(loc);
                      setIsModalOpen(true);
                    }}
                    style={{
                      width: "100%",
                      padding: "6px 12px",
                      backgroundColor: "#6f47c5",
                      color: "white",
                      border: "none",
                      borderRadius: "6px",
                      fontSize: "13px",
                      cursor: "pointer",
                      boxShadow: "0px 2px 6px rgba(0, 0, 0, 0.15)"
                    }}
                  >
                    위치 지정
                  </button>
                </div>
              </Popup>
            </Marker>
          ))}
        </MapContainer>
  
        {/* 모달은 MapContainer 밖에 있어야 함 */}
        {isModalOpen && selectedLocation && (
          <div style={{
            position: 'fixed',
            top: 0, left: 0, right: 0, bottom: 0,
            backgroundColor: 'rgba(0,0,0,0.5)',
            zIndex: 1000,
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center'
          }}>
            <div style={styles.modalContent}>
              {/* 상단 헤더 (제목 + 닫기 버튼) */}
              <div style={styles.modalHeader}>
                <h3 style={styles.modalTitle}>📍 {selectedLocation.name}</h3>
                <button onClick={() => setIsModalOpen(false)} style={styles.closeButton}>
                  ×
                </button>
              </div>

              <StorageDetail locationId={selectedLocation.id} />
            </div>
          </div>
        )}
      </div>
    </div>
  );
}



// ✅ 물품 보관 현황 페이지
export const StorageDetail = ( { locationId }) => {
  const [slots, setSlots] = useState([]);
  const [unassignedItems, setUnassignedItems] = useState([]);
  const [selectedSlot, setSelectedSlot] = useState(null);
  const [showModal, setShowModal] = useState(false);


  // 실제 물품 조회
  useEffect(() => {
    axios.get(`${API_BASE}/storage/slots/${locationId}`)
    .then((res) => {
      console.log("📦 슬롯 데이터:", res.data);  // ✅ 콘솔로 확인
      setSlots(res.data);  // ✅ 올바른 상태에 데이터 저장
    })
    .catch((err) => console.error("슬롯 불러오기 실패:", err));
  }, [locationId]);

  // 🔹 빈 슬롯 클릭 시 실행: 배정 안 된 물품 불러오기 + 모달 열기
  const handleEmptySlotClick = async (slotIndex) => {
    setSelectedSlot(slotIndex);
    try {
      const res = await axios.get(`${API_BASE}/storage/unassigned/${locationId}`);
      setUnassignedItems(res.data);
      setShowModal(true);
    } catch (err) {
      console.error("할당 가능한 물품 불러오기 실패:", err);
    }
  };


  // 🔹 물품을 선택하면 해당 슬롯에 배정
  const handleAssign = async (product_name) => {
    try {
      await axios.post(`${API_BASE}/storage/assign`, {
        warehouse_num: `SLOT-${selectedSlot + 1}`,
        product_name,
        warehouse_location: `보관소 ${String.fromCharCode(64 + Number(locationId))}`
      });
      alert("슬롯 배정 완료");
      setShowModal(false);

      const refreshed = await axios.get(`${API_BASE}/storage/slots/${locationId}`);
      setSlots(refreshed.data);
    } catch (err) {
      alert("슬롯 저장 실패");
    }
  };

  return (
    <>
      <div style={styles.grid}>
        {slots.map((slot, idx) => (
          <div
            key={idx}
            style={{
              ...styles.slot,
              backgroundColor: slot.available ? "#6f8af7" : "#ff6b6b",
              cursor: slot.available ? "pointer" : "not-allowed",
              transform: slot.available ? "scale(1)" : "scale(0.98)",
            }}
            onClick={() => slot.available && handleEmptySlotClick(idx)}
          >
            {slot.available ? (
              <div>
                <span style={{ fontSize: "18px" }}>✅</span>
                <p style={{ margin: 0, fontWeight: 500 }}>이용 가능</p>
              </div>
            ) : (
              <div>
                <p style={{ margin: 0 }}>{slot.company_name}</p>
                <p style={{ margin: 0 }}>{slot.product_name}</p>
              </div>
            )}
          </div>
        ))}
      </div>

      {showModal && (
        <div style={styles.modal}>
          <h4 style={styles.modalTitle}>슬롯에 할당할 물품 선택</h4>
          <ul style={{ paddingLeft: 0 }}>
            {unassignedItems.map(item => (
              <li
                key={item.id}
                onClick={() => handleAssign(item.product_name)}
                style={styles.modalListItem}
              >
                {item.company_name} - {item.product_name}
              </li>
            ))}
          </ul>
          <button style={styles.closeButton} onClick={() => setShowModal(false)}>닫기</button>
        </div>
      )}
    </>
  );
};


  const styles = {
    container: {
      padding: "20px",
    },
    content: {
      backgroundColor: "#ffffff",
      borderRadius: "8px",
      padding: "20px",
    },
    sectionTitle: {
      fontSize: "18px",
      fontWeight: "600",
      color: "#333",
      marginBottom: "15px",
      paddingBottom: "10px",
      borderBottom: "2px solid #6f47c5",
    },
    grid: {
      display: "grid",
      gridTemplateColumns: "repeat(3, 1fr)",
      gap: "16px",
      marginTop: "20px",
      padding: "10px",
    },
    slot: {
      height: "120px",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center",
      borderRadius: "16px",
      color: "#fff",
      fontWeight: "600",
      fontSize: "14px",
      textAlign: "center",
      padding: "16px",
      whiteSpace: "pre-wrap",
      boxShadow: "0 4px 12px rgba(0, 0, 0, 0.1)",
      transition: "all 0.25s ease-in-out",
      userSelect: "none",
    },
    modalContent: {
      backgroundColor: 'white',
      padding: '30px',
      borderRadius: '10px',
      minWidth: '400px',
      position: 'relative',
      boxShadow: '0 8px 20px rgba(0,0,0,0.2)',
    },
    modalHeader: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center',
      marginBottom: '20px',
    },
    modalTitle: {
      color: '#6f47c5',
      fontSize: '18px',
      fontWeight: 'bold',
      margin: 0,
    },
    modalListItem: {
      cursor: "pointer",
      padding: "8px",
      borderBottom: "1px solid #eee",
      fontSize: "14px",
      transition: "background 0.2s ease",
    },
    closeButton: {
      border: 'none',
      backgroundColor: '#6f47c5',
      color: 'white',
      fontSize: '16px',
      fontWeight: 'bold',
      borderRadius: '50%',
      width: '30px',
      height: '30px',
      lineHeight: '30px',
      textAlign: 'center',
      cursor: 'pointer',
      boxShadow: '0 2px 6px rgba(0, 0, 0, 0.15)'
    },
  };
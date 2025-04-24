import React from "react";
import {Routes, Route } from "react-router-dom";
import Base from "./components/Base";
import CustomerMainPage from "./pages/CustomerMainPage";

const App = () => {
  return (
    <Base>
      <Routes>
        {/* 입고 현황 페이지 */}
        <Route path="/user/CustomerMainPage" element={<CustomerMainPage />} />
      </Routes>
    </Base>
  );
};

export default App;

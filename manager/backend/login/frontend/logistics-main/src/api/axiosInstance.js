import axios from "axios";

const API = axios.create({
  baseURL: process.env.REACT_APP_API_URL,
  withCredentials: true,
});

let isRefreshing = false;
let failedQueue = [];

// 자동 재발급을 실패한 요청을 재시도하는 로직
API.interceptors.response.use(
    response => response,
    async error => {
      const originalRequest = error.config;

      // accessToken 만료 + 재시도 안한 경우
      if (
          error.response?.status === 401 &&
          !originalRequest._retry &&
          !originalRequest.url.includes("/reissue")
      ) {
        if (isRefreshing) {
          return new Promise((resolve, reject) => {
            failedQueue.push({ resolve, reject });
          })
          .then(() => API(originalRequest))
          .catch(err => Promise.reject(err));
        }

        originalRequest._retry = true;

        try {
            await API.post("/reissue");

            console.log("accessToken 자동 재발급 성공");

            // 재발급 후 원래 요청 재시도
            return API(originalRequest);
        } catch (refreshErr) {
            console.warn("accessToken 재발급 실패");
            alert("로그인 세션이 만료되었습니다. 다시 로그인해주세요.");
            window.location.href = "http://34.64.211.3:3000/"; // 재발급 실패 → 로그인 페이지로
            return Promise.reject(refreshErr);
        }
        finally {
        isRefreshing = false;
      }
      }

      return Promise.reject(error);
    }
);

export default API;

from flask import Blueprint, request, jsonify
import mysql.connector

bp_outbound_approve = Blueprint('outbound_approve', __name__)

db_config = {
    'host': 'localhost',
    'user': 'wms',
    'password': '1234',
    'database': 'backend',
    'charset': 'utf8'
}

@bp_outbound_approve.route('/api/outbound/approve', methods=['POST'])
def approve_outbound():
    data = request.get_json()
    barcode_num = data.get('barcode_num')

    if not barcode_num:
        return jsonify({"error": "barcode_num is required"}), 400

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        # ✅ Smart_Phone_Outbound 상태 업데이트
        cursor.execute("""
            UPDATE Smart_Phone_Outbound
            SET outbound_status = '출고 준비중'
            WHERE barcode_num = %s
        """, (barcode_num,))

        # ✅ MainTable 상태도 함께 업데이트
        cursor.execute("""
            UPDATE MainTable
            SET outbound_status = '출고 준비중'
            WHERE barcode_num = %s
        """, (barcode_num,))

        conn.commit()

        if cursor.rowcount == 0:
            return jsonify({"error": "해당 바코드 출고 요청이 없습니다."}), 404

        return jsonify({"message": "출고 준비중으로 상태 변경 완료 (Smart_Phone_Outbound + MainTable)"}), 200

    except Exception as e:
        print("Error:", e)
        return jsonify({"error": str(e)}), 500

    finally:
        cursor.close()
        conn.close()

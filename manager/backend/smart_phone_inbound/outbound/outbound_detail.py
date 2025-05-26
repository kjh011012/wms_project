#Smart_Phone_Outbound테이블에서 정보 로드
from flask import Blueprint, request, jsonify
import mysql.connector

bp_outbound_detail = Blueprint('outbound_detail', __name__)

db_config = {
    'host': 'localhost',
    'user': 'wms',
    'password': '1234',
    'database': 'backend',
    'charset': 'utf8'
}

@bp_outbound_detail.route('/api/outbound/request-detail', methods=['GET'])
def get_outbound_detail():
    barcode_num = request.args.get('barcode')

    if not barcode_num:
        return jsonify({"error": "barcode is required"}), 400

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT id, company_name, contact_person, contact_phone, address,
                   weight, width_size, length_size,
                   warehouse_type, category, warehouse_num,
                   barcode, barcode_num, outbound_status,
                   contract_date, last_outbound_date, warehouse_location
            FROM Smart_Phone_Outbound
            WHERE barcode_num = %s
        """, (barcode_num,))

        outbound = cursor.fetchone()

        if not outbound:
            return jsonify({"error": "출고 요청 정보를 찾을 수 없습니다."}), 404

        return jsonify(outbound), 200

    except Exception as e:
        print("Error:", e)
        return jsonify({"error": str(e)}), 500

    finally:
        cursor.close()
        conn.close()

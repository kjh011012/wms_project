from flask import Blueprint, request, jsonify
import mysql.connector

bp_outbound_complete = Blueprint('outbound_complete', __name__)

db_config = {
    'host': 'localhost',
    'user': 'wms',
    'password': '1234',
    'database': 'backend',
    'charset': 'utf8'
}

@bp_outbound_complete.route('/api/outbound/completed-detail', methods=['GET'])
def completed_detail():
    id = request.args.get('id')
    if not id:
        return jsonify({"error": "ID required"}), 400

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Smart_Phone_Outbound WHERE id = %s", (id,))
    data = cursor.fetchone()
    conn.close()

    if not data:
        return jsonify({"error": "Not found"}), 404

    return jsonify(data)


@bp_outbound_complete.route('/api/outbound/completed-scan', methods=['GET'])
def completed_scan():
    barcode = request.args.get('barcode')
    if not barcode:
        return jsonify({"error": "Barcode required"}), 400

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Smart_Phone_Outbound WHERE barcode_num = %s", (barcode,))
    data = cursor.fetchone()
    conn.close()

    if not data:
        return jsonify({"error": "Not found"}), 404

    return jsonify(data)


@bp_outbound_complete.route('/api/outbound/complete-outbound', methods=['POST'])
def complete_outbound():
    data = request.get_json()
    barcode_num = data.get('barcode_num')
    if not barcode_num:
        return jsonify({"error": "barcode_num required"}), 400

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    # Smart_Phone_Outbound 업데이트
    cursor.execute("""
        UPDATE Smart_Phone_Outbound
        SET outbound_status = '출고완료'
        WHERE barcode_num = %s
    """, (barcode_num,))

    # MainTable도 함께 업데이트
    cursor.execute("""
        UPDATE MainTable
        SET outbound_status = '출고완료'
        WHERE barcode_num = %s
    """, (barcode_num,))

    conn.commit()
    conn.close()

    return jsonify({"message": "출고 완료 처리 완료"}), 200


@bp_outbound_complete.route('/api/outbound/completed-list', methods=['GET'])
def completed_list():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT 
                id,
                barcode_num,
                company_name,
                contact_person,
                contact_phone,
                category,
                warehouse_type
            FROM Smart_Phone_Outbound
            WHERE outbound_status = '배차 완료'
            ORDER BY id DESC
        """)

        rows = cursor.fetchall()
        return jsonify(rows)

    except Exception as e:
        print('❌ 출고 완료 리스트 조회 실패:', e)
        return jsonify({"error": "Server error"}), 500

    finally:
        cursor.close()
        conn.close()

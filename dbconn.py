
import pg8000

host     = "ec2-23-23-221-255.compute-1.amazonaws.com"
port     = 5432
database = "d9d7poqlk91cai"
username = "vldxsnrxvnvabm"
password = "dd6febbadd69166681fd04fbfd96b54efd145f4419156bd71a7edc3d4b968a07"


def get_all_messages():
	conn = pg8000.connect(host=host, port=port, database=database, 
		user=username, password=password, ssl=True)

	cursor  = conn.cursor()
	sql_cmd = "select * from messages;"

	cursor.execute(sql_cmd)
	query_results = cursor.fetchall()
	results = []

	for item in query_results:
		message = {
			"mid": item[0],
			"content": item[1],
			"posttime": item[2],
			"uid": item[3]
		}
		results.append(message)

	cursor.close()
	conn.close()
	return results

print(get_all_messages())
import socket
import re

pattern = re.compile(r'[A-Z]:\\.*?>')
def recv_end(the_socket):
    total_data = []
    data = b''
    while True:
            data = the_socket.recv(1024)
            #print(data)
            if not data:
                raise ConnectionAbortedError
            data = str(data, encoding = 'gbk')
            total_data.append(data)
            if pattern.search(data, re.M):
                break
            if len(total_data) > 1:
                last_pair = total_data[-2] + total_data[-1]
                if pattern.search(last_pair, re.M):
                    break
    return ''.join(total_data)

# 建立一个服务端
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
port = 6999
server.bind(('192.168.41.1', port)) #绑定要监听的端口
server.listen(5) #开始监听 表示可以使用五个链接排队
while True:# conn就是客户端链接过来而在服务端为期生成的一个链接实例
    print('------------Listening on {}------------'.format(port))
    conn, addr = server.accept() #等待链接,多个链接的时候就会出现问题,其实返回了两个值
    print(conn)
    while True:
        try:
            se = input(recv_end(conn))
            if not se:
                se = '\r\n'
            #print(bytes(se, encoding = "utf8"))
            conn.send(bytes(se, encoding = 'utf-8')) #然后再发送数据
        except BaseException as e:
            print('\n' + addr[0] + ':' + str(addr[1]) + '已关闭')
            break
    conn.close()           # 关闭连接
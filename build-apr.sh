cd apr-1.5.2
./configure --with-apr=/usr/local/apr 
make 
make install

wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-connectors/native/1.1.34/source/tomcat-native-1.1.34-src.tar.gz
tar -xzf tomcat-native-1.1.34-src.tar.gz
cd tomcat-native-1.1.34-src/jni/native
./configure --with-apr=/usr/local/apr --with-java-home=/usr/lib/jvm/java-7-openjdk-amd64/ --with-ssl=yes
make 
make install


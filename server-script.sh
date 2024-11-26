sudo yum install java-17-amazon-corretto-devel -y
sudo yum install git -y
curl -O https://downloads.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
tar -xvf apache-maven-3.9.4-bin.tar.gz
sudo mv apache-maven-3.9.4 /usr/local/maven
echo 'export PATH=/usr/local/maven/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sandeep-kandukuri/addressbook.git
cd /home/ec2-user/addressbook
mvn test
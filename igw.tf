#web
#Step 3: Creation of Internet Gateway
#IGW creation

resource "aws_internet_gateway" "BluePeak-gateway" {

  vpc_id = aws_vpc.BluePeak.id

}
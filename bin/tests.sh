#!/bin/bash
python3.6 -c 'from remotepixel_tiler import __version__ as rpix_version; print(rpix_version)'

echo "Test Landsat-8"
echo "/bounds: " && python3.6 -c 'from remotepixel_tiler.landsat import APP; resp = APP({"path": "/bounds/LC80230312016320LGN00", "queryStringParameters": {"access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/metadata: " && python3.6 -c 'from remotepixel_tiler.landsat import APP; resp = APP({"path": "/metadata/LC80230312016320LGN00", "queryStringParameters": {"pmin":"2", "pmax":"99.8", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/tiles (expr): " && python3.6 -c 'from remotepixel_tiler.landsat import APP; resp = APP({"path": "/tiles/LC80230312016320LGN00/8/65/94.png", "queryStringParameters": {"expr":"(b5-b4)/(b5+b4)", "rescale":"-1,1", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/tiles (bands): " && python3.6 -c 'from remotepixel_tiler.landsat import APP; resp = APP({"path": "/tiles/LC80230312016320LGN00/8/65/94.png", "queryStringParameters": {"bands":"5,3,2", "color_ops":"gamma RGB 3", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'

echo
echo "Test CBERS-4"
echo "/search: " && AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.cbers import APP; resp = APP({"path": "/search", "queryStringParameters": {"row": "057", "path": "094", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/bounds: " && AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.cbers import APP; resp = APP({"path": "/bounds/CBERS_4_MUX_20171121_057_094_L2", "queryStringParameters": {"access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/metadata: " && AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.cbers import APP; resp = APP({"path": "/metadata/CBERS_4_MUX_20171121_057_094_L2", "queryStringParameters": {"pmin":"2", "pmax":"99.8", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/tiles (expr): " &&  AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.cbers import APP; resp = APP({"path": "/tiles/CBERS_4_MUX_20171121_057_094_L2/10/664/495.png", "queryStringParameters": {"expr":"(b8-b7)/(b8+b7)", "rescale":"-1,1","access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/tiles (bands): " && AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.cbers import APP; resp = APP({"path": "/tiles/CBERS_4_MUX_20171121_057_094_L2/10/664/495.png", "queryStringParameters": {"bands":"7,5,5", "color_ops":"gamma RGB 3", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'

echo
echo "Test COGEO"
echo "/bounds: " && python3.6 -c 'from remotepixel_tiler.cogeo import APP; resp = APP({"path": "/bounds", "queryStringParameters": {"url": "https://oin-hotosm.s3.amazonaws.com/5ac626e091b5310010e0d482/0/5ac626e091b5310010e0d483.tif"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/metadata: " && python3.6 -c 'from remotepixel_tiler.cogeo import APP; resp = APP({"path": "/metadata", "queryStringParameters": {"url": "https://oin-hotosm.s3.amazonaws.com/5ac626e091b5310010e0d482/0/5ac626e091b5310010e0d483.tif"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/tiles (expr): " && python3.6 -c 'from remotepixel_tiler.cogeo import APP; resp = APP({"path": "/tiles/19/319379/270522.png", "queryStringParameters": {"url": "https://oin-hotosm.s3.amazonaws.com/5ac626e091b5310010e0d482/0/5ac626e091b5310010e0d483.tif", "expr":"(b3-b2)/(b3+b2)", "rescale":"-1,1"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/tiles (bands): " && python3.6 -c 'from remotepixel_tiler.cogeo import APP; resp = APP({"path": "/tiles/19/319379/270522.png", "queryStringParameters": {"url": "https://oin-hotosm.s3.amazonaws.com/5ac626e091b5310010e0d482/0/5ac626e091b5310010e0d483.tif"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'

echo
echo "Test Sentinel-2"
echo "/bounds: " && AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.sentinel import APP; resp = APP({"path": "/s2/bounds/S2A_tile_20161202_16SDG_0", "queryStringParameters": {"access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/metadata: " && AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.sentinel import APP; resp = APP({"path": "/s2/metadata/S2A_tile_20161202_16SDG_0", "queryStringParameters": {"pmin":"2", "pmax":"99.8", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'
echo "/tiles: " && AWS_REQUEST_PAYER="requester" python3.6 -c 'from remotepixel_tiler.sentinel import APP; resp = APP({"path": "/s2/tiles/S2A_tile_20161202_16SDG_0/10/262/397.png", "queryStringParameters": {"bands":"04,03,02", "color_ops":"gamma RGB 3", "access_token": "yo"}, "pathParameters": "null", "requestContext": "null", "httpMethod": "GET", "headers": {}}, None); print("OK") if resp["statusCode"] == 200 else print("NOK")'

echo "Done"
#testmode = "verbose"
testmode = "quiet"

echo on;

test("testComputeCostGrad", testmode)
test("testFeatureNormalize", testmode)
test("testSigmoid", testmode)
test("testPredict", testmode)
test("testGradientDescent", testmode)
test("testExecuteModel", testmode)

echo off;
  
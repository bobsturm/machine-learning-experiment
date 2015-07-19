#testmode = "verbose"
testmode = "quiet"

echo on;

test("testComputeCostInputValidation", testmode)
test("testComputeCostGrad", testmode)
test("testFeatureNormalize", testmode)
test("testSigmoid", testmode)
test("testPredictLinear", testmode)
test("testPredictLogistic", testmode)
test("testGradientDescent", testmode)
test("testExecuteModel", testmode)
test("testCostFunctionLinReg", testmode)
test("testCostFunctionLogReg", testmode)

echo off;
  
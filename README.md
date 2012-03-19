
## stack

* in - 16 bit 輸入
* out - 16 bit 輸出
* reset - 堆疊清空
* clk - 時脈
* method - 
    * `1'b1` - push
    * `1'b0` - pop
* in_valid
* out_valid

測資是 `stack_bench.v`

## alu

### alu( CLK, reset, in_valid, A, B, op, out );
* CLK       - 無用
* reset     - 可省
* in_valid  - 顧名思義

##### 運算式 A @ B
* A         - A
* B         - B
* op        - operator @
* out       - output

###### there is not out_valid

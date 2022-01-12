package com.example.common;

import lombok.Data;

import java.io.Serializable;

@Data
public class Result implements Serializable {
    private Integer code;
    private String msg;
    private Object data;

    public static Result success(Integer code, String msg, Object data) {
        Result r = new Result();
        r.setCode(code);
        r.setMsg(msg);
        r.setData(data);
        return r;
    }

    public static Result error(Integer code, String msg, Object data) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }

    public static Result success(Object data) {
        return success(200, "操作成功", data);
    }

    public static Result error(String msg) {
        return error(400, msg, null);
    }

    public static Result error(Integer code, String msg) {
        return error(code, msg, null);
    }
}

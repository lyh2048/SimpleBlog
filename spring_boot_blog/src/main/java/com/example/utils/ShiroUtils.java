package com.example.utils;

import com.example.shiro.AccountProfile;
import org.apache.shiro.SecurityUtils;

public class ShiroUtils {
    public static AccountProfile getAccountProfile() {
        return (AccountProfile) SecurityUtils.getSubject().getPrincipal();
    }
}

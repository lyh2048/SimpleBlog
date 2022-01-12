package com.example.shiro;

import com.example.entity.User;
import com.example.service.UserService;
import com.example.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Slf4j
@Component
public class AccountRealm extends AuthorizingRealm {
    @Resource
    private JwtUtils jwtUtils;
    @Resource
    private UserService userService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        JwtToken jwt = (JwtToken) token;
        String userId = jwtUtils.getClaimByToken((String) jwt.getPrincipal()).getSubject();
        User user = userService.getById(Long.parseLong(userId));
        if (user == null) {
            throw new UnknownAccountException("账号不存在");
        }
        if (user.getStatus() == -1) {
            throw new LockedAccountException("账号已经被禁用");
        }
        AccountProfile profile = new AccountProfile();
        BeanUtils.copyProperties(user, profile);
        return new SimpleAuthenticationInfo(profile, jwt.getCredentials(), getName());
    }
}

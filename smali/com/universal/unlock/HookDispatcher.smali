.class public Lcom/universal/unlock/HookDispatcher;
.super Ljava/lang/Object;
.source "HookDispatcher.java"

# This class dispatches hooks to common login method names

.method public constructor <init>()V
    .locals 0
    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    
    return-void
.end method

# Universal method — returns true for any boolean check
.method public static check()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Universal string response
.method public static response()Ljava/lang/String;
    .locals 1
    
    const-string v0, "{\"code\":0,\"status\":\"success\",\"key\":\"12947-ffmax\",\"expiry\":\"9999999999\",\"days\":999999,\"vip\":true,\"premium\":true}"
    
    return-object v0
.end method

# Universal int response
.method public static number()I
    .locals 1
    
    const v0, 0x7fffffff
    
    return v0
.end method

# Detect if method name matches auth pattern
.method public static matches(Ljava/lang/String;)Z
    .locals 5
    
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    
    move-result-object v0
    
    # Patterns to match
    const-string v1, "login"
    const-string v2, "auth"
    const-string v3, "verify"
    const-string v4, "validate"
    
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v1
    
    if-nez v1, :cond_login
    
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v2
    
    if-nez v2, :cond_login
    
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v3
    
    if-nez v3, :cond_login
    
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v4
    
    if-nez v4, :cond_login
    
    const/4 v0, 0x0
    
    return v0
    
    :cond_login
    const/4 v0, 0x1
    
    return v0
.end method
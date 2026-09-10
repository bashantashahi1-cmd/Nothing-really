.class public Lcom/universal/unlock/AutoInject;
.super Landroid/app/Application;
.source "AutoInject.java"

# This class gets injected into the target app's Application
# It runs on app startup and patches what it can

.field private static context:Landroid/content/Context;

.method public constructor <init>()V
    .locals 0
    
    invoke-direct {p0}, Landroid/app/Application;-><init>()V
    
    return-void
.end method

.method public onCreate()V
    .locals 3
    
    invoke-super {p0}, Landroid/app/Application;->onCreate()V
    
    invoke-virtual {p0}, Lcom/universal/unlock/AutoInject;->getApplicationContext()Landroid/content/Context;
    
    move-result-object v0
    
    sput-object v0, Lcom/universal/unlock/AutoInject;->context:Landroid/content/Context;
    
    # Write universal values to SharedPreferences
    invoke-static {v0}, Lcom/universal/unlock/AutoInject;->injectPrefs(Landroid/content/Context;)V
    
    # Patch system properties
    invoke-static {}, Lcom/universal/unlock/AutoInject;->injectProps()V
    
    return-void
.end method

.method private static injectPrefs(Landroid/content/Context;)V
    .locals 10
    
    const-string v0, "user_prefs"
    
    const/4 v1, 0x0
    
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    
    move-result-object v0
    
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    
    move-result-object v0
    
    # Key
    const-string v1, "key"
    
    const-string v2, "12947-ffmax"
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    
    # Token
    const-string v1, "token"
    
    const-string v2, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.UNIVERSAL.UNLIMITED"
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    
    # Expiry
    const-string v1, "expiry"
    
    const-string v2, "9999999999"
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    
    # Days
    const-string v1, "days"
    
    const v2, 0x7fffffff
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    
    # VIP
    const-string v1, "is_vip"
    
    const/4 v2, 0x1
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    
    # Premium
    const-string v1, "is_premium"
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    
    # Logged in
    const-string v1, "is_logged_in"
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    
    # Username
    const-string v1, "username"
    
    const-string v2, "FFMAX-UNLIMITED"
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    
    # User ID
    const-string v1, "user_id"
    
    const-string v2, "12947"
    
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    
    # Apply
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    
    return-void
.end method

.method private static injectProps()V
    .locals 3
    
    # Set system properties that apps might check
    const-string v0, "ro.universal.unlock"
    
    const-string v1, "12947-ffmax"
    
    :try_start
    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    
    const-string v0, "ro.ffmax.unlimited"
    
    const-string v1, "true"
    
    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :catch_ignore
    
    goto :goto_end
    
    :catch_ignore
    move-exception v0
    
    :goto_end
    return-void
.end method

# Universal auth check — call from anywhere
.method public static auth()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Get key
.method public static getKey()Ljava/lang/String;
    .locals 1
    
    const-string v0, "12947-ffmax"
    
    return-object v0
.end method
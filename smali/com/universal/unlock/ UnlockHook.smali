.class public Lcom/universal/unlock/UnlockHook;
.super Ljava/lang/Object;
.source "UnlockHook.java"

# Static fields
.field private static final KEY:Ljava/lang/String; = "12947-ffmax"

.field private static final EXPIRY:Ljava/lang/String; = "9999999999"

.field private static final TOKEN:Ljava/lang/String; = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.UNIVERSAL.UNLIMITED"

.field private static isUnlocked:Z

.method static constructor <clinit>()V
    .locals 1
    
    const/4 v0, 0x1
    
    sput-boolean v0, Lcom/universal/unlock/UnlockHook;->isUnlocked:Z
    
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    
    return-void
.end method

# Check if input key matches universal key
.method public static checkKey(Ljava/lang/String;)Z
    .locals 2
    
    const-string v0, "12947-ffmax"
    
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    
    move-result v0
    
    if-nez v0, :cond_match
    
    const/4 v0, 0x0
    
    return v0
    
    :cond_match
    const/4 v0, 0x1
    
    return v0
.end method

# Return universal key
.method public static getKey()Ljava/lang/String;
    .locals 1
    
    const-string v0, "12947-ffmax"
    
    return-object v0
.end method

# Always return unlocked
.method public static isUnlocked()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Never expires
.method public static getExpiry()Ljava/lang/String;
    .locals 1
    
    const-string v0, "9999999999"
    
    return-object v0
.end method

# Never expired
.method public static isExpired()Z
    .locals 1
    
    const/4 v0, 0x0
    
    return v0
.end method

# Valid token
.method public static getToken()Ljava/lang/String;
    .locals 1
    
    const-string v0, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.UNIVERSAL.UNLIMITED"
    
    return-object v0
.end method

# Valid session
.method public static isValidSession()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Days remaining — unlimited
.method public static getDaysRemaining()I
    .locals 1
    
    const v0, 0x7fffffff
    
    return v0
.end method

# User ID
.method public static getUserId()Ljava/lang/String;
    .locals 1
    
    const-string v0, "12947"
    
    return-object v0
.end method

# Username
.method public static getUsername()Ljava/lang/String;
    .locals 1
    
    const-string v0, "FFMAX-UNLIMITED"
    
    return-object v0
.end method

# VIP status
.method public static isVip()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Premium status
.method public static isPremium()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Subscription active
.method public static isSubscribed()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# License valid
.method public static isLicenseValid()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Get any string field by name — returns universal values
.method public static getField(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    
    const-string v0, "key"
    
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v0
    
    if-eqz v0, :cond_not_key
    
    const-string v0, "12947-ffmax"
    
    return-object v0
    
    :cond_not_key
    const-string v0, "token"
    
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v0
    
    if-eqz v0, :cond_not_token
    
    const-string v0, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.UNIVERSAL.UNLIMITED"
    
    return-object v0
    
    :cond_not_token
    const-string v0, "expir"
    
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v0
    
    if-eqz v0, :cond_not_expiry
    
    const-string v0, "9999999999"
    
    return-object v0
    
    :cond_not_expiry
    const-string v0, "user"
    
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    
    move-result v0
    
    if-eqz v0, :cond_not_user
    
    const-string v0, "FFMAX-UNLIMITED"
    
    return-object v0
    
    :cond_not_user
    const-string v0, ""
    
    return-object v0
.end method

# Get any boolean field by name — returns true
.method public static getBoolField(Ljava/lang/String;)Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Get any int field by name — returns max
.method public static getIntField(Ljava/lang/String;)I
    .locals 1
    
    const v0, 0x7fffffff
    
    return v0
.end method

# Universal bypass — always true
.method public static bypass()Z
    .locals 1
    
    const/4 v0, 0x1
    
    return v0
.end method

# Empty response — success
.method public static successResponse()Ljava/lang/String;
    .locals 1
    
    const-string v0, "{\"code\":0,\"status\":\"success\",\"message\":\"Access Granted\",\"expiry\":\"9999999999\",\"days\":999999}"
    
    return-object v0
.end method
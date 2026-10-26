-- ==========================================
-- MENU ARCEUS + INFINITE YIELD
-- ==========================================
local SenhaCorreta = "2510"
local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Cam = workspace.CurrentCamera

-- Remove GUI antiga
local old = Player.PlayerGui:FindFirstChild("MenuArceus")
if old then old:Destroy() end

-- Cria GUI PRIMEIRO
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MenuArceus"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- ==========================================
-- TELA DE SENHA (INTACTA)
-- ==========================================
local FrameSenha = Instance.new("Frame")
FrameSenha.Size = UDim2.new(0, 300, 0, 350)
FrameSenha.Position = UDim2.new(0.5, -150, 0.5, -175)
FrameSenha.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FrameSenha.BorderSizePixel = 0
FrameSenha.Parent = ScreenGui

local UICornerSenha = Instance.new("UICorner")
UICornerSenha.CornerRadius = UDim.new(0, 12)
UICornerSenha.Parent = FrameSenha

local TituloSenha = Instance.new("TextLabel")
TituloSenha.Size = UDim2.new(1, 0, 0, 50)
TituloSenha.Position = UDim2.new(0, 0, 0, 20)
TituloSenha.Text = "🔒 MENU ARCEUS"
TituloSenha.BackgroundTransparency = 1
TituloSenha.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloSenha.Font = Enum.Font.SourceSansBold
TituloSenha.TextSize = 24
TituloSenha.Parent = FrameSenha

local InputSenha = Instance.new("TextBox")
InputSenha.Size = UDim2.new(0.8, 0, 0, 45)
InputSenha.Position = UDim2.new(0.1, 0, 0.5, -25)
InputSenha.PlaceholderText = "Digite a senha..."
InputSenha.Text = ""
InputSenha.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InputSenha.BackgroundTransparency = 0.35
InputSenha.TextColor3 = Color3.fromRGB(255, 255, 255)
InputSenha.Font = Enum.Font.SourceSansBold
InputSenha.TextSize = 22
InputSenha.Parent = FrameSenha

local BotaoEntrar = Instance.new("TextButton")
BotaoEntrar.Size = UDim2.new(0.8, 0, 0, 45)
BotaoEntrar.Position = UDim2.new(0.1, 0, 0.65, 0)
BotaoEntrar.Text = "ENTRAR"
BotaoEntrar.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
BotaoEntrar.TextColor3 = Color3.fromRGB(255, 255, 255)
BotaoEntrar.Font = Enum.Font.SourceSansBold
BotaoEntrar.TextSize = 22
BotaoEntrar.Parent = FrameSenha

local TextoErro = Instance.new("TextLabel")
TextoErro.Size = UDim2.new(1, 0, 0, 25)
TextoErro.Position = UDim2.new(0, 0, 0.88, 0)
TextoErro.Text = "❌ Senha Incorreta!"
TextoErro.TextColor3 = Color3.fromRGB(255, 60, 60)
TextoErro.BackgroundTransparency = 1
TextoErro.Font = Enum.Font.SourceSansBold
TextoErro.TextSize = 18
TextoErro.Visible = false
TextoErro.Parent = FrameSenha

-- ==========================================
-- MENU PRINCIPAL
-- ==========================================
local FrameMenu = Instance.new("Frame")
FrameMenu.Size = UDim2.new(0, 280, 0, 500)
FrameMenu.Position = UDim2.new(0.5, -140, 0.5, -250)
FrameMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
FrameMenu.BorderSizePixel = 0
FrameMenu.Visible = false
FrameMenu.Active = true
FrameMenu.Draggable = true
FrameMenu.Parent = ScreenGui

local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 12)
UICornerMenu.Parent = FrameMenu

-- ==========================================
-- BARRA DE TÍTULO COM BOTÕES (NOVO)
-- ==========================================
local BarraTituloMenu = Instance.new("Frame")
BarraTituloMenu.Size = UDim2.new(1, 0, 0, 45)
BarraTituloMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
BarraTituloMenu.BorderSizePixel = 0
BarraTituloMenu.Parent = FrameMenu

local UICornerTitulo = Instance.new("UICorner")
UICornerTitulo.CornerRadius = UDim.new(0, 12)
UICornerTitulo.Parent = BarraTituloMenu

local TituloMenu = Instance.new("TextLabel")
TituloMenu.Size = UDim2.new(1, -90, 1, 0)
TituloMenu.Position = UDim2.new(0, 10, 0, 0)
TituloMenu.Text = "⚡ MENU ARCEUS ⚡"
TituloMenu.BackgroundTransparency = 1
TituloMenu.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloMenu.Font = Enum.Font.SourceSansBold
TituloMenu.TextSize = 18
TituloMenu.TextXAlignment = Enum.TextXAlignment.Left
TituloMenu.Parent = BarraTituloMenu

-- Botão MINIMIZAR (com animação de toque)
local BotaoMinimizar = Instance.new("TextButton")
BotaoMinimizar.Size = UDim2.new(0, 35, 0, 35)
BotaoMinimizar.Position = UDim2.new(1, -85, 0.5, -17)
BotaoMinimizar.Text = "➖"
BotaoMinimizar.BackgroundColor3 = Color3.fromRGB(200, 160, 0)
BotaoMinimizar.TextColor3 = Color3.fromRGB(255, 255, 255)
BotaoMinimizar.Font = Enum.Font.SourceSansBold
BotaoMinimizar.TextSize = 18
BotaoMinimizar.AutoButtonColor = false
BotaoMinimizar.ZIndex = 5
BotaoMinimizar.Parent = BarraTituloMenu

local UICornerMin = Instance.new("UICorner")
UICornerMin.CornerRadius = UDim.new(0, 8)
UICornerMin.Parent = BotaoMinimizar

-- Botão FECHAR (com animação de toque)
local BotaoFechar = Instance.new("TextButton")
BotaoFechar.Size = UDim2.new(0, 35, 0, 35)
BotaoFechar.Position = UDim2.new(1, -45, 0.5, -17)
BotaoFechar.Text = "✖"
BotaoFechar.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
BotaoFechar.TextColor3 = Color3.fromRGB(255, 255, 255)
BotaoFechar.Font = Enum.Font.SourceSansBold
BotaoFechar.TextSize = 20
BotaoFechar.AutoButtonColor = false
BotaoFechar.ZIndex = 5
BotaoFechar.Parent = BarraTituloMenu

local UICornerFechar = Instance.new("UICorner")
UICornerFechar.CornerRadius = UDim.new(0, 8)
UICornerFechar.Parent = BotaoFechar

-- Botão flutuante para reabrir (quando minimizado)
local BotaoReabrir = Instance.new("TextButton")
BotaoReabrir.Size = UDim2.new(0, 60, 0, 60)
BotaoReabrir.Position = UDim2.new(0, 20, 0.5, -30)
BotaoReabrir.Text = "⚡"
BotaoReabrir.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
BotaoReabrir.TextColor3 = Color3.fromRGB(255, 255, 255)
BotaoReabrir.Font = Enum.Font.SourceSansBold
BotaoReabrir.TextSize = 30
BotaoReabrir.AutoButtonColor = false
BotaoReabrir.Visible = false
BotaoReabrir.Active = true
BotaoReabrir.Draggable = true
BotaoReabrir.Parent = ScreenGui

local UICornerReabrir = Instance.new("UICorner")
UICornerReabrir.CornerRadius = UDim.new(1, 0)
UICornerReabrir.Parent = BotaoReabrir

-- Animação de toque genérica
local function AnimacaoToque(botao, tamanhoNormal, posicaoNormal)
    local t1 = TweenService and nil
    -- Se não tiver TweenService, faz manual
    local Tween = game:GetService("TweenService")
    Tween:Create(botao, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
        Size = UDim2.new(tamanhoNormal.X.Scale * 0.9, tamanhoNormal.X.Offset, 0, tamanhoNormal.Y.Offset - 4)
    }):Play()
    task.wait(0.08)
    Tween:Create(botao, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = tamanhoNormal
    }):Play()
end

-- Ação MINIMIZAR
BotaoMinimizar.MouseButton1Click:Connect(function()
    local Tween = game:GetService("TweenService")
    Tween:Create(BotaoMinimizar, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -82, 0.5, -15)
    }):Play()
    task.wait(0.1)
    Tween:Create(BotaoMinimizar, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(1, -85, 0.5, -17)
    }):Play()

    FrameMenu.Visible = false
    BotaoReabrir.Visible = true
end)

-- Ação FECHAR
BotaoFechar.MouseButton1Click:Connect(function()
    local Tween = game:GetService("TweenService")
    Tween:Create(BotaoFechar, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -42, 0.5, -15)
    }):Play()
    task.wait(0.1)
    Tween:Create(BotaoFechar, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(1, -45, 0.5, -17)
    }):Play()
    task.wait(0.1)
    ScreenGui:Destroy()
end)

-- Ação REABRIR
BotaoReabrir.MouseButton1Click:Connect(function()
    BotaoReabrir.Visible = false
    FrameMenu.Visible = true
end)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -20, 1, -65)
Scroll.Position = UDim2.new(0, 10, 0, 55)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 5
Scroll.CanvasSize = UDim2.new(0, 0, 0, 700)
Scroll.Parent = FrameMenu

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.Parent = Scroll

-- ==========================================
-- BOTÃO TOGGLE
-- ==========================================
local function CriarToggle(Nome, Callback)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, -10, 0, 38)
    B.Text = Nome .. " [OFF]"
    B.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.Font = Enum.Font.SourceSansBold
    B.TextSize = 16
    B.AutoButtonColor = false
    B.Parent = Scroll

    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 8)
    C.Parent = B

    local ativo = false
    B.MouseButton1Click:Connect(function()
        ativo = not ativo
        B.Text = Nome .. (ativo and " [ON]" or " [OFF]")
        B.BackgroundColor3 = ativo and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(60, 60, 70)
        pcall(Callback, ativo)
    end)
end

-- ==========================================
-- SLIDER
-- ==========================================
local function CriarSlider(Nome, Min, Max, Inicial, Callback)
    local Cont = Instance.new("Frame")
    Cont.Size = UDim2.new(1, -10, 0, 60)
    Cont.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Cont.BorderSizePixel = 0
    Cont.Parent = Scroll

    local CC = Instance.new("UICorner")
    CC.CornerRadius = UDim.new(0, 8)
    CC.Parent = Cont

    local Lbl = Instance.new("TextLabel")
    Lbl.Size = UDim2.new(1, -20, 0, 25)
    Lbl.Position = UDim2.new(0, 10, 0, 5)
    Lbl.BackgroundTransparency = 1
    Lbl.Text = Nome .. ": " .. Inicial
    Lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    Lbl.Font = Enum.Font.SourceSansBold
    Lbl.TextSize = 15
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    Lbl.Parent = Cont

    local Barra = Instance.new("Frame")
    Barra.Size = UDim2.new(1, -20, 0, 10)
    Barra.Position = UDim2.new(0, 10, 0, 40)
    Barra.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    Barra.BorderSizePixel = 0
    Barra.Parent = Cont

    local CB = Instance.new("UICorner")
    CB.CornerRadius = UDim.new(0, 5)
    CB.Parent = Barra

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((Inicial - Min) / (Max - Min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    Fill.BorderSizePixel = 0
    Fill.Parent = Barra

    local CF = Instance.new("UICorner")
    CF.CornerRadius = UDim.new(0, 5)
    CF.Parent = Fill

    local Bol = Instance.new("TextButton")
    Bol.Size = UDim2.new(0, 20, 0, 20)
    Bol.Position = UDim2.new((Inicial - Min) / (Max - Min), -10, 0.5, -10)
    Bol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Bol.Text = ""
    Bol.AutoButtonColor = false
    Bol.Parent = Barra

    local CBo = Instance.new("UICorner")
    CBo.CornerRadius = UDim.new(1, 0)
    CBo.Parent = Bol

    local arrastando = false

    local function Atualizar(input)
        local pos = Barra.AbsolutePosition.X
        local larg = Barra.AbsoluteSize.X
        local pct = math.clamp((input.Position.X - pos) / larg, 0, 1)
        local val = math.floor(Min + (Max - Min) * pct)
        Fill.Size = UDim2.new(pct, 0, 1, 0)
        Bol.Position = UDim2.new(pct, -10, 0.5, -10)
        Lbl.Text = Nome .. ": " .. val
        pcall(Callback, val)
    end

    Bol.MouseButton1Down:Connect(function() arrastando = true end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            arrastando = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if arrastando and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            Atualizar(i)
        end
    end)
    Barra.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            arrastando = true
            Atualizar(i)
        end
    end)
end

-- ==========================================
-- LÓGICA DA SENHA
-- ==========================================
BotaoEntrar.MouseButton1Click:Connect(function()
    if InputSenha.Text == SenhaCorreta then
        FrameSenha.Visible = false
        FrameMenu.Visible = true
    else
        TextoErro.Visible = true
        InputSenha.Text = ""
        task.wait(1.5)
        TextoErro.Visible = false
    end
end)

-- ==========================================
-- PERSONAGEM
-- ==========================================
local Humanoid = nil
local function AtualizarChar(char)
    Humanoid = char:WaitForChild("Humanoid")
end
if Player.Character then AtualizarChar(Player.Character) end
Player.CharacterAdded:Connect(AtualizarChar)

-- ==========================================
-- SPEED
-- ==========================================
local speedAtivo = false
local velocidade = 16
RunService.Heartbeat:Connect(function()
    if speedAtivo and Humanoid and Humanoid.Parent then
        Humanoid.WalkSpeed = velocidade
    end
end)
CriarToggle("Speed", function(a)
    speedAtivo = a
    if not a and Humanoid then Humanoid.WalkSpeed = 16 end
end)
CriarSlider("Velocidade", 0, 10000, 16, function(v)
    velocidade = v
    if speedAtivo and Humanoid then Humanoid.WalkSpeed = v end
end)

-- ==========================================
-- INFINITE JUMP
-- ==========================================
local connJump = nil
CriarToggle("Infinite Jump", function(a)
    if a then
        if connJump then connJump:Disconnect() end
        connJump = UIS.JumpRequest:Connect(function()
            if Humanoid and Humanoid.Parent then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if connJump then connJump:Disconnect() end
    end
end)

-- ==========================================
-- PULO FORTE
-- ==========================================
local puloAtivo = false
local forcaPulo = 50
RunService.Heartbeat:Connect(function()
    if puloAtivo and Humanoid and Humanoid.Parent then
        Humanoid.UseJumpPower = true
        Humanoid.JumpPower = forcaPulo
    end
end)
CriarToggle("Pulo Forte", function(a)
    puloAtivo = a
    if not a and Humanoid then Humanoid.JumpPower = 50 end
end)
CriarSlider("Força do Pulo", 0, 10000000, 50, function(v)
    forcaPulo = v
    if puloAtivo and Humanoid then Humanoid.JumpPower = v end
end)

-- ==========================================
-- ESP
-- ==========================================
local espAtivo = false
local espObj = {}
local function LimparESP()
    for _, o in pairs(espObj) do
        if o and o.Parent then o:Destroy() end
    end
    espObj = {}
end
local function CriarESP(char)
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hl = Instance.new("Highlight")
    hl.FillColor = Color3.fromRGB(255, 0, 0)
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.Adornee = char
    hl.Parent = char
    table.insert(espObj, hl)
end
CriarToggle("ESP", function(a)
    espAtivo = a
    if a then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= Player and p.Character then CriarESP(p.Character) end
        end
    else
        LimparESP()
    end
end)

-- ==========================================
-- AIMBOT
-- ==========================================
local aimAtivo = false
local alvo = nil
local function PegarAlvo()
    local melhor, dist = nil, math.huge
    local minhaPos = Cam.CFrame.Position
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= Player and p.Character then
            local head = p.Character:FindFirstChild("Head")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if head and hum and hum.Health > 0 then
                local d = (head.Position - minhaPos).Magnitude
                if d < dist then
                    dist = d
                    melhor = p
                end
            end
        end
    end
    return melhor
end
RunService.RenderStepped:Connect(function()
    if aimAtivo and alvo and alvo.Character then
        local head = alvo.Character:FindFirstChild("Head")
        local hum = alvo.Character:FindFirstChildOfClass("Humanoid")
        if head and hum and hum.Health > 0 then
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, head.Position)
        else
            alvo = nil
        end
    end
end)
CriarToggle("Aimbot", function(a)
    aimAtivo = a
    if a then alvo = PegarAlvo() else alvo = nil end
end)

-- Botão travar alvo
local BotaoTravar = Instance.new("TextButton")
BotaoTravar.Size = UDim2.new(1, -10, 0, 38)
BotaoTravar.Text = "🎯 Travar Alvo"
BotaoTravar.BackgroundColor3 = Color3.fromRGB(180, 60, 0)
BotaoTravar.TextColor3 = Color3.fromRGB(255, 255, 255)
BotaoTravar.Font = Enum.Font.SourceSansBold
BotaoTravar.TextSize = 16
BotaoTravar.Parent = Scroll
local CT = Instance.new("UICorner")
CT.CornerRadius = UDim.new(0, 8)
CT.Parent = BotaoTravar
BotaoTravar.MouseButton1Click:Connect(function()
    alvo = PegarAlvo()
end)

-- ==========================================
-- INFINITE YIELD (BOTÃO DENTRO DO MENU)
-- ==========================================
local Separador = Instance.new("Frame")
Separador.Size = UDim2.new(1, -10, 0, 2)
Separador.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
Separador.BorderSizePixel = 0
Separador.Parent = Scroll

local TituloIY = Instance.new("TextLabel")
TituloIY.Size = UDim2.new(1, -10, 0, 28)
TituloIY.BackgroundTransparency = 1
TituloIY.Text = "📦 Scripts Extras"
TituloIY.TextColor3 = Color3.fromRGB(0, 200, 255)
TituloIY.Font = Enum.Font.SourceSansBold
TituloIY.TextSize = 16
TituloIY.TextXAlignment = Enum.TextXAlignment.Left
TituloIY.Parent = Scroll

local BotaoIY = Instance.new("TextButton")
BotaoIY.Size = UDim2.new(1, -10, 0, 42)
BotaoIY.Text = "📜 Carregar Infinite Yield"
BotaoIY.BackgroundColor3 = Color3.fromRGB(80, 40, 160)
BotaoIY.TextColor3 = Color3.fromRGB(255, 255, 255)
BotaoIY.Font = Enum.Font.SourceSansBold
BotaoIY.TextSize = 17
BotaoIY.AutoButtonColor = false
BotaoIY.Parent = Scroll

local UICornerIY = Instance.new("UICorner")
UICornerIY.CornerRadius = UDim.new(0, 8)
UICornerIY.Parent = BotaoIY

local IYCarregado = false

BotaoIY.MouseButton1Click:Connect(function()
    if IYCarregado then
        BotaoIY.Text = "✅ Infinite Yield já está carregado"
        task.wait(1.5)
        BotaoIY.Text = "📜 Carregar Infinite Yield"
        return
    end

    BotaoIY.Text = "⏳ Carregando..."
    BotaoIY.BackgroundColor3 = Color3.fromRGB(120, 100, 0)

    local sucesso, erro = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    if sucesso then
        IYCarregado = true
        BotaoIY.Text = "✅ Infinite Yield Carregado!"
        BotaoIY.BackgroundColor3 = Color3.fromRGB(0, 150, 60)
        task.wait(2)
        BotaoIY.Text = "📜 Infinite Yield (Recarregar)"
    else
        BotaoIY.Text = "❌ Falha ao carregar (tente novamente)"
        BotaoIY.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        warn("[MenuArceus] Erro ao carregar Infinite Yield: " .. tostring(erro))
        task.wait(2)
        BotaoIY.Text = "📜 Carregar Infinite Yield"
        BotaoIY.BackgroundColor3 = Color3.fromRGB(80, 40, 160)
    end
end)

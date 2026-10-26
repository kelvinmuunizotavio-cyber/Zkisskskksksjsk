-- ==========================================
-- CONFIGURAÇÃO INICIAL
-- ==========================================
local SenhaCorreta = "2510"
local ImagemID = "rbxassetid://13262979965"
local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Cam = workspace.CurrentCamera

local oldGui = Player.PlayerGui:FindFirstChild("MenuArceus")
if oldGui then oldGui:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MenuArceus"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- ==========================================
-- 1. TELA DE SENHA (ARRASTÁVEL)
-- ==========================================
local FrameSenha = Instance.new("Frame")
FrameSenha.Size = UDim2.new(0, 320, 0, 400)
FrameSenha.Position = UDim2.new(0.5, -160, 0.5, -200)
FrameSenha.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FrameSenha.BorderSizePixel = 0
FrameSenha.ClipsDescendants = true
FrameSenha.Active = true
FrameSenha.Parent = ScreenGui

local UICornerSenha = Instance.new("UICorner")
UICornerSenha.CornerRadius = UDim.new(0, 12)
UICornerSenha.Parent = FrameSenha

local ImagemFundo = Instance.new("ImageLabel")
ImagemFundo.Size = UDim2.new(1, 0, 1, 0)
ImagemFundo.BackgroundTransparency = 1
ImagemFundo.Image = ImagemID
ImagemFundo.ScaleType = Enum.ScaleType.Crop
ImagemFundo.ZIndex = 1
ImagemFundo.Parent = FrameSenha

local UICornerImg = Instance.new("UICorner")
UICornerImg.CornerRadius = UDim.new(0, 12)
UICornerImg.Parent = ImagemFundo

local Escurecer = Instance.new("Frame")
Escurecer.Size = UDim2.new(1, 0, 1, 0)
Escurecer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Escurecer.BackgroundTransparency = 0.45
Escurecer.BorderSizePixel = 0
Escurecer.ZIndex = 2
Escurecer.Parent = FrameSenha

local UICornerEsc = Instance.new("UICorner")
UICornerEsc.CornerRadius = UDim.new(0, 12)
UICornerEsc.Parent = Escurecer

-- Barra de arrastar (topo)
local BarraArrastarSenha = Instance.new("Frame")
BarraArrastarSenha.Size = UDim2.new(1, 0, 0, 55)
BarraArrastarSenha.Position = UDim2.new(0, 0, 0, 0)
BarraArrastarSenha.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BarraArrastarSenha.BackgroundTransparency = 1
BarraArrastarSenha.ZIndex = 4
BarraArrastarSenha.Active = true
BarraArrastarSenha.Parent = FrameSenha

local TituloSenha = Instance.new("TextLabel")
TituloSenha.Size = UDim2.new(1, 0, 1, 0)
TituloSenha.BackgroundTransparency = 1
TituloSenha.Text = "🔒 MENU ARCEUS  (arraste aqui)"
TituloSenha.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloSenha.Font = Enum.Font.SourceSansBold
TituloSenha.TextSize = 19
TituloSenha.TextStrokeTransparency = 0.5
TituloSenha.ZIndex = 4
TituloSenha.Parent = BarraArrastarSenha

-- Lógica de arrastar (mouse + toque)
local arrastandoSenha = false
local offsetSenha = Vector2.new(0, 0)

BarraArrastarSenha.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        arrastandoSenha = true
        offsetSenha = Vector2.new(
            input.Position.X - FrameSenha.AbsolutePosition.X,
            input.Position.Y - FrameSenha.AbsolutePosition.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        arrastandoSenha = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if arrastandoSenha then
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
            FrameSenha.Position = UDim2.new(
                0, input.Position.X - offsetSenha.X,
                0, input.Position.Y - offsetSenha.Y
            )
        end
    end
end)

-- Caixa de senha
local InputSenha = Instance.new("TextBox")
InputSenha.Size = UDim2.new(0.8, 0, 0, 45)
InputSenha.Position = UDim2.new(0.1, 0, 0.5, -25)
InputSenha.PlaceholderText = "Digite a senha..."
InputSenha.Text = ""
InputSenha.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InputSenha.BackgroundTransparency = 0.35
InputSenha.TextColor3 = Color3.fromRGB(255, 255, 255)
InputSenha.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
InputSenha.Font = Enum.Font.SourceSansBold
InputSenha.TextSize = 22
InputSenha.ZIndex = 3
InputSenha.Parent = FrameSenha

local UICornerInput = Instance.new("UICorner")
UICornerInput.CornerRadius = UDim.new(0, 8)
UICornerInput.Parent = InputSenha

-- Botão entrar
local BotaoEntrar = Instance.new("TextButton")
BotaoEntrar.Size = UDim2.new(0.8, 0, 0, 45)
BotaoEntrar.Position = UDim2.new(0.1, 0, 0.65, 0)
BotaoEntrar.Text = "ENTRAR"
BotaoEntrar.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
BotaoEntrar.TextColor3 = Color3.fromRGB(255, 255, 255)
BotaoEntrar.Font = Enum.Font.SourceSansBold
BotaoEntrar.TextSize = 22
BotaoEntrar.ZIndex = 3
BotaoEntrar.Parent = FrameSenha

local UICornerEntrar = Instance.new("UICorner")
UICornerEntrar.CornerRadius = UDim.new(0, 8)
UICornerEntrar.Parent = BotaoEntrar

-- Texto de erro
local TextoErro = Instance.new("TextLabel")
TextoErro.Size = UDim2.new(1, 0, 0, 25)
TextoErro.Position = UDim2.new(0, 0, 0.88, 0)
TextoErro.Text = "❌ Senha Incorreta!"
TextoErro.TextColor3 = Color3.fromRGB(255, 60, 60)
TextoErro.BackgroundTransparency = 1
TextoErro.Font = Enum.Font.SourceSansBold
TextoErro.TextSize = 18
TextoErro.TextStrokeTransparency = 0.5
TextoErro.Visible = false
TextoErro.ZIndex = 3
TextoErro.Parent = FrameSenha

-- ==========================================
-- 2. MENU PRINCIPAL
-- ==========================================
local FrameMenu = Instance.new("Frame")
FrameMenu.Size = UDim2.new(0, 300, 0, 520)
FrameMenu.Position = UDim2.new(0.5, -150, 0.5, -260)
FrameMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
FrameMenu.BorderSizePixel = 0
FrameMenu.Visible = false
FrameMenu.Active = true
FrameMenu.Draggable = true
FrameMenu.Parent = ScreenGui

local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 12)
UICornerMenu.Parent = FrameMenu

local TituloMenu = Instance.new("TextLabel")
TituloMenu.Size = UDim2.new(1, 0, 0, 45)
TituloMenu.Text = "⚡ MENU ARCEUS ⚡"
TituloMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TituloMenu.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloMenu.Font = Enum.Font.SourceSansBold
TituloMenu.TextSize = 20
TituloMenu.Parent = FrameMenu

local UICornerTitulo = Instance.new("UICorner")
UICornerTitulo.CornerRadius = UDim.new(0, 12)
UICornerTitulo.Parent = TituloMenu

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -65)
ScrollFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 5
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 140, 255)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.Parent = FrameMenu

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = ScrollFrame

-- ==========================================
-- FUNÇÃO BOTÃO TOGGLE COM ANIMAÇÃO
-- ==========================================
local function CriarBotaoToggle(Nome, Callback)
    local Botao = Instance.new("TextButton")
    Botao.Size = UDim2.new(1, -10, 0, 38)
    Botao.Text = Nome .. "  [ OFF ]"
    Botao.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    Botao.TextColor3 = Color3.fromRGB(255, 255, 255)
    Botao.Font = Enum.Font.SourceSansBold
    Botao.TextSize = 17
    Botao.AutoButtonColor = false
    Botao.Parent = ScrollFrame

    local UICornerBtn = Instance.new("UICorner")
    UICornerBtn.CornerRadius = UDim.new(0, 8)
    UICornerBtn.Parent = Botao

    local Ativo = false

    local function AnimacaoToque()
        local t1 = TweenService:Create(Botao, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0.94, 0, 0, 34)
        })
        t1:Play()
        t1.Completed:Wait()
        local t2 = TweenService:Create(Botao, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, -10, 0, 38)
        })
        t2:Play()
    end

    local function AtualizarVisual()
        if Ativo then
            Botao.Text = Nome .. "  [ ON ]"
            TweenService:Create(Botao, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(0, 170, 80)
            }):Play()
        else
            Botao.Text = Nome .. "  [ OFF ]"
            TweenService:Create(Botao, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            }):Play()
        end
    end

    Botao.MouseButton1Click:Connect(function()
        AnimacaoToque()
        Ativo = not Ativo
        AtualizarVisual()
        pcall(Callback, Ativo)
    end)

    return Botao
end

-- ==========================================
-- FUNÇÃO SLIDER
-- ==========================================
local function CriarSlider(Nome, Min, Max, ValorInicial, Callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -10, 0, 65)
    Container.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Container.BorderSizePixel = 0
    Container.Parent = ScrollFrame

    local UICornerCont = Instance.new("UICorner")
    UICornerCont.CornerRadius = UDim.new(0, 8)
    UICornerCont.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = Nome .. ": " .. ValorInicial
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSansBold
    Label.TextSize = 15
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local BarraFundo = Instance.new("Frame")
    BarraFundo.Size = UDim2.new(1, -20, 0, 10)
    BarraFundo.Position = UDim2.new(0, 10, 0, 40)
    BarraFundo.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    BarraFundo.BorderSizePixel = 0
    BarraFundo.Parent = Container

    local UICornerBarra = Instance.new("UICorner")
    UICornerBarra.CornerRadius = UDim.new(0, 5)
    UICornerBarra.Parent = BarraFundo

    local BarraFill = Instance.new("Frame")
    BarraFill.Size = UDim2.new((ValorInicial - Min) / (Max - Min), 0, 1, 0)
    BarraFill.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    BarraFill.BorderSizePixel = 0
    BarraFill.Parent = BarraFundo

    local UICornerFill = Instance.new("UICorner")
    UICornerFill.CornerRadius = UDim.new(0, 5)
    UICornerFill.Parent = BarraFill

    local Bolinha = Instance.new("TextButton")
    Bolinha.Size = UDim2.new(0, 20, 0, 20)
    Bolinha.Position = UDim2.new((ValorInicial - Min) / (Max - Min), -10, 0.5, -10)
    Bolinha.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Bolinha.Text = ""
    Bolinha.AutoButtonColor = false
    Bolinha.Parent = BarraFundo

    local UICornerBol = Instance.new("UICorner")
    UICornerBol.CornerRadius = UDim.new(1, 0)
    UICornerBol.Parent = Bolinha

    local ValorAtual = ValorInicial
    local Arrastando = false

    local function AtualizarDeInput(input)
        local barraPos = BarraFundo.AbsolutePosition.X
        local barraLargura = BarraFundo.AbsoluteSize.X
        local mouseX = input.Position.X
        local percent = math.clamp((mouseX - barraPos) / barraLargura, 0, 1)
        ValorAtual = math.floor(Min + (Max - Min) * percent)

        TweenService:Create(BarraFill, TweenInfo.new(0.05), {
            Size = UDim2.new(percent, 0, 1, 0)
        }):Play()
        TweenService:Create(Bolinha, TweenInfo.new(0.05), {
            Position = UDim2.new(percent, -10, 0.5, -10)
        }):Play()
        Label.Text = Nome .. ": " .. ValorAtual

        pcall(Callback, ValorAtual)
    end

    Bolinha.MouseButton1Down:Connect(function()
        Arrastando = true
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Arrastando = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if Arrastando then
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                AtualizarDeInput(input)
            end
        end
    end)

    BarraFundo.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Arrastando = true
            AtualizarDeInput(input)
        end
    end)

    return {
        SetValor = function(v)
            ValorAtual = math.clamp(v, Min, Max)
            local p = (ValorAtual - Min) / (Max - Min)
            BarraFill.Size = UDim2.new(p, 0, 1, 0)
            Bolinha.Position = UDim2.new(p, -10, 0.5, -10)
            Label.Text = Nome .. ": " .. ValorAtual
        end
    }
end

-- ==========================================
-- LÓGICA DA SENHA
-- ==========================================
BotaoEntrar.MouseButton1Click:Connect(function()
    if InputSenha.Text == SenhaCorreta then
        FrameSenha.Visible = false
        FrameMenu.Visible = true
        FrameMenu.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(FrameMenu, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 300, 0, 520)
        }):Play()
    else
        TextoErro.Visible = true
        InputSenha.Text = ""
        local posOriginal = FrameSenha.Position
        for i = 1, 6 do
            FrameSenha.Position = posOriginal + UDim2.new(0, (i % 2 == 0 and 8 or -8), 0, 0)
            task.wait(0.04)
        end
        FrameSenha.Position = posOriginal
        task.wait(1.5)
        TextoErro.Visible = false
    end
end)

-- ==========================================
-- PERSONAGEM
-- ==========================================
local Humanoid = nil
local function AtualizarPersonagem(char)
    Humanoid = char:WaitForChild("Humanoid")
end
if Player.Character then AtualizarPersonagem(Player.Character) end
Player.CharacterAdded:Connect(AtualizarPersonagem)

-- ==========================================
-- SPEED (0 a 10000)
-- ==========================================
local SpeedAtivo = false
local VelocidadeEscolhida = 16

RunService.Heartbeat:Connect(function()
    if SpeedAtivo and Humanoid and Humanoid.Parent then
        Humanoid.WalkSpeed = VelocidadeEscolhida
    end
end)

CriarBotaoToggle("Speed", function(Ativo)
    SpeedAtivo = Ativo
    if not Ativo and Humanoid then
        Humanoid.WalkSpeed = 16
    end
end)

CriarSlider("Velocidade", 0, 10000, 16, function(v)
    VelocidadeEscolhida = v
    if SpeedAtivo and Humanoid and Humanoid.Parent then
        Humanoid.WalkSpeed = v
    end
end)

-- ==========================================
-- INFINITE JUMP
-- ==========================================
local ConexaoJump = nil
CriarBotaoToggle("Infinite Jump", function(Ativo)
    if Ativo then
        if ConexaoJump then ConexaoJump:Disconnect() end
        ConexaoJump = UIS.JumpRequest:Connect(function()
            if Humanoid and Humanoid.Parent then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if ConexaoJump then ConexaoJump:Disconnect() end
    end
end)

-- ==========================================
-- PULO (0 a 10000000)
-- ==========================================
local PuloAtivo = false
local ForcaPulo = 50

RunService.Heartbeat:Connect(function()
    if PuloAtivo and Humanoid and Humanoid.Parent then
        Humanoid.UseJumpPower = true
        Humanoid.JumpPower = ForcaPulo
    end
end)

CriarBotaoToggle("Pulo Forte", function(Ativo)
    PuloAtivo = Ativo
    if not Ativo and Humanoid then
        Humanoid.JumpPower = 50
    end
end)

CriarSlider("Força do Pulo", 0, 10000000, 50, function(v)
    ForcaPulo = v
    if PuloAtivo and Humanoid and Humanoid.Parent then
        Humanoid.JumpPower = v
    end
end)

-- ==========================================
-- ESP
-- ==========================================
local EspAtivo = false
local EspConns = {}
local EspDesenhos = {}

local function LimparESP()
    for _, obj in pairs(EspDesenhos) do
        if obj and obj.Parent then obj:Destroy() end
    end
    EspDesenhos = {}
end

local function CriarHighlight(char)
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hl = Instance.new("Highlight")
    hl.Name = "ESP_Highlight_Arceus"
    hl.FillColor = Color3.fromRGB(255, 0, 0)
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.FillTransparency = 0.5
    hl.OutlineTransparency = 0
    hl.Adornee = char
    hl.Parent = char
    table.insert(EspDesenhos, hl)

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Name_Arceus"
    billboard.Size = UDim2.new(0, 200, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = char.Name
    label.TextColor3 = Color3.fromRGB(255, 80, 80)
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 16
    label.Parent = billboard
    billboard.Parent = char
    table.insert(EspDesenhos, billboard)
end

CriarBotaoToggle("ESP", function(Ativo)
    EspAtivo = Ativo
    if Ativo then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= Player and p.Character then
                CriarHighlight(p.Character)
            end
        end
        table.insert(EspConns, game.Players.PlayerAdded:Connect(function(p)
            p.CharacterAdded:Connect(function(char)
                if EspAtivo then CriarHighlight(char) end
            end)
        end))
    else
        for _, c in pairs(EspConns) do c:Disconnect() end
        EspConns = {}
        LimparESP()
    end
end)

Player.CharacterAdded:Connect(function()
    LimparESP()
end)

-- ==========================================
-- AIMBOT (TRAVA NA CABEÇA, NÃO TROCA DE ALVO)
-- ==========================================
local AimbotAtivo = false
local AlvoTravado = nil
local AlvoHead = nil
local IndicadorAlvo = nil

local function PegarJogadorMaisProximo()
    local melhorPlayer, melhorHead, menorDist = nil, nil, math.huge
    local minhaPos = Cam.CFrame.Position
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= Player and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local head = p.Character:FindFirstChild("Head")
            if hum and hum.Health > 0 and head then
                local d = (head.Position - minhaPos).Magnitude
                if d < menorDist then
                    menorDist = d
                    melhorPlayer = p
                    melhorHead = head
                end
            end
        end
    end
    return melhorPlayer, melhorHead
end

local function MostrarIndicador(char)
    if IndicadorAlvo and IndicadorAlvo.Parent then IndicadorAlvo:Destroy() end
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    local bb = Instance.new("BillboardGui")
    bb.Name = "AimbotAlvo_Arceus"
    bb.Size = UDim2.new(0, 100, 0, 30)
    bb.StudsOffset = Vector3.new(0, 2, 0)
    bb.AlwaysOnTop = true
    bb.Adornee = head
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = "🎯 TRAVADO"
    lbl.TextColor3 = Color3.fromRGB(255, 0

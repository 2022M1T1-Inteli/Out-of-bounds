extends Node2D

var metheoritIndex = 1

# Textos das labels
var metheorit1Texts = [
	"Nesse diálogo com Jarvis, um preconceito explícito ocorreu contra você. Esse tipo de situação acontece com muita frequência, como por exemplo quando pessoas pretas entram em lojas de grife e o segurança as olham como se não fossem bem vindas. Cabe a nós impedir essas situações sempre que pudermos!",
	"Por causa da sua aparência diferente, a assistente é completamente ignorada pelo seu chefe, mesmo ela possuindo argumentos válidos. Essa situação infelizmente é comum em diversas esferas sociais, principalmente em ambientes empresariais."
]

var metheorit2Texts = [
	"Também pode-se notar a discrepância de oportunidades entre brancos e pretos. Infelizmente pessoas brancas costumam ter mais oportunidades, baseado unicamente em sua cor. Por isso, Jarvis ofereceu e Astronanuta uma profissão que ele acredita que requer pouca inteligencia (faxineiro).",
	"Muitas vezes, as pessoas são julgadas com base em padrões de beleza predeterminados pela sociedade. Racistas utilizam desses padrões para diminuir outros individuos e os desprezam por causa de sua cor ou característica diferente, assim como aconteceu com a secretaria."
]

var metheorit3Texts = [
	"O racismo vai além de xingamentos e comparações: duvidar da inteligência ou fazer acusações com base na cor são alguns exemplos de atitudes preconceituosas. Análise as situações do seu dia a dia e sempre lembre: o racismo está também nas pequenas ações!",
	"Pode não parecer comum, mas muitas pessoas não são contratadas exclusivamente por causa de sua aparência. Ignorar atributos intelectuais e experiências apenas por causa de diferenças físicas é uma das atitudes mais claras de racismo e que mais acontece no meio profissional."
]

# Fun��o executada quando a cena � carregada
func _ready():
	# Come�ar a anima��o
	$AnimatedSprite.play()

	# Setar textos das labels
	$Metheorit1Rect/Label.text = metheorit1Texts[Global.knowledgeTripIndex]
	$Metheorit2Rect/Label.text = metheorit2Texts[Global.knowledgeTripIndex]
	$Metheorit3Rect/Label.text = metheorit3Texts[Global.knowledgeTripIndex]


# Loop que � executado enquanto o jogo est� rodando
func _process(delta):
	# Checar se o icone de "espa�o" est� vis�vel e o usu�rio apertou o bot�o "espa�o"
	if $Key.visible and Input.is_action_just_pressed("ui_accept"):
		# Passar para o pr�ximo meteorito
		metheoritIndex += 1

	if metheoritIndex == 2 and !$Metheorit2.visible:
		$Metheorit2.visible = true
		$AnimationPlayer.play("Metheorit2Animation")
		$Key.visible = false

	if metheoritIndex == 3 and !$Metheorit3.visible:
		$Metheorit3.visible = true
		$AnimationPlayer.play("Metheorit3Animation")
		$Key.visible = false

	if metheoritIndex == 4:

		# Mostrar sistema de objetivos
		Global.overlayVisibility = true

		# Mostrar sistema de mapa
		Global.overlayVisibility = true

		if Global.knowledgeTripIndex == 0:
			TransitionScene.startAnimation("res://Scenes/PuzzleCleaning/PuzzleCleaning.tscn")
		else:
			TransitionScene.startAnimation("res://Scenes/MecanicRoom/mecanicRoom.tscn")


func _on_AnimatedSprite_animation_finished():
	$Metheorit1.visible = true
	$AnimationPlayer.play("MetheoritAnimation")


func onMetheorit1AnimationFinish():
	$Metheorit1Rect.visible = true
	$Key.visible = true


func onMetheorit2AnimationFinish():
	$Metheorit2Rect.visible = true
	$Key.visible = true


func onMetheorit3AnimationFinish():
	$Metheorit3Rect.visible = true
	$Key.visible = true

/*Crie um programa em Go que simula a comunicação de uma torre de controle de aeroporto para atribuir pistas para os aviões pousarem ou decolarem. Assuma que a torre de controle possui 4 pistas, e que ela controla a comunicação simultânea com 10 aviões.

Cada avião tem o seguinte comportamento:

- enquanto estiver voando ele vai tentar requisitar uma pista de pouso a torre. A torre pode retornar uma pista de vôo disponível para pouso ou informar que não existem pistas disponíveis. No último caso, o avião volta a requisitar uma pista de pouso até que a torre disponbilize alguma. No caso em que a torre disponibiliza uma pista, o avião passa por um processo de pouso no qual a pista fica ocupada. Ao fim desse processo a pista é liberada. Assuma que depois de um tempo aleatório o avião volta solicitar uma pista para decolagem. O processo de solicitação da pista é semelhante ao de pouso. Quando estiver no ar, assuma que após um tempo aleatório o avião volta a solicitar permissão para pouso fazendo o processo se repetir indefinidamente. 

A torre de controle é uma entidade que vai atribuir as pistas de acordo com as solicitações dos aviões e de acordo com suas disponibilidades. Uma pista nunca deve ser atribuída a dois aviões ao mesmo tempo, tanto para pousos quanto para decolagens. 

Imprima mensagens para ilustrar o que está acontecendo ao longo da execução do seu programa. Lembre-se de utilizar a função time.Sleep com valores aleatórios para simular a passagem do tempo enquanto as ações acontecem. 

Você deve submeter um arquivo com o nome "controledevoo.go". Use comentários no código para explicar a sua solução. */

package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

var clearLane bool
//O numero de pistas
var lane = 4

var wg sync.WaitGroup
var mutex sync.Mutex

//Estrutura da torre
type Tower struct {
	gotPermission chan string
  name string
	sendPermission chan string
}

//Estrutura do aviao
type Plane struct {
	gotPermission chan string
  name string
	sendPermission chan string
	lane int
}

//Torre liberada
func (tower Tower) permited(name string) {
	if clearLane == true {
		fmt.Println(tower.name, "permited", name)
		time.Sleep(time.Second * 5)
	} else {
		time.Sleep(time.Second * 5)
	}
}

//Torre esperando solicitacao
func (tower Tower) waitingRequest() {
	for {
		sendPermission := <-tower.gotPermission
		tower.permited(sendPermission)
		tower.sendPermission <- sendPermission
	}
}

//Criar torre de controle
func NewTower(gotPermission chan string, name string, sendPermission chan string) Tower {
	t := Tower{gotPermission, name, sendPermission}
	time.Sleep(time.Second * 5)
	go t.waitingRequest()
	return t
}

//Aviao autorizado
func (plane Plane) gotAuthorized() {
	mutex.Lock()
	defer mutex.Unlock()
	fmt.Println(plane.name, "waiting for authorization.")
	time.Sleep(time.Second * 5)
	sendPermission := <-plane.sendPermission
	fmt.Println(plane.name, "Authorized", sendPermission, "in lane", lane)
	wg.Done()
	lane = lane - 1
	time.Sleep(time.Second * 5)
}

//Esperar a autorizacao da torre (avioes)
func (plane Plane) waitingAuthorization(sendPermission string) {
	for {
		wg.Add(1)
		fmt.Println(plane.name, "requested authorization for", sendPermission)
		plane.gotPermission <- sendPermission
		if lane <= 0 {
			fmt.Println("No lanes available now")
      releaseLane()
			clearLane = false
		}
		plane.gotAuthorized()
	}
}

//Cria novo aviao
func NewPlane(gotPermission chan string, name string, sendPermission chan string, lane int) Plane {
	p := Plane{gotPermission, name, sendPermission, lane}
	return p
}

//Libera as pistas
func releaseLane() {
	mutex.Lock()
	defer mutex.Unlock()
	time.Sleep(time.Second * 5)
	lane = lane + 4
	fmt.Println("The lanes are cleared.")
	clearLane = true

}

func main() {

	gotPermission := make(chan string)
	sendPermission := make(chan string)

	s := []string{"take-off", "landing"}
 
  //"Fazendo" uma torre
	NewTower(gotPermission,"Tower", sendPermission)

  //"Fazendo" 10 avioes
	p1 := NewPlane(gotPermission,"p1", sendPermission, lane)
	p2 := NewPlane(gotPermission, "p2", sendPermission, lane)
	p3 := NewPlane(gotPermission, "p3", sendPermission, lane)
	p4 := NewPlane(gotPermission, "p4", sendPermission, lane)
	p5 := NewPlane(gotPermission, "p5", sendPermission, lane)
	p6 := NewPlane(gotPermission, "p6", sendPermission, lane)
	p7 := NewPlane(gotPermission, "p7", sendPermission, lane)
	p8 := NewPlane(gotPermission, "p8", sendPermission, lane)
  p9 := NewPlane(gotPermission, "p9", sendPermission, lane)
  p10 := NewPlane(gotPermission, "p10", sendPermission, lane)

	go p1.waitingAuthorization(s[rand.Intn(len(s))])
	go p2.waitingAuthorization(s[rand.Intn(len(s))])
	go p3.waitingAuthorization(s[rand.Intn(len(s))])
	go p4.waitingAuthorization(s[rand.Intn(len(s))])
	go p5.waitingAuthorization(s[rand.Intn(len(s))])
	go p6.waitingAuthorization(s[rand.Intn(len(s))])
	go p7.waitingAuthorization(s[rand.Intn(len(s))])
	go p8.waitingAuthorization(s[rand.Intn(len(s))])
  go p9.waitingAuthorization(s[rand.Intn(len(s))])
  go p10.waitingAuthorization(s[rand.Intn(len(s))])
  
	time.Sleep(time.Second * 500)
}

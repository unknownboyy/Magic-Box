    /* fetch("./header.html")
      .then(response => {
        return response.text()
      })
      .then(data => {
        document.querySelector("header").innerHTML = data;
      }); */

    const phoneDOM = document.querySelector(".mobiles");
    const cartDOM = document.querySelector(".cart img");
    const counter = document.querySelector(".counter");
    const signinSignupBtn = document.querySelector(".signinsignup");
    const loginBtn = document.querySelector(".loginBtn");

    let cart = [];
    let DOMbutton = [];

    class Phone{
      async getPhones(){
          try{
              let result = await fetch("products.json");
              let data = await result.json();
              //let products = data.items
              
              return data;
          }
          catch(error){
              console.log(error);
          }
            //console.log(id , image, name, price, color);
        }
    }

    signinSignupBtn.onclick = function() {
        User.signinBar("loginForm");
    }

    loginBtn.onclick = function() {
        let username = document.querySelector(".username").value;
        let pass = document.querySelector(".pass").value;
        User.authentication(username,pass);
    }

    class User{

        static signinBar(el){
            var loginForm = document.getElementById(el);
            if (loginForm.style.opacity === "1") {
                loginForm.style.transition = "all 1s linear .2s"
                loginForm.style.WebkitTransition = "all 1s linear .2s";
                loginForm.style.opacity = "0";
              

            } else {
                loginForm.style.transition = "all 1s linear .2s"
                loginForm.style.WebkitTransition = "all 1s linear .2s";
                loginForm.style.opacity = "1";
              
            }
            
        }

        static authentication(username,pass)/*function to check userid & password*/
    {
    /*the following code checkes whether the entered userid and password are matching*/
    if(username == "Mohsin" && pass == "root")
      {
        //window.open('target.html')/*opens the target page while Id & password matches*/
        console.log("Done");
        document.querySelector(".message").innerHTML= " Welcome  <strong> " + username + "!<strong>";
        document.querySelector(".username").value = "";
        document.querySelector(".pass").value = "";
      }
    else
    {
        document.querySelector(".message").innerText = " Error: Username/Password is not correct ";
      console.log("Error Password or Username");/*displays error message*/
      document.querySelector(".username").value = "";
        document.querySelector(".pass").value = "";
      }
    }
    }

    // Display Phones
    class Display{
      
        displayPhones(phones){
            let result =" ";
            let style = {
                border: "none",
                borderBottom: "1px solid #F5F5F5",
                textAlign: "center",
                background: "ffffff",
                fontSize:"bold",
                bgcolor:"#F5F5F5"
            };
            
            
            cartDOM.addEventListener('click', () =>{
                cartDisplay();
            });
            function cartDisplay(){
                
              let finalCart =  Storage.getSaveCart();
                
              result =' ';
              console.log(finalCart);
                


                let div1Cart = document.createElement("div"); 
                div1Cart.className= "container mt-lg-5 text-center"; 
                let h2Cart = document.createElement("h2");
                h2Cart.className= "text-center"; 
                h2Cart.innerHTML =" Kundvagn ";
                div1Cart.appendChild(h2Cart);
                let div2Cart = document.createElement("div");
                div2Cart.setAttribute("class", "row  justify-content-center");
                div1Cart.appendChild(div2Cart); 
                for(let i = 0; i <finalCart.length ;i++){
                    var div3Cart = document.createElement("div");
                    div3Cart.className= "col-lg-2 col-md-6 Mobilediv"; 
                    div3Cart.setAttribute("id",finalCart[i].id);
                    var h3Cart = document.createElement("h3");
                    h3Cart.innerHTML =finalCart[i].title;
                    var imgCart = document.createElement("img");
                    imgCart.src = "../assets/"+finalCart[i].image;
                    imgCart.setAttribute('alt', "phone");
                    imgCart.setAttribute('height', '250px');
                    imgCart.setAttribute('width', '150px');
                    var h4Cart = document.createElement("h3");
                    h4Cart.innerHTML =finalCart[i].price + " Kr";
                    var removeButton = document.createElement("button");
                    removeButton.data = i
                    removeButton.className= "btn btn-danger btn-remove"; 
                    
                    
                    removeButton.onclick = function() {
                        var itemToRemove = document.getElementById(finalCart[i].id);
                        div2Cart.removeChild(itemToRemove);
                        var cartFromStorage = JSON.parse(localStorage.getItem("cartItems"));
                        var index = 0;
                        for(var t_index in cartFromStorage){
                          if(cartFromStorage[t_index].id == finalCart[i].id){
                            index = t_index;
                          }
                        }
                        cartFromStorage.splice(index, 1)

                        console.log("cartstorage",cartFromStorage);
                        localStorage.setItem("cartItems", JSON.stringify(cartFromStorage))

                        let itemsTotalCount = 0;
                        let itemsTotalAmount = 0;

                        cartFromStorage.map(item => {
                          itemsTotalCount += item.amount;
                          itemsTotalAmount += item.price;
                          counter.innerText = itemsTotalCount;
                        })
                        Storage.saveTotalAmount(itemsTotalAmount); 

                        //document.getElementById("totalPriceText").innerHTML = "Total Price: " + Storage.getTotalAmount() + " Kr";
                    }
                    var textButton = document.createTextNode("Remove");
                    removeButton.appendChild(textButton);
                    div3Cart.appendChild(h3Cart);
                    div3Cart.appendChild(imgCart);
                    div3Cart.appendChild(h4Cart);
                    div3Cart.appendChild(removeButton);
                    div2Cart.appendChild(div3Cart);
                    }
                    let outerh4Cart = document.createElement("h4");
                    outerh4Cart.innerHTML = "Total Price: " + Storage.getTotalAmount() + " Kr";
                    outerh4Cart.setAttribute("id","totalAmount");
                    div1Cart.appendChild(outerh4Cart); 
                    var finishShoping = document.createElement("button");
                    finishShoping.className= "btn btn-primary btn-lg finishShoping"; 
                    finishShoping.setAttribute("data-toggle","modal");
                    finishShoping.dataset.target="#myModal";
                    finishShoping.setAttribute("type","button");
                    var finishShopingtext = document.createTextNode("Finish Shoping");
                    finishShoping.appendChild(finishShopingtext);
                    div1Cart.appendChild(finishShoping); 

                result = div1Cart;
                console.log(phoneDOM);
                phoneDOM.innerHTML =  '' ;
                phoneDOM.appendChild(result);
              
            }

            phones.forEach(phone => {
        result +=`
        <div class="card bgcolor" style="border:${style.border}; border-bottom:${style.borderBottom};text-align:${style.textAlign}; background:${(phone.id === 102 || phone.id === 104)? style.bgcolor : style.background}">
        <div class="card-body">
            <h1 class="card-title" style="font-weight:${style.fontSize}">${phone.title}</h1>
            <p class="card-text" style="font-weight:${style.fontSize}">${phone.description}</p>
            <img  src="assets/${phone.image}" width="200px" hight="200px">
            <div class="card-text " style="font-weight:${style.fontSize}">${phone.price} kr</div>
            <button type="button" class="btn btn-add-to-cart  btn-lg btn-primary mt-4 mb-5" data-id=${phone.id} ><span style="color: #ffffff;"> <i class="fa fa-cart-arrow-down mr-2"></i> </span>Add in Cart</button>
          </div>
        </div>         
    `;
            });
            
            phoneDOM.innerHTML = result;     
        } 


    addToCart(){

        const buttons = [...document.querySelectorAll(".btn-add-to-cart")];
        buttons.forEach(button => {
            let id = button.dataset.id;
            DOMbutton = buttons;
            let inCart = cart.find(item => item.id === id);
            console.log(inCart);
          /*  if(inCart){
                button.innerText = "Already in Cart";
                button.disabled = true;         
            } */
                button.addEventListener('click', event => {
                    
                    event.target.innerText = "Already in Cart";
                    event.target.disabled = true;

                    // Get phone items from local Storage DB
                    
                    console.log(id);
                    let cartItem = {...Storage.getUserItem(id), amount:1};
                    console.log(cartItem);

                    cart = [...cart,cartItem];
                  console.log(cart);

                  // Save cart data in local storage
                  Storage.saveCart(cart);
                  
                  this.setCartValue(cart);
                });
        });


        
    }
    setCartValue(cart){
        let itemsTotalCount = 0;
        let itemsTotalAmount = 0;

    cart.map(item => {
        itemsTotalCount += item.amount;
        itemsTotalAmount += item.price;
        counter.innerText = itemsTotalCount;
          //console.log(itemsTotalAmount);

    })
          Storage.saveTotalAmount(itemsTotalAmount); 
          //totalAmount.innerText = Storage.saveTotalAmount(itemsTotalAmount);
        }
    }


    //Local Storage DB

    class Storage{
        static db(items){
          localStorage.setItem("items", JSON.stringify(items));
        }

        static getdb(){
            let products = JSON.parse(localStorage.getItem('items'));
                console.log(products);
            return products;
          }

        static getUserItem(id){
            console.log(id);
            let products = JSON.parse(localStorage.getItem('items'));
                console.log(products);
            return products.find(product => product.id == id);
          }

          static saveCart(cartitems){
            localStorage.setItem("cartItems", JSON.stringify(cartitems));
          } 
          static getSaveCart(){
            
            let userCart =  JSON.parse(localStorage.getItem('cartItems'));
            return userCart;     
          }

          static saveTotalAmount(totalAmount){
            //localStorage.setItem("totalAmount", JSON.stringify(totalAmount));
            localStorage.setItem('totalAmount', JSON.stringify(totalAmount));
            var amount_container = document.getElementById("totalAmount");
            if(amount_container!=null){
              amount_container.innerHTML = "Total Price: " + totalAmount + " Kr";
            }

            //localStorage.removeItem('totalAmount')
          } 

          static getTotalAmount(){
            
            let totalAmount = localStorage.getItem('totalAmount');
                
            return totalAmount;
                
          }
    }

    document.addEventListener("DOMContentLoaded", () => {

    const display = new Display();
    const phone = new Phone();

    phone.getPhones().then(phones => { 
        
      display.displayPhones(phones);
      Storage.db(phones);
      
        
        phoneDOM.style.transition = "all 5s linear .2s";
        phoneDOM.style.WebkitTransition = "all 5s linear .2s";
        phoneDOM.style.opacity = "1";
      
    }).then(() => {
        display.addToCart();
    });

    });


function get_list(param_sort, param_nowpage) {

	const form = document.querySelector('form');
	const data = new FormData(form);
	data.append("sort", param_sort);
	let pageNo;
	if (param_nowpage == undefined) {
		pageNo = 0;
	} else {
		pageNo = Number(param_nowpage);
	}
	data.append("pageNo", pageNo);
	const url = '/searchBy?' + new URLSearchParams(data).toString();
	const place = document.getElementById('place');
	place.innerHTML = ``;
	
	for (let key of data.keys()) {
		console.log(key, ":", data.get(key));
	}
	
	fetch(url, { method: 'GET' })
		.then(response => response.json())
		.then(function(data) {
					data.forEach(
						(i) =>
							place.insertAdjacentHTML(
													'beforeend',
													`<div class="col mb-5">
														<div class="card h-100"><img class="card-img-top" src="`+ i.thumbnail+ `" style="height: inherit;">
															<div class="card-body p-4">
																
																	<!-- Product name-->
																	<h5 class="card-title">`+ i.modelname + `</h5>
																	<p class="card-text">`+ i.year + `연식<br> ` + addCommas(i.mileage) + `Km<br> ` + i.fueltype + `</p>
																	<!-- Product price-->
																	<strong>`+ addCommas(i.price) + `</strong>원
																
															</div>
														<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
															<div class="text-center">
																<a class="btn btn-outline-dark mt-auto" href="/detail?vehicleno=${i.vehicleno}">자세히 보기</a>
															</div>
														</div>
													</div>
												</div>`
												)
									)
						creatPaging(param_sort , pageNo)
						pageNo += 1;
 						window.location.hash = '#page' + pageNo + '&' + param_sort;
						}
			)		
		.then(function(){
		})
		.catch(error => console.error(error));
}


function creatPaging(param_sort, param) {
	let nextPage = Number(param) + 1;
	fetch('/gettotalpage')
		.then(res => res.json())
		.then(function(res) {
			const paginglayer = document.getElementById('paginglayer');
			paginglayer.innerHTML = ``;
			if (param >= 1) {
				let backPage = Number(param) - 1;
				paginglayer.insertAdjacentHTML('beforeend', `
		    <li class="page-item" id="back"><a class="page-link" onclick="get_list('`+ param_sort + `','` + backPage + `')">이전</a></li>
		  					`);
				}
			for (let i = 1; i <= res; i++) {
				let page = Number(i) - 1;
				const pageButtons = 
			      `<li class="page-item"><a class="page-link" onclick="get_list('`+ param_sort + `','` + page + `')">` + i + `</a></li>
			    `;
				paginglayer.insertAdjacentHTML('beforeend', pageButtons);
				}
			if(Number(param)+1 != res){
			paginglayer.insertAdjacentHTML('beforeend', `
		    <li class="page-item" id="next"><a class="page-link" onclick="get_list('`+ param_sort + `','` + nextPage + `')">다음</a></li>
		  		`);}
		});
}

 function addCommas(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }



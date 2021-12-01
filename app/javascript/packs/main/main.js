let students = gon.students;

// シャッフル関数
const shuffle = ([...array]) => {
	for (let i = array.length - 1; i >= 0; i--) {
	  const j = Math.floor(Math.random() * (i + 1));
	  [array[i], array[j]] = [array[j], array[i]];
	}
	return array;
  }

// シャッフルボタンを押したとき
document.getElementById("shaffle-button").onclick = function() {
	students = shuffle(students);
	students.forEach(function(student, index){
		let target = document.getElementById(index);
		// 名前変更
		target.innerText = student.last_name;
		// リンク先変更
		target.href = `/students/${student.id}`;
		// 男女の色変更
		if (student.sex == "男"){
			target.style.color = "#3399FF";
		} else {
			target.style.color = "#FF0033";
		}

	});
}

// 保存ボタンを押したとき
document.getElementById("save-button").onclick = function(e) {
	for(let i = 0; i < students.length; i++){
		let student_id = document.getElementById(i).href.split('/').pop();
		students.forEach(function(student, index){
			if(student.id == student_id){
				student.seats_number = i;
			}
		})
	}
	e.preventDefault();
	let req = new XMLHttpRequest();

	// サーバ応答時の処理
	req.onreadystatechange = function() {
		let result = document.getElementById('result');
		if (req.readyState == 4) { // 通信の完了時
		  if (req.status == 200) { // 通信の成功時
			alert("保存完了！");
			}
		}else{

		}
	}


	// サーバ送信準備
	req.open('POST', '/students/save_seats_order', true);
	req.responseType = "json";
	// セキュリティトークンの取得
	let token = document.getElementsByName("csrf-token")[0].content;
	req.setRequestHeader("Content-Type", "application/json");
	req.setRequestHeader("X-CSRF-Token", token);
	// サーバ送信
	req.send(JSON.stringify(students));

	e.stopPropagation();
}
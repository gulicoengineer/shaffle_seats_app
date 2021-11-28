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

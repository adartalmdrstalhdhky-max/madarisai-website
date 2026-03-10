// نظام إدارة بيانات مدارس آل (Madaris AI Database System)

const MadarisDB = {
    // حفظ بيانات الطالب الجديد
    saveStudent: function(name, level) {
        const student = {
            id: Date.now(),
            name: name,
            level: level,
            joinedAt: new Date().toISOString(),
            progress: 0,
            scores: []
        };
        localStorage.setItem('madaris_user', JSON.stringify(student));
        console.log("تم تسجيل الطالب بنجاح في قاعدة البيانات المحلية");
    },

    // تحديث التقدم في الدروس
    updateProgress: function(points) {
        let user = JSON.parse(localStorage.getItem('madaris_user'));
        if(user) {
            user.progress += points;
            localStorage.setItem('madaris_user', JSON.stringify(user));
        }
    },

    // جلب بيانات الطالب الحالية
    getStudent: function() {
        return JSON.parse(localStorage.getItem('madaris_user'));
    }
};


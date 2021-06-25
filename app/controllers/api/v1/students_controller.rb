module Api
    module V1
        class StudentsController < ApplicationController
            def index
                students = Student.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded Students', data: students}, status: :ok
            end

            def show
                student = Student.find(params[:id]);
                render json: {status: 'SUCCESS', message: 'Loaded Students', data: student}, status: :ok
            end

            def create
                student = Student.new(student_params);

                if student.save
                    render json: {status: 'SUCCESS', message: 'Loaded Students', data: student}, status: :ok
                else 
                    render json: {status: 'SUCCESS', message: 'Students not saved'}, status: :unprocessable_entry
                end
            end

            def destroy
                student = Student.find(params[:id]);

                student.destroy
                render json: {status: 'Destroyed', message: 'deleted given Student', data: student}, status: :ok
            end

            def update
                student = Student.find(params[:id]);

                if student.update(student_params)
                    render json: {status: 'SUCCESS', message: 'Given Student Updated', data: student}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Student not updated', data: student}, status: :ok
                end
            end

            private

            def student_params
                params.permit(:name, :email, :phoneno)
            end
        end
    end
end
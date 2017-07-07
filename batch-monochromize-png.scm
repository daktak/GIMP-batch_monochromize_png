; Make the image grayscale, then positional dither it, then export to png (overwrites original image)

(define (batch-monochromize-png myfilename)

  (let* ((filelist (cadr (file-glob myfilename 1))))
    (while (not (null? filelist))

      (let*
        (
          (myfilename (car filelist))
          (myoutputfilename (string-append "gray_" myfilename))
          (mypicture
            (car
              (file-png-load RUN-NONINTERACTIVE myfilename myfilename)
            )
          )
          (mypicturedrawable (car (gimp-image-get-active-layer mypicture)))
        )
        (gimp-image-convert-grayscale mypicture)
        (gimp-image-convert-indexed mypicture 3 3 2 1 1 "NA")
        (file-png-save RUN-NONINTERACTIVE mypicture mypicturedrawable myoutputfilename myoutputfilename 0 9 0 0 0 0 1)
      )
      
      (set! filelist (cdr filelist))
    )
  )
)
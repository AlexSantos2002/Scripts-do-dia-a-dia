import os
import ffmpeg

SUPPORTED_EXTENSIONS = (".wav", ".flac", ".m4a", ".webm", ".ogg", ".aac", ".mp4", ".wma", ".mkv")

FFMPEG_PATH = os.path.join(os.path.dirname(__file__), "ffmpeg.exe")

def convert_to_mp3(input_path):
    for root, _, files in os.walk(input_path):
        for file in files:
            if file.lower().endswith(SUPPORTED_EXTENSIONS):
                input_file = os.path.join(root, file)
                output_file = os.path.splitext(input_file)[0] + ".mp3"

                if os.path.exists(output_file):
                    print(f"Já convertido: {output_file}")
                    continue

                try:
                    print(f"Convertendo: {input_file}")
                    (
                        ffmpeg
                        .input(input_file)
                        .output(output_file, format='mp3', audio_bitrate='192k')
                        .overwrite_output()
                        .run(cmd=FFMPEG_PATH, quiet=True)
                    )

                    print(f"Sucesso: {output_file}")

                    os.remove(input_file)
                    print(f"Original removido: {input_file}")

                except ffmpeg.Error as e:
                    print(f"Erro ao converter {file}:\n{e.stderr.decode() if e.stderr else e}")
                except FileNotFoundError:
                    print(f"ffmpeg.exe não encontrado no caminho: {FFMPEG_PATH}")
                    return
                except Exception as e:
                    print(f"Erro inesperado: {e}")

if __name__ == "__main__":
    folder = input("Digite o caminho da pasta com arquivos de áudio/vídeo: ").strip()
    if not os.path.isdir(folder):
        print("Caminho inválido.")
    else:
        convert_to_mp3(folder)

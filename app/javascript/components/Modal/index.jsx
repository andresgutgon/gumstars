import * as React from 'react'
import { createPortal } from 'react-dom'

const modalRoot = document.getElementById('modal-root')
const Modal = ({ children, onClose }) => {
  const modalWrapper = React.useRef(document.createElement('div'))
  const html = React.useRef(document.getElementsByTagName('html')[0]).current
  React.useEffect(() => {
    function onEsc (event) {
      if (event.key !== 'Escape') return
      onClose()
    }
    modalRoot.appendChild(modalWrapper.current)
    html.style.overflow = 'hidden';
    document.addEventListener('keydown', onEsc)
    return () => {
      html.style.overflow = null;
      modalRoot.removeChild(modalWrapper.current)
      document.removeEventListener('keydown', onEsc)
    }
  }, []) // on mount
  return (
    createPortal(
      <div className="modal">
        <button
          onClick={() => onClose()}
          type="button"
          className="modal-backdrop"
          tabIndex="-1"
        />
        <div className="modal-window">
          <div className='p-6 sm:p-10'>
            {children}
          </div>
        </div>
      </div>,
      modalWrapper.current
    )
  )
}

export default Modal

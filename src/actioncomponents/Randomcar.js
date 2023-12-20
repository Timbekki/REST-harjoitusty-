// RandomCar.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../components/randomCar.css';  // Huomaa, että polku on oikea riippuen tiedoston sijainnista

const RandomCar = () => {
  const [randomCar, setRandomCar] = useState(null);
  const [contactForm, setContactForm] = useState({ name: '', phoneNumber: '' });

  useEffect(() => {
    fetchRandomCar();
  }, []);

  const fetchRandomCar = async () => {
    try {
      const response = await axios.get('http://localhost:3001/random-car');
      setRandomCar(response.data);
    } catch (error) {
      console.error('Virhe haettaessa satunnaista autoa:', error);
    }
  };

  const handleFormChange = (e) => {
    const { name, value } = e.target;
    setContactForm({ ...contactForm, [name]: value });
  };

  const handleContactSubmit = async (e) => {
    e.preventDefault();

    try {
      // Lisäämme myös arvotun auton tiedot toiveeseen
      const toiveData = { ...contactForm, car: randomCar };
      await axios.post('http://localhost:3001/toiveet', toiveData);
      // Arvotaan uusi auto lähettämisen jälkeen
      fetchRandomCar();
    } catch (error) {
      console.error('Virhe lähettäessä yhteydenottolomaketta:', error);
    }
  };

  const handleRandomizeAgain = () => {
    fetchRandomCar();
  };

  return (
    <div className="container">
      <div className="car-container">
        {randomCar ? (
          <div>
            <h2 className='pvauto'>Päivän auto!</h2>
            <h3>{randomCar.merkki}</h3>
            <p>{randomCar.malli}</p>
            <img
              src={randomCar.image_url}
              alt={randomCar.merkki}
              className="car-image"
            />
          </div>
        ) : (
          <p>Ladataan...</p>
        )}
        <button className='arpaNappi' onClick={handleRandomizeAgain}>Arvo uudelleen</button>
      </div>

      <div className="contact-container">
        <h2 className='yhteysP'>Miellyttikö?</h2>
        
        <p>Kiinnostuitko autosta? Jätä alle yhteystietosi
          niin myyjä on sinuun yhteydessä mahdollisimman pian!
        </p>
        <form onSubmit={handleContactSubmit}>
          <label>
            Nimi: 
            <input type="text" name="name" value={contactForm.name} onChange={handleFormChange} />
          </label>
          <br />
          <label>
            Puhnro: 
            <input type="text" name="phoneNumber" value={contactForm.phoneNumber} onChange={handleFormChange} />
          </label>
          <br />
          <button type="submit">Lähetä toive</button>
        </form>
      </div>
    </div>
  );
};

export default RandomCar;

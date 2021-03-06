# gets pet shop name
def pet_shop_name(shop)
    return shop[:name]
end

# gets total cash of pet shop
def total_cash(shop)
    return shop[:admin][:total_cash]
end

# adds or removes cash from shop; negative amount removes cash
def add_or_remove_cash(shop, amount)
    shop[:admin][:total_cash] += amount
    return nil
end

# gets number of pets sold
def pets_sold(shop)
    return shop[:admin][:pets_sold]
end

# increases number of pets sold
def increase_pets_sold(shop, amount)
    shop[:admin][:pets_sold] += amount
    return nil
end

# gets number of pets currently in shop
def stock_count(shop)
    return shop[:pets].length()
end

# gets array of pets of specified breed
def pets_by_breed(shop, breed)
    pets = []
    for pet in shop[:pets]
        pets.append(pet) if (pet[:breed] == breed) 
    end
    return pets
end

# gets a pet of specified name
def find_pet_by_name(shop, name)
    for pet in shop[:pets]
        return pet if (pet[:name] == name)
    end
    return nil
end

# removes pet with specified name from shop
def remove_pet_by_name(shop, name)
    for pet in shop[:pets]
        shop[:pets].delete(pet) if pet[:name] == name
    end
    return nil
end

# adds a pet to shop stock
def add_pet_to_stock(shop, pet)
    shop[:pets].append(pet)
    return nil
end

# gets customer's cash
def customer_cash(customer)
    return customer[:cash]
end

# removes amount from customer's cash
def remove_customer_cash(customer, amount)
    customer[:cash] -= amount
    return nil
end

# gets number of pets owned by customer
def customer_pet_count(customer)
    return customer[:pets].length()
end

# adds a pet to  customer's pet array
def add_pet_to_customer(customer, pet)
    customer[:pets].append(pet)
    return nil
end

# --- Extensions ---

# returns true if customer can afford pet, else false
def customer_can_afford_pet(customer, pet)
    return customer_cash(customer) >= pet[:price]
end

# sells pet to customer only if pet exists and customer can afford it
def sell_pet_to_customer(shop, pet, customer)
    
    if (shop[:pets].include?(pet) && customer_can_afford_pet(customer, pet))
        remove_pet_by_name(shop, pet)
        add_pet_to_customer(customer, pet)

        increase_pets_sold(shop, 1)

        remove_customer_cash(customer, pet[:price])
        add_or_remove_cash(shop, pet[:price])
    end

    return nil
end
import Mathlib
import TauCetiRoadmap.ProfiniteProPGroups.Suggested
import TauCetiRoadmap.ProfiniteArithmetic.Suggested
import TauCetiRoadmap.BelyiMaps.Suggested

set_option autoImplicit false

/-!
# Peripheral actions on free pro-`p` groups: target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. These declarations pin central names and useful Lean forms; proving every item here
does not by itself complete a layer. `sorry` is allowed in this human-owned roadmap library: these
are goals, not proofs.

The carrier is an abstract profinite group `F` with a marked topological isomorphism
`e : F ≃ₜ* freeProP p (Fin r)` to the supplier's standard free pro-`p` group; the basis is
`basis p e i := e.symm (freeProP.of p i)` and the cusp is the inverse of the ordered product of the
basis. Powers are `ProfiniteArithmetic.padicPow`, automorphisms are
`ProfiniteArithmetic.ContinuousAut`, and the central-series arguments use
`ProfiniteArithmetic.closedLowerCentralSeries`. No arithmetic object appears.
-/

namespace TauCetiRoadmap.PeripheralActions

open TauCetiRoadmap.ProfiniteProPGroups TauCetiRoadmap.ProfiniteArithmetic

universe u

section Setup

variable (p : ℕ) [Fact p.Prime] {r : ℕ} {F : Type u} [Group F] [TopologicalSpace F]
  [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F]

/-! ## Layer 0: peripheral systems -/

/-- **Layer 0.** The basis of `F` transported from the standard model along the marked
isomorphism. -/
noncomputable def basis (e : F ≃ₜ* freeProP p (Fin r)) : Fin r → F :=
  fun i => e.symm (freeProP.of p i)

/-- **Layer 0.** The cusp: the inverse of the ordered product of the basis. `List.prod`, not a
`Finset` product, because `F` is not commutative. -/
def cusp (x : Fin r → F) : F := ((List.ofFn x).prod)⁻¹

omit [TopologicalSpace F] [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F] in
/-- **Layer 0.** The defining relation of the peripheral system. -/
theorem prod_mul_cusp (x : Fin r → F) : (List.ofFn x).prod * cusp x = 1 :=
  mul_inv_cancel _

/-- **Layer 0.** The peripheral tuple `x_0, …, x_{r-1}, cusp x`. -/
def peripheralTuple (x : Fin r → F) : Fin (r + 1) → F :=
  Fin.snoc x (cusp x)

/-- **Layer 0, the predicate.** `φ` is peripheral of exponent `u`: it carries every element of the
peripheral tuple to a conjugate of its `u`-th power. Stated with `IsConj`, so that it is closed
under composition and inversion (Layer 3); the constructive theorems of Layers 2 and 4 supply
conjugators explicitly. -/
def IsPeripheralAut (hF : IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) (φ : ContinuousAut F) :
    Prop :=
  ∀ i : Fin (r + 1),
    IsConj (padicPow p hF (peripheralTuple x i) (u : ℤ_[p])) (φ (peripheralTuple x i))

/-- **Layer 0.** Inner automorphisms are peripheral of exponent one. -/
theorem isPeripheralAut_conj (hF : IsProP p F) (x : Fin r → F) (g : F) :
    IsPeripheralAut p hF x 1 (ContinuousAut.conj F g) :=
  sorry

/-- **Layer 0.** The exponent of a peripheral automorphism of a free pro-`p` group of positive
rank is determined: it is the scalar by which `φ` acts on the topological abelianization. -/
theorem exponent_unique (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) (hr : 0 < r)
    {u v : ℤ_[p]ˣ} {φ : ContinuousAut F} (hu : IsPeripheralAut p hF (basis p e) u φ)
    (hv : IsPeripheralAut p hF (basis p e) v φ) : u = v :=
  sorry

/-- **Layer 0, nearby false statement.** The diagonal power map `x_i ↦ x_i ^[p] u` is an
automorphism that is peripheral on the basis but not on the cusp, for `r = 2` and
`u (u - 1) / 2` a unit: its value on `x_0 x_1` is not conjugate to `(x_0 x_1) ^[p] u`. -/
theorem not_isConj_diagonalPow (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin 2)) (u : ℤ_[p]ˣ)
    (hu : ∃ w : ℤ_[p], 2 * w = (u : ℤ_[p]) * ((u : ℤ_[p]) - 1) ∧ IsUnit w) :
    ¬ IsConj (padicPow p hF (basis p e 0 * basis p e 1) u)
        (padicPow p hF (basis p e 0) u * padicPow p hF (basis p e 1) u) :=
  sorry

/-! ## Layer 1: the peripheral product identity -/

/-- **Layer 1.2.** The defect `Ψ (c, d)`: the left-hand side of the peripheral product identity
for the conjugators `c` on the basis and `d` on the cusp. -/
noncomputable def peripheralDefect (hF : IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ)
    (c : Fin r → F) (d : F) : F :=
  (List.ofFn fun i => (c i)⁻¹ * padicPow p hF (x i) u * c i).prod *
    (d⁻¹ * padicPow p hF (cusp x) u * d)

/-- **Layer 1.2.** The defect is continuous in the conjugators. -/
theorem continuous_peripheralDefect (hF : IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) :
    Continuous (fun cd : (Fin r → F) × F => peripheralDefect p hF x u cd.1 cd.2) :=
  sorry

/-- **Layer 1.2.** The level sets `S n := {(c, d) | Ψ (c, d) ∈ γ_n(F)}`. -/
def peripheralLevel (hF : IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) (n : ℕ) :
    Set ((Fin r → F) × F) :=
  {cd | peripheralDefect p hF x u cd.1 cd.2 ∈ closedLowerCentralSeries F n}

theorem isClosed_peripheralLevel (hF : IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) (n : ℕ) :
    IsClosed (peripheralLevel p hF x u n) :=
  sorry

theorem peripheralLevel_antitone (hF : IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) :
    Antitone (peripheralLevel p hF x u) :=
  sorry

/-- **Layer 1.2, level one.** Every pair lies in `S 1`: the defect dies in the topological
abelianization because `z̄ = -(x̄_0 + ⋯ + x̄_{r-1})`. -/
theorem peripheralLevel_one_eq_univ (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r))
    (u : ℤ_[p]ˣ) : peripheralLevel p hF (basis p e) u 1 = Set.univ :=
  sorry

/-- **Layer 1.3, the correction step.** A solution modulo `γ_n(F)` lifts to a solution modulo
`γ_{n+1}(F)` by modifying the conjugators by elements of `γ_{n-1}(F)`, leaving `c 0` untouched.
⚠ The unit hypothesis on `u` is used here and only here. -/
theorem exists_mem_peripheralLevel_succ (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r))
    (u : ℤ_[p]ˣ) (n : ℕ) (hn : 1 ≤ n) (c : Fin r → F) (d : F)
    (h : (c, d) ∈ peripheralLevel p hF (basis p e) u n) :
    ∃ (c' : Fin r → F) (d' : F),
      (∀ i, c' i ∈ closedLowerCentralSeries F (n - 1)) ∧
      d' ∈ closedLowerCentralSeries F (n - 1) ∧
      (∀ h0 : 0 < r, c' ⟨0, h0⟩ = 1) ∧
      ((fun i => c i * c' i), d * d') ∈ peripheralLevel p hF (basis p e) u (n + 1) :=
  sorry

/-- **Layer 1.4, the peripheral product identity.** For every unit `u` there are conjugators
`c` on the basis, with `c 0 = 1`, and `d` on the cusp, with
`∏_i (c i)⁻¹ (x_i ^[p] u) (c i) · d⁻¹ (z ^[p] u) d = 1`. -/
theorem exists_peripheral_identity (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r))
    (u : ℤ_[p]ˣ) :
    ∃ (c : Fin r → F) (d : F), (∀ h0 : 0 < r, c ⟨0, h0⟩ = 1) ∧
      peripheralDefect p hF (basis p e) u c d = 1 :=
  sorry

/-- **Layer 1.4, nearby false statement.** For `p = 2`, `r = 2` and the non-unit exponent `2`
the identity is unsolvable already modulo `γ_2(F)`. -/
theorem not_exists_peripheral_identity_two (hF : IsProP 2 F) (e : F ≃ₜ* freeProP 2 (Fin 2)) :
    ¬ ∃ (c d : F),
      padicPow 2 hF (basis 2 e 0) 2 * (c⁻¹ * padicPow 2 hF (basis 2 e 1) 2 * c)
        * (d⁻¹ * padicPow 2 hF (cusp (basis 2 e)) 2 * d) ∈ closedLowerCentralSeries F 2 :=
  sorry

/-! ## Layer 2: the peripheral-power theorem -/

/-- **Layer 2, the peripheral-power theorem.** For every unit `u` there is a continuous
automorphism carrying `x_0` to `x_0 ^[p] u` on the nose, every other basis element to a conjugate
of its `u`-th power, and the cusp to a conjugate of its `u`-th power, with all conjugators
displayed. -/
theorem exists_peripheralAut (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) (u : ℤ_[p]ˣ) :
    ∃ (φ : ContinuousAut F) (c : Fin r → F) (d : F),
      (∀ h0 : 0 < r, c ⟨0, h0⟩ = 1) ∧
      (∀ i, φ (basis p e i) = (c i)⁻¹ * padicPow p hF (basis p e i) u * c i) ∧
      φ (cusp (basis p e)) = d⁻¹ * padicPow p hF (cusp (basis p e)) u * d :=
  sorry

/-- **Layer 2.** The existence statement in predicate form. -/
theorem exists_isPeripheralAut (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r))
    (u : ℤ_[p]ˣ) : ∃ φ : ContinuousAut F, IsPeripheralAut p hF (basis p e) u φ :=
  sorry

/-- **Layer 2.2, the automorphism criterion.** A continuous endomorphism of `F` sending each
basis element to a conjugate of a unit power of itself is an automorphism, by the Burnside
surjectivity criterion and the Hopf property. -/
theorem exists_continuousAut_of_conj_pow (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r))
    (u : ℤ_[p]ˣ) (c : Fin r → F) :
    ∃ φ : ContinuousAut F, ∀ i, φ (basis p e i) = (c i)⁻¹ * padicPow p hF (basis p e i) u * c i :=
  sorry

/-! ## Layer 3: the group of peripheral automorphisms -/

/-- **Layer 3.1.** Peripheral automorphisms are closed under composition, with exponents
multiplying. -/
theorem IsPeripheralAut.mul (hF : IsProP p F) (x : Fin r → F) {u v : ℤ_[p]ˣ}
    {φ ψ : ContinuousAut F} (hφ : IsPeripheralAut p hF x u φ) (hψ : IsPeripheralAut p hF x v ψ) :
    IsPeripheralAut p hF x (u * v) (φ * ψ) :=
  sorry

/-- **Layer 3.1.** Peripheral automorphisms are closed under inversion, with the inverse
exponent. -/
theorem IsPeripheralAut.inv (hF : IsProP p F) (x : Fin r → F) {u : ℤ_[p]ˣ}
    {φ : ContinuousAut F} (hφ : IsPeripheralAut p hF x u φ) :
    IsPeripheralAut p hF x u⁻¹ φ⁻¹ :=
  sorry

/-- **Layer 3.1.** The subgroup of all peripheral automorphisms. -/
def peripheralAut (hF : IsProP p F) (x : Fin r → F) : Subgroup (ContinuousAut F) where
  carrier := {φ | ∃ u : ℤ_[p]ˣ, IsPeripheralAut p hF x u φ}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- **Layer 3.1.** The exponent character, well defined for positive rank. -/
noncomputable def exponent (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) (hr : 0 < r) :
    peripheralAut p hF (basis p e) →* ℤ_[p]ˣ :=
  sorry

theorem isPeripheralAut_exponent (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) (hr : 0 < r)
    (φ : peripheralAut p hF (basis p e)) :
    IsPeripheralAut p hF (basis p e) (exponent p hF e hr φ) φ :=
  sorry

/-- **Layer 3.1.** The exponent is surjective: Layer 2. -/
theorem exponent_surjective (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) (hr : 0 < r) :
    Function.Surjective (exponent p hF e hr) :=
  sorry

/-- **Layer 3.1.** The inner automorphisms lie in the kernel of the exponent. -/
theorem conj_mem_peripheralAut (hF : IsProP p F) (x : Fin r → F) (g : F) :
    ContinuousAut.conj F g ∈ peripheralAut p hF x :=
  sorry

/-- **Layer 3.2.** The peripheral automorphisms form a closed subgroup for the congruence
topology of ProfiniteArithmetic. -/
theorem isClosed_peripheralAut (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) :
    IsClosed ((peripheralAut p hF (basis p e) : Set (ContinuousAut F))) :=
  sorry

/-- **Layer 3.2.** The exponent is continuous. -/
theorem continuous_exponent (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) (hr : 0 < r) :
    Continuous (exponent p hF e hr) :=
  sorry

/-- **Layer 3.3, the reflection.** The automorphism with
`x_i ↦ (x_0 ⋯ x_{i-1}) x_i⁻¹ (x_0 ⋯ x_{i-1})⁻¹`, an involution carrying the ordered product of the
basis to its inverse. -/
noncomputable def reflect (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) : ContinuousAut F :=
  sorry

theorem reflect_basis (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) (i : Fin r) :
    reflect p hF e (basis p e i)
      = (List.ofFn fun j : Fin i => basis p e (Fin.castLE i.2.le j)).prod * (basis p e i)⁻¹ *
          ((List.ofFn fun j : Fin i => basis p e (Fin.castLE i.2.le j)).prod)⁻¹ :=
  sorry

theorem reflect_cusp (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) :
    reflect p hF e (cusp (basis p e)) = (cusp (basis p e))⁻¹ :=
  sorry

theorem reflect_mul_reflect (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) :
    reflect p hF e * reflect p hF e = 1 :=
  sorry

/-- **Layer 3.3.** The reflection is peripheral of exponent `-1`. -/
theorem isPeripheralAut_reflect (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r)) :
    IsPeripheralAut p hF (basis p e) (-1) (reflect p hF e) :=
  sorry

/-- **Layer 3.3, rank two.** Inverting both generators is peripheral of exponent `-1`, with cusp
conjugator `x_0`. -/
theorem exists_inversion_two (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin 2)) :
    ∃ φ : ContinuousAut F, φ (basis p e 0) = (basis p e 0)⁻¹ ∧ φ (basis p e 1) = (basis p e 1)⁻¹ ∧
      φ (cusp (basis p e)) = (basis p e 0)⁻¹ * (cusp (basis p e))⁻¹ * basis p e 0 :=
  sorry

/-- **Layer 3.3, nearby false statement.** For `r = 3`, inverting every generator is not
peripheral: the images of the ordered product and of its inverse are not conjugate, already
modulo `γ_2(F)`. -/
theorem not_isConj_inversion_three (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin 3)) :
    ¬ IsConj ((cusp (basis p e))⁻¹)
        ((basis p e 2)⁻¹ * (basis p e 1)⁻¹ * (basis p e 0)⁻¹)⁻¹ :=
  sorry

/-- **Layer 3.4.** Peripheral up to a permutation `σ` of the peripheral tuple. -/
def IsPeripheralPermAut (hF : IsProP p F) (x : Fin r → F) (σ : Equiv.Perm (Fin (r + 1)))
    (u : ℤ_[p]ˣ) (φ : ContinuousAut F) : Prop :=
  ∀ i : Fin (r + 1),
    IsConj (padicPow p hF (peripheralTuple x (σ i)) (u : ℤ_[p])) (φ (peripheralTuple x i))

/-- **Layer 3.4, rank two.** The swap of the two generators permutes the first two peripheral
classes and conjugates the cusp by `x_0`. -/
theorem exists_swap_two (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin 2)) :
    ∃ φ : ContinuousAut F, φ (basis p e 0) = basis p e 1 ∧ φ (basis p e 1) = basis p e 0 ∧
      φ (cusp (basis p e)) = (basis p e 0)⁻¹ * cusp (basis p e) * basis p e 0 ∧
      IsPeripheralPermAut p hF (basis p e) (Equiv.swap 0 1) 1 φ :=
  sorry

/-- **Layer 3.4, rank two.** The rotation `x_0 ↦ x_1 ↦ cusp ↦ x_0` is peripheral for the
three-cycle, exactly. -/
theorem exists_rotation_two (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin 2)) :
    ∃ φ : ContinuousAut F, φ (basis p e 0) = basis p e 1 ∧ φ (basis p e 1) = cusp (basis p e) ∧
      φ (cusp (basis p e)) = basis p e 0 :=
  sorry

/-- **Layer 3.5.** The principal units `1 + p^k ℤ_p`. -/
noncomputable def principalUnits (k : ℕ) : Subgroup ℤ_[p]ˣ :=
  MonoidHom.ker (Units.map (PadicInt.toZModPow (p := p) k).toMonoidHom)

/-- **Layer 3.5, the section over the principal units.** With `k = 1` for odd `p` and `k = 2`
for `p = 2`, the exponent has a continuous homomorphic section over `1 + p^k ℤ_p`, obtained
from one peripheral automorphism of exponent `1 + p^k` by the `p`-part and `ℤ_p`-power calculus.
⚠ No section over all of `ℤ_pˣ` is claimed. -/
theorem exists_section_principalUnits (hF : IsProP p F) (e : F ≃ₜ* freeProP p (Fin r))
    (hr : 0 < r) :
    ∃ s : principalUnits p (if p = 2 then 2 else 1) →* peripheralAut p hF (basis p e),
      Continuous s ∧ ∀ v, exponent p hF e hr (s v) = v :=
  sorry

end Setup

/-! ## Layer 4: the dyadic instance -/

section Dyadic

variable {F : Type u} [Group F] [TopologicalSpace F] [IsTopologicalGroup F] [CompactSpace F]
  [TotallyDisconnectedSpace F]

/-- **Layer 4.** `P`, the first generator. -/
noncomputable def periphP (e : F ≃ₜ* freeProP 2 (Fin 2)) : F := basis 2 e 0

/-- **Layer 4.** `T`, the second generator. -/
noncomputable def periphT (e : F ≃ₜ* freeProP 2 (Fin 2)) : F := basis 2 e 1

/-- **Layer 4.** `C := (P * T)⁻¹`, so that `P * T * C = 1`; it is the cusp of the basis. -/
noncomputable def periphC (e : F ≃ₜ* freeProP 2 (Fin 2)) : F := (periphP e * periphT e)⁻¹

omit [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F] in
theorem periphC_eq_cusp (e : F ≃ₜ* freeProP 2 (Fin 2)) : periphC e = cusp (basis 2 e) := by
  simp [periphC, periphP, periphT, cusp, List.ofFn_succ]

omit [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F] in
theorem periphP_mul_periphT_mul_periphC (e : F ≃ₜ* freeProP 2 (Fin 2)) :
    periphP e * periphT e * periphC e = 1 := by
  simp [periphC]

/-- **Layer 4, the dyadic peripheral-power theorem in consumer shape.** For every `u ∈ ℤ₂ˣ` an
automorphism and three conjugators, one for each of `P`, `T`, `C`, with `cP = 1`. -/
theorem exists_peripheralPowerAutomorphism_two (hF : IsProP 2 F) (e : F ≃ₜ* freeProP 2 (Fin 2))
    (u : ℤ_[2]ˣ) :
    ∃ (φ : ContinuousAut F) (cP cT cC : F), cP = 1 ∧
      φ (periphP e) = cP⁻¹ * padicPow 2 hF (periphP e) u * cP ∧
      φ (periphT e) = cT⁻¹ * padicPow 2 hF (periphT e) u * cT ∧
      φ (periphC e) = cC⁻¹ * padicPow 2 hF (periphC e) u * cC :=
  sorry

/-- **Layer 4, the identity form.** The statement consumed by the `G_{ℚ_2}` formalization: three
conjugators whose conjugates of the `u`-th powers multiply to `1`. -/
theorem exists_peripheral_identity_two (hF : IsProP 2 F) (e : F ≃ₜ* freeProP 2 (Fin 2))
    (u : ℤ_[2]ˣ) :
    ∃ cP cT cC : F,
      (cP⁻¹ * padicPow 2 hF (periphP e) u * cP) * (cT⁻¹ * padicPow 2 hF (periphT e) u * cT) *
        (cC⁻¹ * padicPow 2 hF (periphC e) u * cC) = 1 :=
  sorry

/-- **Layer 4, the opposite convention.** The third element `(T * P)⁻¹ = P⁻¹ * C * P` of the
BelyiMaps convention, with the conjugator computed by `conjugation_transfer`. -/
theorem exists_peripheralPowerAutomorphism_two' (hF : IsProP 2 F)
    (e : F ≃ₜ* freeProP 2 (Fin 2)) (u : ℤ_[2]ˣ) :
    ∃ (φ : ContinuousAut F) (cP cT cC' : F),
      φ (periphP e) = cP⁻¹ * padicPow 2 hF (periphP e) u * cP ∧
      φ (periphT e) = cT⁻¹ * padicPow 2 hF (periphT e) u * cT ∧
      φ ((periphT e * periphP e)⁻¹)
        = cC'⁻¹ * padicPow 2 hF ((periphT e * periphP e)⁻¹) u * cC' :=
  sorry

/-- **Layer 4.** The change of convention is the word identity of BelyiMaps, consumed by name. -/
example (e : F ≃ₜ* freeProP 2 (Fin 2)) :
    (periphP e * periphT e)⁻¹ = periphP e * ((periphT e * periphP e)⁻¹) * (periphP e)⁻¹ :=
  TauCetiRoadmap.BelyiMaps.opposite_third_peripheral (periphP e) (periphT e)

/-- **Layer 4, the dyadic section.** A continuous homomorphic section of the exponent over
`1 + 4ℤ₂`, the supplier's `unitsPrincipal 2`. -/
theorem exists_section_unitsPrincipal_two (hF : IsProP 2 F) (e : F ≃ₜ* freeProP 2 (Fin 2)) :
    ∃ s : unitsPrincipal 2 →* peripheralAut 2 hF (basis 2 e),
      Continuous s ∧ ∀ v, exponent 2 hF e (by norm_num) (s v) = v :=
  sorry

end Dyadic

end TauCetiRoadmap.PeripheralActions

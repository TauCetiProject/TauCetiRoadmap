import Mathlib
import TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic
import TauCeti.InformationTheory.Coding.Weight.Enumerator

/-!
# Fixed fibers, parity obstructions and finite reduced-multiplier calculations

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline results; discharging them
finishes neither a layer nor the roadmap.

The statements on the pinned carriers are positive-degree integral-homology finiteness and
order-annihilation, the Hall-coinvariant comparison (RS.0), the two-adic survival criterion
for a finite abelian power equation and the integer-degree generating series (RS.4), and
the index-two, Künneth, exterior-square and ordinary anti-diagonal multiplier comparisons
(RS.6). The filtration and threshold use Tau Ceti's square quotient; the anti-diagonal
model is a subgroup of Mathlib's swap semidirect product.

The full five-term exact sequence (RS.0) and reduced-cover homology image (RS.1) require
IG.3.4's section-cocycle class map and reduced covers, absent at the pins. Local normalization
(RS.1) uses their class-compatible markings. The kernel-action
and finite-level theorems (RS.3), marked fixed-fiber and affine-parity theorems (RS.4), and
finite-model applications (RS.6) require IG.3.4–IG.3.5's universal marked extension, class
degree map and unit action, also absent. The reduced-multiplier comparisons of RS.6 require
the supplied commuting-pair relation subgroup and its quotient. These results have no
statements here until those objects are available; the ordinary integral-homology
comparisons below do not assert a reduced-multiplier identification.

`Multiplier G` abbreviates integral `H₂(G, ℤ)`, with additive notation. The exterior-square
and Künneth comparisons use the oriented cycle `[x|y] − [y|x]`.
-/

noncomputable section

open CategoryTheory TauCeti
open scoped TensorProduct

namespace TauCetiRoadmap.InductionRestrictionPartII

/-- Native integral second group homology, used as an abbreviation throughout the README. -/
abbrev Multiplier (G : Type) [Group G] : Type :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)

/-- **The torsion-image filtration** `B_t` (RS.4.8): the image of the `2^t`-torsion of `A` in
`B = A / A²`. -/
def torsionImageFiltration (A : Type) [CommGroup A] (t : ℕ) :
    Submodule (ZMod 2) (ElementaryTwoQuotient A) :=
  Submodule.span (ZMod 2) (elementaryTwoQuotientMk '' {a : A | a ^ (2 ^ t) = 1})

/-- **The two-primary obstruction threshold** `t_A(b)` (RS.4.9): the least `t` at which
the square class of `b` belongs to `B_t`. -/
def obstructionThreshold {A : Type} [CommGroup A] [Finite A] (b : A) : ℕ :=
  sInf {t : ℕ | elementaryTwoQuotientMk b ∈ torsionImageFiltration A t}

/-- The cyclic group of order two. -/
abbrev C₂ : Type := Multiplicative (ZMod 2)

/-- The swap action of `C₂` on `G × G`. -/
def swapAction (G : Type) [Group G] : C₂ →* MulAut (G × G) where
  toFun g := if g.toAdd.val = 0 then 1 else MulEquiv.prodComm
  map_one' := rfl
  map_mul' := by
    intro g h
    obtain ⟨g, rfl⟩ := Multiplicative.ofAdd.surjective g
    obtain ⟨h, rfl⟩ := Multiplicative.ofAdd.surjective h
    fin_cases g <;> fin_cases h <;> ext x <;> rfl

/-- The **swap wreath product** `W(G) = (G × G) ⋊ C₂`. -/
abbrev SwapWreath (G : Type) [Group G] : Type :=
  (G × G) ⋊[swapAction G] C₂

/-- The product map `G × G → Gᵃᵇ`, `(a, b) ↦ [a][b]`. -/
def abelianizedSum (G : Type) [Group G] : G × G →* Abelianization G :=
  Abelianization.of.comp (MonoidHom.fst G G) * Abelianization.of.comp (MonoidHom.snd G G)

/-- The **sum-kernel model** (RS.6.9): the kernel of `W(G) → Gᵃᵇ`, `((a, b), t) ↦ [a][b]`. For
abelian `G` it is the anti-diagonal model `F(G)` of RS.6.8, and for perfect `G` it is all of
`W(G)`. -/
def sumKernelModel (G : Type) [Group G] : Subgroup (SwapWreath G) :=
  (SemidirectProduct.lift (φ := swapAction G) (abelianizedSum G)
    (1 : C₂ →* Abelianization G) (by
    intro g
    ext x
    change abelianizedSum G ((swapAction G g) x) =
      (1 : Abelianization G) * abelianizedSum G x * 1⁻¹
    rw [one_mul, inv_one, mul_one]
    by_cases hg : g.toAdd.val = 0
    · rw [show swapAction G g = 1 from ite_eq_left hg]
      rfl
    · rw [show swapAction G g = MulEquiv.prodComm from ite_eq_right hg]
      change Abelianization.of x.2 * Abelianization.of x.1 =
        Abelianization.of x.1 * Abelianization.of x.2
      exact mul_comm _ _)).ker

/-- RS.0.2: positive-degree integral homology of a finite group is killed by its order. -/
theorem integralHomology_card_smul (G : Type) [Group G] [Finite G] (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) : Nat.card G • z = 0 := by
  sorry

/-- RS.0.2: positive-degree integral homology of a finite group is finite. -/
theorem integralHomology_finite (G : Type) [Group G] [Finite G] (n : ℕ) :
    Finite (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by
  sorry

/-- RS.0.3: inclusion identifies the conjugation coinvariants of a normal Hall subgroup's
multiplier with the Hall-primary part of the ambient multiplier, with the specified map. -/
theorem multiplier_hallPart (G : Type) [Group G] [Finite G]
    (H : Subgroup G) [H.Normal] (hcoprime : Nat.Coprime (Nat.card H) H.index)
    (ρ : Representation ℤ G (Multiplier H))
    (hρ : ∀ g z, ρ g z = groupHomology.map
      (A := Rep.trivial ℤ H ℤ) (B := Rep.trivial ℤ H ℤ)
      (MulAut.conjNormal g).toMonoidHom (Rep.ofHom ⟨LinearMap.id, by intro h; rfl⟩) 2 z) :
    let ι := groupHomology.map (A := Rep.trivial ℤ H ℤ) (B := Rep.trivial ℤ G ℤ)
      H.subtype (Rep.ofHom ⟨LinearMap.id, by intro h; rfl⟩) 2
    (∃ e : Representation.Coinvariants ρ ≃+ LinearMap.range ι.hom,
      ∀ z, (e (Representation.Coinvariants.mk ρ z) : Multiplier G) = ι z) ∧
    (∀ z : Multiplier G, z ∈ LinearMap.range ι.hom ↔
      ∃ k : ℕ, (Nat.card H) ^ k • z = 0) := by
  sorry

/-- RS.4.10: the finite abelian power equation is solvable exactly at the two-adic
obstruction threshold. Inverting its right side gives the same solvability condition. -/
theorem two_adic_survival {A : Type} [CommGroup A] [Finite A] (b : A) (q : ℕ) (hq : Odd q)
    (hq1 : 1 < q) :
    (∃ h : A, h ^ (q - 1) = b ^ ((q - 1) / 2)) ↔
      obstructionThreshold b + 1 ≤ padicValNat 2 (q - 1) := by
  sorry

/-- RS.4.18: the translated weight polynomial gives the generating series of all integer
degrees with prescribed parities and a nonnegative coordinate lower bound. -/
theorem parity_degree_generatingSeries (N N₀ : ℕ) (C : Set (Fin N → ZMod 2)) :
    PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin N → ℤ //
      (∀ i, (N₀ : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ C ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
      (PowerSeries.X : PowerSeries ℤ) ^ (N * N₀) *
        (Set.weightPolynomial ((fun ε : Fin N → ZMod 2 ↦
          fun i ↦ ε i + (N₀ : ZMod 2)) '' C)).toPowerSeries *
        (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) ^ N := by
  sorry

/-- RS.6.1: a normal odd-order subgroup of index two accounts for the entire multiplier
through its conjugation coinvariants; the ambient multiplier has odd order. -/
theorem odd_index_two_reduction (G : Type) [Group G] [Finite G]
    (H : Subgroup G) [H.Normal] (hodd : Odd (Nat.card H)) (hidx : H.index = 2)
    (ρ : Representation ℤ G (Multiplier H))
    (hρ : ∀ g z, ρ g z = groupHomology.map
      (A := Rep.trivial ℤ H ℤ) (B := Rep.trivial ℤ H ℤ)
      (MulAut.conjNormal g).toMonoidHom (Rep.ofHom ⟨LinearMap.id, by intro h; rfl⟩) 2 z) :
    (∃ e : Multiplier G ≃+ Representation.Coinvariants ρ,
      ∀ z, e (groupHomology.map
        (A := Rep.trivial ℤ H ℤ) (B := Rep.trivial ℤ G ℤ)
        H.subtype (Rep.ofHom ⟨LinearMap.id, by intro h; rfl⟩) 2 z) =
          Representation.Coinvariants.mk ρ z) ∧
    Odd (Nat.card (Multiplier G)) := by
  sorry

/-- RS.6.8: the degree-two Künneth comparison for abelian groups, with the two inclusion
maps and the oriented cross-factor tensor classes specified. -/
theorem multiplier_prod_abelian (A B : Type) [CommGroup A] [CommGroup B] :
    ∃ e : Multiplier (A × B) ≃+
        Multiplier A × Multiplier B × (Additive A ⊗[ℤ] Additive B),
      (∀ z : Multiplier A, e (groupHomology.map
        (A := Rep.trivial ℤ A ℤ) (B := Rep.trivial ℤ (A × B) ℤ)
        (MonoidHom.inl A B) (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2 z) = (z, 0, 0)) ∧
      (∀ z : Multiplier B, e (groupHomology.map
        (A := Rep.trivial ℤ B ℤ) (B := Rep.trivial ℤ (A × B) ℤ)
        (MonoidHom.inr A B) (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2 z) = (0, z, 0)) ∧
      (∀ (a : A) (b : B) (z : groupHomology.cycles₂ (Rep.trivial ℤ (A × B) ℤ)),
        (z : (A × B) × (A × B) →₀ ℤ) =
          Finsupp.single ((a, 1), (1, b)) 1 - Finsupp.single ((1, b), (a, 1)) 1 →
        e (groupHomology.H2π (Rep.trivial ℤ (A × B) ℤ) z) =
          (0, 0, Additive.ofMul a ⊗ₜ[ℤ] Additive.ofMul b)) := by
  sorry

/-- RS.6.8: the integral multiplier of a finite abelian group is its exterior square,
sending each exterior product to its oriented commuting-pair class. -/
theorem abelian_multiplier_exteriorSquare (A : Type) [CommGroup A] [Finite A] :
    ∃ e : (⋀[ℤ]^2 (Additive A)) ≃+ Multiplier A,
      ∀ (a b : A) (z : groupHomology.cycles₂ (Rep.trivial ℤ A ℤ)),
        (z : A × A →₀ ℤ) = Finsupp.single (a, b) 1 - Finsupp.single (b, a) 1 →
        e (exteriorPower.ιMulti ℤ 2 ![Additive.ofMul a, Additive.ofMul b]) =
          groupHomology.H2π (Rep.trivial ℤ A ℤ) z := by
  sorry

/-- RS.6.8: the ordinary integral multiplier of the anti-diagonal model of a finite
abelian group of odd order is isomorphic to the multiplier of its base. -/
theorem antidiagonal_multiplier (G : Type) [CommGroup G] [Finite G]
    (hodd : Odd (Nat.card G)) : Nonempty (Multiplier (sumKernelModel G) ≃+ Multiplier G) := by
  sorry

end TauCetiRoadmap.InductionRestrictionPartII

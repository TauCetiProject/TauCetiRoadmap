import Mathlib

/-!
ClassicalGroupsPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
headline theorems that can be expressed against the pinned APIs.

The integral full invariant presentation, positive invariant presentation,
and exponent-support criterion are stated below on explicit group algebras.
The central-isogeny and reductivity comparison, primitive exterior decomposition,
rational Cartan-model comparison, scalar-extension ring equivalence, rational
character isomorphism, exact tensor-occurrence criterion, tensor-character
isomorphism and representation-ring localization are not statable at the pins:
the GSp coordinate Hopf algebra and hence its finite-comodule category, standard
and primitive objects and representation ring are missing. The existing Sp and
GL coordinate algebras do not supply that independent-multiplier carrier.
-/

noncomputable section

namespace TauCetiRoadmap.ClassicalGroupsPartII

/-! ## Layer CG.0: Algebraic similitudes, diagonal torus and central weights -/

/-- The integral character lattice: `(m,u)` represents `t^m ∏ z_i^(u_i)`. -/
abbrev Weight (g : ℕ) := ℤ × (Fin g → ℤ)

/-- The integral group algebra of the character lattice. -/
abbrev Laurent (g : ℕ) := MonoidAlgebra ℤ (Multiplicative (Weight g))

/-- The basis monomial of an integral torus weight, with coefficient one. -/
def monomial {g : ℕ} (wt : Weight g) : Laurent g :=
  MonoidAlgebra.single (Multiplicative.ofAdd wt) 1

/-- The independent multiplier monomial. -/
def t (g : ℕ) : Laurent g := monomial (1, 0)

/-- The inverse multiplier monomial. -/
def tInv (g : ℕ) : Laurent g := monomial (-1, 0)

/-- The first standard letter in reciprocal pair `i`. -/
def z {g : ℕ} (i : Fin g) : Laurent g := monomial (0, Pi.single i 1)

/-- The second standard letter in pair `i`, with weight `e_t - e_i`. -/
def pairedZ {g : ℕ} (i : Fin g) : Laurent g := monomial (1, -Pi.single i 1)

/-- Relabelling reciprocal pairs permutes the lattice coordinates. -/
def permWeight {g : ℕ} (σ : Equiv.Perm (Fin g)) : Weight g ≃+ Weight g where
  toFun wt := (wt.1, fun i => wt.2 (σ.symm i))
  invFun wt := (wt.1, fun i => wt.2 (σ i))
  left_inv wt := by ext <;> simp
  right_inv wt := by ext <;> simp
  map_add' a b := rfl

/-- The reciprocal flip changes `(m,u)` to `(m+u_i,u[i := -u_i])`. -/
def flipWeight {g : ℕ} (i : Fin g) : Weight g ≃+ Weight g where
  toFun wt := (wt.1 + wt.2 i, Function.update wt.2 i (-wt.2 i))
  invFun wt := (wt.1 + wt.2 i, Function.update wt.2 i (-wt.2 i))
  left_inv wt := by
    apply Prod.ext
    · simp
    · funext j
      by_cases h : j = i <;> simp [h]
  right_inv wt := by
    apply Prod.ext
    · simp
    · funext j
      by_cases h : j = i <;> simp [h]
  map_add' a b := by
    apply Prod.ext
    · simp only [Prod.fst_add, Prod.snd_add, Pi.add_apply]; ring
    · funext j
      by_cases h : j = i <;> simp [h, add_comm]

/-- The group-algebra automorphism induced by a permutation of the pairs. -/
def permLaurent {g : ℕ} (σ : Equiv.Perm (Fin g)) : Laurent g ≃ₐ[ℤ] Laurent g :=
  MonoidAlgebra.domCongr ℤ ℤ (AddEquiv.toMultiplicative (permWeight σ))

/-- The group-algebra automorphism exchanging `z_i` with `t/z_i`. -/
def flipLaurent {g : ℕ} (i : Fin g) : Laurent g ≃ₐ[ℤ] Laurent g :=
  MonoidAlgebra.domCongr ℤ ℤ (AddEquiv.toMultiplicative (flipWeight i))

/-- Laurent polynomials fixed by all pair permutations and reciprocal flips. -/
def invariantSubring (g : ℕ) : Subring (Laurent g) :=
  (⨅ σ : Equiv.Perm (Fin g),
    RingHom.eqLocus (permLaurent σ).toRingHom (RingHom.id _)) ⊓
  (⨅ i : Fin g, RingHom.eqLocus (flipLaurent i).toRingHom (RingHom.id _))

/-! ## Layer CG.2: Integral torus characters and the full representation ring -/

/-- The sum of the two standard letters of pair `i`. -/
def pairSum {g : ℕ} (i : Fin g) : Laurent g := z i + pairedZ i

/-- Elementary exterior character, with integer degree and zero in negative degrees. -/
def exteriorCharacter (g : ℕ) (k : ℤ) : Laurent g :=
  if k < 0 then 0 else
    (∏ i : Fin g, (1 + Polynomial.C (pairSum i) * Polynomial.X +
      Polynomial.C (t g) * Polynomial.X ^ 2)).coeff k.toNat

/-- The primitive exterior character `F_(i+1) = E_(i+1) - t E_(i-1)`. -/
def fundamentalCharacter {g : ℕ} (i : Fin g) : Laurent g :=
  exteriorCharacter g (i.val + 1) - t g * exteriorCharacter g ((i.val + 1 : ℤ) - 2)

/-- The integral Laurent coefficient ring in the independent multiplier. -/
abbrev MultLaurent := MonoidAlgebra ℤ (Multiplicative ℤ)

/-- The positive multiplier basis element of the coefficient ring. -/
def coeffT : MultLaurent := MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1

/-- The negative multiplier basis element of the coefficient ring. -/
def coeffTInv : MultLaurent := MonoidAlgebra.single (Multiplicative.ofAdd (-1 : ℤ)) 1

/-- The full fixed ring is freely polynomial in the primitive characters over
`ℤ[t,t⁻¹]`, with the specified multiplier and variable images (Yu, Remark 7.1.1). -/
theorem fullInvariantPresentation (g : ℕ) :
    ∃ e : MvPolynomial (Fin g) MultLaurent ≃+* invariantSubring g,
      (∀ i : Fin g, (e (MvPolynomial.X i) : Laurent g) = fundamentalCharacter i) ∧
      (e (MvPolynomial.C coeffT) : Laurent g) = t g ∧
      (e (MvPolynomial.C coeffTInv) : Laurent g) = tInv g := by sorry

/-! ## Layer CG.3: Tensor constituents and the positive character algebra -/

/-- The subring generated by the two standard letters of each reciprocal pair. -/
def positiveSubring (g : ℕ) : Subring (Laurent g) :=
  Subring.closure (Set.range (z (g := g)) ∪ Set.range (pairedZ (g := g)))

/-- The intersection of the standard-letter subring with the full fixed ring. -/
def positiveInvariantSubring (g : ℕ) : Subring (Laurent g) :=
  positiveSubring g ⊓ invariantSubring g

/-- The minimum subset-sum functional `m + ∑ min(u_i,0)` on weights. -/
def coneValue {g : ℕ} (wt : Weight g) : ℤ := wt.1 + ∑ i, min (wt.2 i) 0

/-- In positive rank, the generated subring consists exactly of Laurent polynomials
whose nonzero coefficients have nonnegative cone value (Yu, equation (7.1.1)). -/
theorem mem_positiveSubring (g : ℕ) (hg : 0 < g) (f : Laurent g) :
    f ∈ positiveSubring g ↔
      ∀ wt : Weight g, f.coeff (Multiplicative.ofAdd wt) ≠ 0 → 0 ≤ coneValue wt := by sorry

/-- In positive rank the positive fixed ring is freely polynomial over the integers
in the multiplier and primitive characters, with these exact generator images. -/
theorem positiveInvariantPresentation (g : ℕ) (hg : 0 < g) :
    ∃ e : MvPolynomial (Option (Fin g)) ℤ ≃+* positiveInvariantSubring g,
      (e (MvPolynomial.X none) : Laurent g) = t g ∧
      ∀ i : Fin g, (e (MvPolynomial.X (some i)) : Laurent g) =
        fundamentalCharacter i := by sorry

end TauCetiRoadmap.ClassicalGroupsPartII

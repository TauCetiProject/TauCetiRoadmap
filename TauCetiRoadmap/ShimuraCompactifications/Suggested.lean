import Mathlib
import TauCeti.NumberTheory.NumberField.TotallyPositive

/-!
# ShimuraCompactifications: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the definitions and theorem
signatures of the toroidal compactification roadmap that can be stated against the pinned Mathlib and
Tau Ceti APIs, so that contributors and reviewers converge on names, hypotheses and conventions. The
geometric objects of the roadmap (relative torus embeddings, arithmetic cone systems, mixed boundary
data, toroidal and minimal compactifications, semi-abelian schemes and degeneration data, integral and
Hilbert models) need carriers that are not at the pins; they are README targets only and are listed
at the end of the file.

Design choices made explicit here:
* Monoid algebras are Mathlib's `AddMonoidAlgebra R P`; the face projection is coefficient restriction
  `AddMonoidAlgebra.comapDomain` along the inclusion of a face submonoid, never a reduction of the
  coefficient ring `R`, which may be zero or nonreduced (Layer C0, C0.1–C0.7).
* The union of the boundary divisors of a regular chart is cut out by the product monomial
  `x_1⋯x_r`, not by the ideal `(x_1, …, x_r)` of their intersection (C0.18).
* Real embeddings of a totally real field are `embedding_of_isReal`; Mathlib's `InfinitePlace` value is
  their absolute value. Total positivity is Tau Ceti's `NumberField.IsTotallyPositive` (Layer C6).
* Coefficient multipliers of Fourier expansions are units of an arbitrary commutative ring; vanishing
  of a constant term needs an injective multiplier, not merely a multiplier different from `1` (C6.8).
* Cyclotomic phases use integer exponents `n·Tr(ξx)` and only `ζ^n = 1`; they depend on `x` modulo the
  trace dual of the larger module `B` (C6.15–C6.19).
-/

noncomputable section

namespace TauCetiRoadmap.ShimuraCompactifications

open NumberField NumberField.InfinitePlace

/-! ## Layer C0: admissible fans and relative torus embeddings -/

namespace FaceProjection

variable {P : Type*} [AddCommMonoid P]

/-- **Face submonoid** (standing hypothesis (C0-b) of Layer C0). A submonoid `F` of `P` is a face when
`a + b ∈ F` exactly when `a ∈ F` and `b ∈ F`. This is what makes coefficient restriction to `F`
multiplicative. -/
def IsFace (F : AddSubmonoid P) : Prop :=
  ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F

variable (R : Type*) [CommRing R] (F : AddSubmonoid P)

/-- **The off-face monomial ideal** `J_F` (C0.4): the ideal of `R[P]` spanned by the monomials of
degree outside `F`. It is this ideal span, not its radical. -/
def offFaceIdeal : Ideal (AddMonoidAlgebra R P) :=
  Ideal.span {f | ∃ p : P, p ∉ F ∧ f = AddMonoidAlgebra.single p (1 : R)}

/-- **The face projection** `π_{R,F} : R[P] → R[F]` (C0.1): restriction of a finitely supported
coefficient family to the face `F`. On monomials `r e_p ↦ r e_p` for `p ∈ F` and `↦ 0` otherwise
(Lan, *Arithmetic compactifications of PEL-type Shimura varieties*, 6.1.2.1–6.1.2.6, pp. 443–445).
Multiplicativity uses the face condition `hF`. -/
def faceProjection (hF : IsFace F) : AddMonoidAlgebra R P →ₐ[R] AddMonoidAlgebra R F where
  toFun f := AddMonoidAlgebra.comapDomain (fun m : F => (m : P)) Subtype.val_injective f
  map_one' := by have _ := hF; sorry
  map_mul' := by have _ := hF; sorry
  map_zero' := by simp
  map_add' := by intro x y; simp
  commutes' := by have _ := hF; sorry

/-- The face projection on a monomial of degree in `F` (C0.1, `faceProjection_single_mem`). -/
theorem faceProjection_single_mem (hF : IsFace F) {p : P} (hp : p ∈ F) (r : R) :
    faceProjection R F hF (AddMonoidAlgebra.single p r) = AddMonoidAlgebra.single ⟨p, hp⟩ r := by
  sorry

/-- The face projection kills monomials of degree outside `F` (C0.1, `faceProjection_single_not_mem`). -/
theorem faceProjection_single_not_mem (hF : IsFace F) {p : P} (hp : p ∉ F) (r : R) :
    faceProjection R F hF (AddMonoidAlgebra.single p r) = 0 := by
  sorry

/-- **Coefficients of the face projection** (C0.2). -/
theorem faceProjection_coeff (hF : IsFace F) (f : AddMonoidAlgebra R P) (m : F) :
    (faceProjection R F hF f).coeff m = f.coeff (m : P) := by
  sorry

/-- **A section of the face projection** (C0.3): projection after the inclusion `R[F] → R[P]` is the
identity. -/
theorem faceProjection_comp_inclusion (hF : IsFace F) :
    (faceProjection R F hF).comp
        (AddMonoidAlgebra.mapDomainAlgHom R R (F.subtype : F →+ P)) =
      AlgHom.id R (AddMonoidAlgebra R F) := by
  sorry

/-- **The kernel of the face projection** is the off-face monomial ideal (C0.4). -/
theorem ker_faceProjection (hF : IsFace F) :
    RingHom.ker (faceProjection R F hF).toRingHom = offFaceIdeal R F := by
  sorry

/-- **The integral stratum quotient** (C0.5, milestone of the coefficient part of Layer C0):
`R[P]/J_F ≅ R[F]`, with the class of `f` sent to `π_{R,F}(f)`. -/
theorem faceQuotient_equiv (hF : IsFace F) :
    ∃ e : (AddMonoidAlgebra R P ⧸ offFaceIdeal R F) ≃ₐ[R] AddMonoidAlgebra R F,
      ∀ f, e (Ideal.Quotient.mk (offFaceIdeal R F) f) = faceProjection R F hF f := by
  sorry

/-- **Coefficient change commutes with face projection** (C0.6), for every ring homomorphism, flat or
not. -/
theorem faceProjection_coefficient_change (hF : IsFace F) {S : Type*} [CommRing S] (φ : R →+* S)
    (f : AddMonoidAlgebra R P) :
    faceProjection S F hF (AddMonoidAlgebra.mapRingHom P φ f) =
      AddMonoidAlgebra.mapRingHom F φ (faceProjection R F hF f) := by
  sorry

/-- **The face ideal commutes with coefficient change** (C0.7). -/
theorem offFaceIdeal_map {S : Type*} [CommRing S] (φ : R →+* S) :
    (offFaceIdeal R F).map (AddMonoidAlgebra.mapRingHom P φ) = offFaceIdeal S F := by
  sorry

-- The positive-degree monomial is killed over `ℤ/4` (C0.1, `faceProjection_positive_test`).
example (hF : IsFace (⊥ : AddSubmonoid ℕ)) :
    faceProjection (ZMod 4) ⊥ hF (AddMonoidAlgebra.single 1 1) = 0 := by
  sorry

-- The nilpotent scalar `2` survives (C0.1, `faceProjection_nilpotent_test`).
example (hF : IsFace (⊥ : AddSubmonoid ℕ)) :
    (faceProjection (ZMod 4) ⊥ hF (AddMonoidAlgebra.single 0 2)).coeff 0 = 2 ∧
      (2 : ZMod 4) ≠ 0 := by
  sorry

-- The even submonoid of `ℕ` is not a face: `1 + 1` is even but `1` is not (C0.1).
example : ¬ IsFace (AddSubmonoid.closure {2} : AddSubmonoid ℕ) := by
  sorry

-- Zero is preserved (C0.1, `faceProjection_zero_test`).
example (hF : IsFace F) : faceProjection R F hF 0 = 0 := by
  sorry

-- The Laurent direction of degree `−1` survives (C0.1, `faceProjection_laurent_test`).
example (hF : IsFace (⊤ : AddSubmonoid ℤ)) :
    (faceProjection ℤ ⊤ hF (AddMonoidAlgebra.single (-1) 1)).coeff ⟨-1, by simp⟩ = 1 := by
  sorry

-- Coefficients over the zero ring satisfy the same formula (C0.2).
example [Subsingleton R] (hF : IsFace F) (f : AddMonoidAlgebra R P) (m : F) :
    (faceProjection R F hF f).coeff m = f.coeff (m : P) := by
  sorry

-- Distinct face degrees retain their two coefficients separately (C0.2).
example (hF : IsFace F) (m n : F) (hmn : m ≠ n) (a b : R) :
    let f : AddMonoidAlgebra R P :=
      AddMonoidAlgebra.single (m : P) a + AddMonoidAlgebra.single (n : P) b
    (faceProjection R F hF f).coeff m = a ∧ (faceProjection R F hF f).coeff n = b := by
  sorry

-- An arbitrary element, including sums and nilpotents, is recovered by the section (C0.3).
example (hF : IsFace F) (f : AddMonoidAlgebra R F) :
    faceProjection R F hF
      (AddMonoidAlgebra.mapDomainAlgHom R R (F.subtype : F →+ P) f) = f := by
  sorry

-- The off-face ideal keeps the nilpotent constant (C0.4).
example : AddMonoidAlgebra.single 0 (2 : ZMod 4) ∉ offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ) := by
  sorry

-- With every degree in the face the off-face ideal is zero (C0.4).
example : offFaceIdeal R (⊤ : AddSubmonoid P) = ⊥ := by
  sorry

-- On the ray the off-face ideal is generated by the degree-one monomial (C0.4).
example : offFaceIdeal ℤ (⊥ : AddSubmonoid ℕ) =
    Ideal.span {AddMonoidAlgebra.single 1 (1 : ℤ)} := by
  sorry

-- Use an equivalence witness with the formula of C0.5 (`faceQuotient_zero_test`).
example (hF : IsFace F)
    (e : (AddMonoidAlgebra R P ⧸ offFaceIdeal R F) ≃ₐ[R] AddMonoidAlgebra R F)
    (he : ∀ f, e (Ideal.Quotient.mk (offFaceIdeal R F) f) = faceProjection R F hF f) :
    e (Ideal.Quotient.mk (offFaceIdeal R F) 0) = 0 := by
  sorry

-- The quotient kills positive degree (`faceQuotient_positive_test`, C0.5).
example (hF : IsFace (⊥ : AddSubmonoid ℕ))
    (e : (AddMonoidAlgebra (ZMod 4) ℕ ⧸ offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ)) ≃ₐ[ZMod 4]
      AddMonoidAlgebra (ZMod 4) (⊥ : AddSubmonoid ℕ))
    (he : ∀ f, e (Ideal.Quotient.mk (offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ)) f) =
      faceProjection (ZMod 4) ⊥ hF f) :
    e (Ideal.Quotient.mk (offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ)) (AddMonoidAlgebra.single 1 1)) = 0 := by
  sorry

-- The coefficient `2 : ZMod 4` survives the quotient (`faceQuotient_nilpotent_test`, C0.5).
example (hF : IsFace (⊥ : AddSubmonoid ℕ))
    (e : (AddMonoidAlgebra (ZMod 4) ℕ ⧸ offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ)) ≃ₐ[ZMod 4]
      AddMonoidAlgebra (ZMod 4) (⊥ : AddSubmonoid ℕ))
    (he : ∀ f, e (Ideal.Quotient.mk (offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ)) f) =
      faceProjection (ZMod 4) ⊥ hF f) :
    (e (Ideal.Quotient.mk (offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ))
      (AddMonoidAlgebra.single 0 2))).coeff 0 = 2 ∧ (2 : ZMod 4) ≠ 0 := by
  sorry

-- The Laurent quotient retains exponent `−1` (`faceQuotient_laurent_test`, C0.5).
example (hF : IsFace (⊤ : AddSubmonoid ℤ))
    (e : (AddMonoidAlgebra ℤ ℤ ⧸ offFaceIdeal ℤ (⊤ : AddSubmonoid ℤ)) ≃ₐ[ℤ]
      AddMonoidAlgebra ℤ (⊤ : AddSubmonoid ℤ))
    (he : ∀ f, e (Ideal.Quotient.mk (offFaceIdeal ℤ (⊤ : AddSubmonoid ℤ)) f) = faceProjection ℤ ⊤ hF f) :
    (e (Ideal.Quotient.mk (offFaceIdeal ℤ (⊤ : AddSubmonoid ℤ))
      (AddMonoidAlgebra.single (-1) 1))).coeff ⟨-1, by simp⟩ = 1 := by
  sorry

-- Nonflat coefficient change `ZMod 4 → ZMod 2` commutes with projection (C0.6).
example (hF : IsFace F) (f : AddMonoidAlgebra (ZMod 4) P) :
    let φ : ZMod 4 →+* ZMod 2 := ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)
    faceProjection (ZMod 2) F hF (AddMonoidAlgebra.mapRingHom P φ f) =
      AddMonoidAlgebra.mapRingHom F φ (faceProjection (ZMod 4) F hF f) := by
  sorry

-- The identity coefficient change preserves the projection (C0.6).
example (hF : IsFace F) (f : AddMonoidAlgebra R P) :
    faceProjection R F hF (AddMonoidAlgebra.mapRingHom P (RingHom.id R) f) =
      faceProjection R F hF f := by
  sorry

-- A composite coefficient change obeys the same square (C0.6).
example {S T : Type*} [CommRing S] [CommRing T] (φ : R →+* S) (ψ : S →+* T)
    (hF : IsFace F) (f : AddMonoidAlgebra R P) :
    faceProjection T F hF (AddMonoidAlgebra.mapRingHom P (ψ.comp φ) f) =
      AddMonoidAlgebra.mapRingHom F ψ
        (AddMonoidAlgebra.mapRingHom F φ (faceProjection R F hF f)) := by
  sorry

-- The fixed off-face generating ideal survives nonflat change (C0.7).
example :
    let φ : ZMod 4 →+* ZMod 2 := ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)
    (offFaceIdeal (ZMod 4) (⊥ : AddSubmonoid ℕ)).map
      (AddMonoidAlgebra.mapRingHom ℕ φ) = offFaceIdeal (ZMod 2) (⊥ : AddSubmonoid ℕ) := by
  sorry

end FaceProjection

namespace ToricBoundary

variable (R : Type*) [CommRing R]

/-- The coordinate algebra `R[x_1, …, x_r, y_1^{±1}, …, y_s^{±1}]` of a regular toric chart, as the
monoid algebra of `ℕ^r × ℤ^s` (C0.10). -/
abbrev RegularChart (r s : ℕ) : Type _ :=
  AddMonoidAlgebra R ((Fin r → ℕ) × (Fin s → ℤ))

/-- The product monomial `t = x_1⋯x_r`, which cuts out the union of the boundary divisors (C0.18). -/
def boundaryProduct (r s : ℕ) : RegularChart R r s :=
  AddMonoidAlgebra.single ((fun _ => 1), 0) 1

/-- **The integral toroidal boundary is flat** (C0.18, milestone): the quotient of a regular chart by
the product monomial is flat over every commutative ring `R`. -/
theorem boundaryUnion_flat (r s : ℕ) :
    Module.Flat R (RegularChart R r s ⧸ Ideal.span {boundaryProduct R r s}) := by
  sorry

/-- **Finite toric maps for a change of lattice, rank one** (C0.20): the map `q ↦ q^e` of the ray
chart is finite over every commutative ring. -/
theorem changeLattice_finite_rankOne (e : ℕ) (he : 0 < e) :
    (AddMonoidAlgebra.mapDomainRingHom R (AddMonoidHom.mulLeft e : ℕ →+ ℕ)).Finite := by
  sorry

-- Over `ℤ/4` the boundary ideal of the ray chart does not contain the constant `2` (C0.18).
example : AddMonoidAlgebra.single 0 (2 : ZMod 4) ∉ Ideal.span {boundaryProduct (ZMod 4) 1 0} := by
  sorry

-- Positivity only in the interior does not define the boundary ideal: `x ∉ (xy)` (C3.5).
example :
    (AddMonoidAlgebra.single ((fun i : Fin 2 => if i = 0 then 1 else 0), 0) (1 : ℤ) :
      RegularChart ℤ 2 0) ∉ Ideal.span {boundaryProduct ℤ 2 0} := by
  sorry

-- With no boundary rays the boundary equation is a unit and its ideal is the whole ring (C0.18).
example : Ideal.span {boundaryProduct ℤ 0 0} = ⊤ := by
  sorry

-- Lan's support-function convention is superadditive (C0.15): the inequality is strict here.
example :
    let pol : ℝ × ℝ → ℝ := fun v => v.1 + v.2 + min v.1 v.2
    pol (1, 1) = 3 ∧ pol (1, 0) + pol (0, 1) = 2 := by
  sorry

-- The quadrant union ideal is the intersection of the two coordinate ideals (C0.18).
example :
    let x : RegularChart R 2 0 :=
      AddMonoidAlgebra.single ((fun i => if i = 0 then 1 else 0), 0) 1
    let y : RegularChart R 2 0 :=
      AddMonoidAlgebra.single ((fun i => if i = 1 then 1 else 0), 0) 1
    Ideal.span {boundaryProduct R 2 0} = Ideal.span {x} ⊓ Ideal.span {y} := by
  sorry

-- Intersecting both coordinate divisors leaves the coefficient ring (C0.18).
example :
    let x : RegularChart R 2 0 :=
      AddMonoidAlgebra.single ((fun i => if i = 0 then 1 else 0), 0) 1
    let y : RegularChart R 2 0 :=
      AddMonoidAlgebra.single ((fun i => if i = 1 then 1 else 0), 0) 1
    Nonempty ((RegularChart R 2 0 ⧸ Ideal.span {x, y}) ≃ₐ[R] R) := by
  sorry

-- The nilpotent constant remains nonzero in the boundary quotient (C0.18).
example :
    Ideal.Quotient.mk (Ideal.span {boundaryProduct (ZMod 4) 1 0})
      (AddMonoidAlgebra.single 0 2) ≠ 0 := by
  sorry

-- Without boundary rays the quotient is the zero ring (C0.18).
example (s : ℕ) :
    Subsingleton (RegularChart R 0 s ⧸ Ideal.span {boundaryProduct R 0 s}) := by
  sorry

-- One boundary coordinate leaves precisely the Laurent directions (C0.18).
example (s : ℕ) :
    Nonempty ((RegularChart R 1 s ⧸ Ideal.span {boundaryProduct R 1 s}) ≃ₐ[R]
      AddMonoidAlgebra R (Fin s → ℤ)) := by
  sorry

-- Multiplication by the boundary equation remains injective over nonreduced rings (C0.18).
example (r s : ℕ) : Function.Injective (fun f : RegularChart R r s => boundaryProduct R r s * f) := by
  sorry

end ToricBoundary

/-! ## Layer C6: Hilbert cusp arithmetic -/

namespace HilbertCusp

variable {F : Type*} [Field F] [NumberField F] [IsTotallyReal F]
variable {R : Type*} [CommRing R]

/-- **A contracting unit** (C6.1): in a finite-index subgroup of units of a totally real field of
degree `> 1`, some unit is large at a given place and small at all others (Dimitrov, proof of
Théorème 8.3, p. 547). -/
theorem exists_unit_contracting_away (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0)
    (hd : 1 < Fintype.card (InfinitePlace F)) (w₀ : InfinitePlace F) :
    ∃ u ∈ U, 1 < w₀ (((u : (𝓞 F)ˣ) : 𝓞 F) : F) ∧
      ∀ w, w ≠ w₀ → w (((u : (𝓞 F)ˣ) : 𝓞 F) : F) < 1 := by
  sorry

/-- **A negative embedding** (C6.2): a nonzero element that is not totally positive is negative at
some real place. The hypothesis `ξ ≠ 0` is needed. -/
theorem exists_negative_embedding {ξ : F} (hξ : ξ ≠ 0) (hpos : ¬ IsTotallyPositive ξ) :
    ∃ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ < 0 := by
  sorry

/-- **Unbounded negative traces along unit orbits** (C6.3). -/
theorem trace_pairing_unbounded_below (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0)
    (hd : 1 < Fintype.card (InfinitePlace F)) {ξ : F} (hξ : ξ ≠ 0) (hpos : ¬ IsTotallyPositive ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w) (B : ℝ) :
    ∃ u ∈ U, ∑ w : InfinitePlace F,
      embedding_of_isReal (IsTotallyReal.isReal w) ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) * y w < B := by
  sorry

/-- **Unit covariance preserves nonvanishing** (C6.4), over any commutative ring. -/
theorem coeff_ne_zero_iff_of_unit_covariance (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ)
    (u : U) (ξ : F) :
    a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) ≠ 0 ↔ a ξ ≠ 0 := by
  sorry

/-- **Koecher support** (C6.5, milestone of the arithmetic part of Layer C6): a unit-covariant
coefficient family whose support has traces bounded below is supported on `0` and the totally positive
elements. The coefficient ring is arbitrary; the multipliers are units. -/
theorem bounded_cusp_support_is_positive (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0)
    (hd : 1 < Fintype.card (InfinitePlace F)) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w)
    (hbound : ∃ B : ℝ, ∀ ξ : F, a ξ ≠ 0 →
      B ≤ ∑ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ * y w) :
    ∀ ξ : F, a ξ ≠ 0 → ξ = 0 ∨ IsTotallyPositive ξ := by
  sorry

/-- **Totally positive characters pair positively with boundary rays** (C6.6). -/
theorem trace_pos_of_totallyPositive {ξ : F} (hξ : IsTotallyPositive ξ)
    (v : InfinitePlace F → ℝ) (hv : ∀ w, 0 ≤ v w) (hv0 : v ≠ 0) :
    0 < ∑ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ * v w := by
  sorry

/-- **The constant coefficient is annihilated by `c(u, 0) − 1`** (C6.7). -/
theorem constant_coeff_annihilated (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ) (u : U) :
    ((c u 0 : R) - 1) * a 0 = 0 := by
  sorry

/-- **Vanishing of the constant term** (C6.8): it needs a multiplier `c(u, 0) − 1` that is not a zero
divisor. -/
theorem constant_coefficient_eq_zero (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ)
    (u : U) (hregular : ∀ r : R, ((c u 0 : R) - 1) * r = 0 → r = 0) :
    a 0 = 0 := by
  sorry

-- Over `ℚ` the unit orbit of `−1` is `{−1}`, so degree one is excluded (C6.3, C6.11).
example (u : (𝓞 ℚ)ˣ) : (((u : 𝓞 ℚ) : ℚ)) ^ 2 * (-1 : ℚ) = -1 := by
  sorry

-- A nonunit multiplier can kill a nonzero coefficient (C6.4).
example : (2 : ZMod 4) * 2 = 0 ∧ (2 : ZMod 4) ≠ 0 := by
  decide

-- A unit different from `1` can fix a nonzero nilpotent coefficient (C6.8).
example : (3 : ZMod 4) ≠ 1 ∧ (3 : ZMod 4) * 2 = 2 ∧ (2 : ZMod 4) ≠ 0 := by
  sorry

-- `0` is not totally positive, so `ξ = 0` must be excluded in C6.2.
example : ¬ IsTotallyPositive (0 : ℚ) := by
  sorry

-- At exponent zero the trace pairing vanishes for every positive vector (C6.3).
example (y : InfinitePlace F → ℝ) :
    (∑ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) (0 : F) * y w) = 0 := by
  sorry

-- The two real embeddings of `ℚ(√2)` evaluate the orbit of `−√2` under `(1+√2)^n`
-- as this sequence, tending to `−∞` (C6.3).
example : Filter.Tendsto
    (fun n : ℕ => -Real.sqrt 2 * (1 + Real.sqrt 2) ^ (2 * n) +
      Real.sqrt 2 * (1 - Real.sqrt 2) ^ (2 * n)) Filter.atTop Filter.atBot := by
  sorry

end HilbertCusp

/-! ### Layer C6: cyclotomic trace phases -/

namespace CyclotomicPhase

variable {K : Type*} [Field K] [NumberField K]
variable {R : Type*} [CommRing R]

/-- **Integral trace exponents** (C6.15). -/
theorem trace_exponent_integral (A B : Submodule ℤ K) (n : ℕ)
    (hn : ∀ ξ : K, ξ ∈ B → n • ξ ∈ A)
    (ξ x : K) (hξ : ξ ∈ B) (hx : x ∈ Submodule.traceDual ℤ ℚ A) :
    ∃ m : ℤ, (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x) := by
  sorry

/-- **Congruence of exponents under a change of lift** (C6.16). -/
theorem trace_exponents_congruent (B : Submodule ℤ K) (n : ℕ) (ξ x x' : K)
    (hξ : ξ ∈ B) (hx : x' - x ∈ Submodule.traceDual ℤ ℚ B) (m m' : ℤ)
    (hm : (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (hm' : (m' : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x')) :
    ∃ k : ℤ, m' - m = n * k := by
  sorry

/-- **Phases do not depend on the lift** (C6.17): only `ζ^n = 1` is used. -/
theorem phase_independent_of_lift (B : Submodule ℤ K) (n : ℕ) (ξ x x' : K)
    (hξ : ξ ∈ B) (hx : x' - x ∈ Submodule.traceDual ℤ ℚ B) (m m' : ℤ)
    (hm : (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (hm' : (m' : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x'))
    (ζ : Rˣ) (hζ : ζ ^ (n : ℤ) = 1) :
    ζ ^ m' = ζ ^ m := by
  sorry

/-- **Phases are additive** (C6.18). -/
theorem phase_additive (n : ℕ) (ξ η x : K) (m₁ m₂ m₃ : ℤ)
    (h₁ : (m₁ : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (h₂ : (m₂ : ℚ) = (n : ℚ) * Algebra.trace ℚ K (η * x))
    (h₃ : (m₃ : ℚ) = (n : ℚ) * Algebra.trace ℚ K ((ξ + η) * x)) (ζ : Rˣ) :
    ζ ^ m₃ = ζ ^ m₁ * ζ ^ m₂ := by
  sorry

/-- **The phase function** underlying `tracePhase` (C6.19): `ξ ↦ ζ^{n·Tr(ξx)}`, the exponent being the
numerator of the rational number `n·Tr(ξx)`, which is an integer under the hypotheses of C6.15. -/
def tracePhaseFun (n : ℕ) (x : K) (ζ : Rˣ) (ξ : K) : Rˣ :=
  ζ ^ ((n : ℚ) * Algebra.trace ℚ K (ξ * x)).num

/-- The phase function is additive on `B` when `nB ⊆ A` and `x ∈ traceDual(A)` (C6.19,
`tracePhase_add`). -/
theorem tracePhaseFun_add (A B : Submodule ℤ K) (n : ℕ) (hn : ∀ ξ : K, ξ ∈ B → n • ξ ∈ A)
    (x : K) (hx : x ∈ Submodule.traceDual ℤ ℚ A) (ζ : Rˣ) {ξ η : K} (hξ : ξ ∈ B) (hη : η ∈ B) :
    tracePhaseFun n x ζ (ξ + η) = tracePhaseFun n x ζ ξ * tracePhaseFun n x ζ η := by
  sorry

-- For `K = ℚ`, `n = 3`, `x = 1`, the phase at `1/3` is `ζ` (C6.19, `phase_third_denominator`).
example (ζ : Rˣ) : tracePhaseFun (K := ℚ) 3 (1 : ℚ) ζ (1 / 3) = ζ := by
  sorry

-- The lift matters modulo `traceDual(B)`, not `traceDual(A)` (C6.19, `phase_wrong_dual`): for `n = 4`,
-- `ζ = 2` in `(ℤ/5)ˣ`, the phases at `1/4` for `x = 1` and `x = 0` are `2` and `1`.
example (ζ : (ZMod 5)ˣ) (hζ : (ζ : ZMod 5) = 2) :
    tracePhaseFun (K := ℚ) 4 (1 : ℚ) ζ (1 / 4) ≠ tracePhaseFun (K := ℚ) 4 (0 : ℚ) ζ (1 / 4) := by
  sorry

-- The zero character value is one over every coefficient ring (C6.19, `phase_zero_character`).
example (n : ℕ) (x : K) (ζ : Rˣ) : tracePhaseFun n x ζ 0 = 1 := by
  sorry

-- Over the zero ring the same value is the unique unit (C6.19, `phase_zero_character`).
example [Subsingleton R] (ζ : Rˣ) : tracePhaseFun (K := ℚ) 3 1 ζ 0 = 1 := by
  sorry

-- Shifting `x` by `3 ∈ traceDual(⅓ℤ)` preserves the character (C6.19, `phase_dual_shift`).
example (ζ : Rˣ) (hζ : ζ ^ (3 : ℤ) = 1) (ξ : ℚ) (hξ : ∃ m : ℤ, ξ = (m : ℚ) / 3) :
    tracePhaseFun (K := ℚ) 3 4 ζ ξ = tracePhaseFun (K := ℚ) 3 1 ζ ξ := by
  sorry

-- The nonprimitive fourth root `3 : (ZMod 8)ˣ` has order two (C6.19, `phase_nonprimitive`).
example (ζ : (ZMod 8)ˣ) (hζ : (ζ : ZMod 8) = 3) :
    ζ ^ (4 : ℤ) = 1 ∧ ζ ^ (2 : ℤ) = 1 ∧ ζ ≠ 1 ∧
      tracePhaseFun (K := ℚ) 4 1 ζ (1 / 4) = ζ ∧
      tracePhaseFun (K := ℚ) 4 1 ζ (1 / 2) = 1 := by
  sorry

end CyclotomicPhase

/-! ## Layer C4: finite symplectic Klingen checks -/

-- In the frame e₁,e₂,f₁,f₂, the admissible subgroup is isotropic of the specified type (C4.16).
example (p : ℕ) [Fact p.Prime] :
    let V := Fin 4 → ZMod (p ^ 2)
    let e : Fin 4 → V := fun i => Pi.single i 1
    let L : Submodule (ZMod (p ^ 2)) V :=
      Submodule.span (ZMod (p ^ 2)) {e 0, (p : ZMod (p ^ 2)) • e 1, (p : ZMod (p ^ 2)) • e 3}
    (∀ x ∈ L, ∀ y ∈ L, x 0 * y 2 + x 1 * y 3 - x 2 * y 0 - x 3 * y 1 = 0) ∧
      Nonempty (L ≃+ (ZMod (p ^ 2) × ZMod p × ZMod p)) := by
  sorry

-- The disjoint level H₁ yields a cyclic quotient generated by f₁, of order p² (C4.16).
example (p : ℕ) [Fact p.Prime] :
    let V := Fin 4 → ZMod (p ^ 2)
    let e : Fin 4 → V := fun i => Pi.single i 1
    let L : Submodule (ZMod (p ^ 2)) V :=
      Submodule.span (ZMod (p ^ 2)) {e 0, (p : ZMod (p ^ 2)) • e 1, (p : ZMod (p ^ 2)) • e 3}
    let H : Submodule (ZMod (p ^ 2)) V :=
      Submodule.span (ZMod (p ^ 2)) {(p : ZMod (p ^ 2)) • e 2}
    let mulP : V →ₗ[ZMod (p ^ 2)] V := (p : ZMod (p ^ 2)) • LinearMap.id
    let N := H.comap mulP ⊔ L
    L ⊓ H = ⊥ ∧ Nonempty ((N.map L.mkQ) ≃+ ZMod (p ^ 2)) ∧
      N.map L.mkQ = Submodule.span (ZMod (p ^ 2)) {L.mkQ (e 2)} ∧
      addOrderOf (L.mkQ (e 2)) = p ^ 2 := by
  sorry

-- The isotropic free rank-two subgroup has the wrong type and a noncyclic new level (C4.16).
example (p : ℕ) [Fact p.Prime] :
    let V := Fin 4 → ZMod (p ^ 2)
    let e : Fin 4 → V := fun i => Pi.single i 1
    let L₀ : Submodule (ZMod (p ^ 2)) V := Submodule.span (ZMod (p ^ 2)) {e 0, e 1}
    let H : Submodule (ZMod (p ^ 2)) V :=
      Submodule.span (ZMod (p ^ 2)) {(p : ZMod (p ^ 2)) • e 2}
    let mulP : V →ₗ[ZMod (p ^ 2)] V := (p : ZMod (p ^ 2)) • LinearMap.id
    let N := H.comap mulP ⊔ L₀
    (∀ x ∈ L₀, ∀ y ∈ L₀, x 0 * y 2 + x 1 * y 3 - x 2 * y 0 - x 3 * y 1 = 0) ∧
      Nonempty (L₀ ≃+ (ZMod (p ^ 2) × ZMod (p ^ 2))) ∧
      Nonempty ((N.map L₀.mkQ) ≃+ (ZMod (p ^ 2) × ZMod p)) ∧
      ¬ IsAddCyclic (N.map L₀.mkQ) := by
  sorry

/-! ## Layer C6: an injective nonflat coefficient inclusion -/

-- Evaluation at zero splits the coefficient map into this quotient (C6.41).
example :
    let A := Polynomial (ZMod 4) ⧸
      Ideal.span {Polynomial.C (2 : ZMod 4) * Polynomial.X}
    Function.Injective (algebraMap (ZMod 4) A) := by
  sorry

-- The class of X is killed by 2 but is not a 2-multiple, so the quotient is nonflat (C6.41).
example :
    let A := Polynomial (ZMod 4) ⧸
      Ideal.span {Polynomial.C (2 : ZMod 4) * Polynomial.X}
    ¬ Module.Flat (ZMod 4) A := by
  sorry

end TauCetiRoadmap.ShimuraCompactifications

/-
Further README targets and API not declared here. The geometric carriers are not at the pins;
the elementary API and additional Checks of C0.1 are specified in the README.
Layer C0: additional API `faceProjection_eq_comapDomain` (C0.1); `TauCeti.TorusTorsor.characterDecomposition`, `TauCeti.Toric.Relative.torusEmbedding`,
`faceOpenImmersion`, `regularCoordinateIso`, `stratumQuotientIso`, `boundaryCoordinateIso`,
`isProper_iff_support`, `ArithmeticFan` with `commonRefinement` and
`exists_smoothProjective_refinement`, `TauCeti.Toric.finiteFanScheme`, `TauCeti.Toric.completedChart_coeff`,
`TauCeti.Toric.changeLattice_finite`.
Layer C1: `MixedBoundaryDatum`, `BoundaryMHS`, `BoundaryTorsor`, `CuspLabel`,
`CuspLabel.arithmeticStabilizer`, `CuspLabel.finite_overlap`, `CuspLabel.boundary_incidence`.
Layer C2: `PartialBoundaryChart`, `quotient_separation`, `ToroidalSpace` with `normal`,
`interior_dense`, `compact_of_complete`, `smooth_normalCrossings`, `algebraization`, `toMinimal`;
`ToroidalCanonicalModel`; `MixedShimura.canonicalModel_exists`. Layer C2.general:
`ToroidalCanonicalModel.general`.
Layer C3: `ToroidalRefinement` with `levelDatum_extend`, `choice_comparison`,
`pushforward_structureSheaf`, `higherDirectImage_structureSheaf`, `pushforward_boundaryIdeal`,
`cohomology_iso`, `completed_local`, `algebraicSpace_formalFunctions` (C3.6a, for proper locally
Noetherian algebraic spaces and coherent completion data); `ToroidalHeckeSpan`; `TauCeti.Toric.subdivision_structureSheaf`.
Layer C3.general: `ToroidalCanonicalModel.general_functorial`.
Layer C4: `SemiAbelianScheme` uses `GroupScheme.IsSemiAbelianFamily` supplied by
ArakelovGeometryAndAbelianHeights §2.0, with `characterSheaf_spec`, `hodgeBundle`, `hom_extend`,
`isogeny_extend_quasiFiniteFlat`, `hasse_det`; `TorusExtension.classification`;
`PolarizedDegenerationData`; `MumfordDegeneration` with `equivalence`, `tate_compare` (for `A = 0`, `X = Y = ℤ`,
the standard principal polarization and positive period),
`tate_logKodairaSpencer`; `UniversalDegeneration` with `endomorphism_extend`, `level_compare`
(tame degeneration data and characteristic-zero p-level comparison; integral higher-p-level
boundary charts are C5.19–C5.20);
`SemiAbelianTateModule`; `KlingenToroidalCorrespondence` with `t1_acyclic`; `GroupScheme.verschiebung`.
Layer C5: `GoodCuspModel` (its Tate comparison Check uses elliptic data `A = 0`, `X = Y = ℤ`
and the standard principal polarization) with `etaleRelation`; `IntegralToroidalModel` with `formalCompletion`,
`proper`, `boundaryIntersection_smooth`, `exactStratum_fiberwiseDense`, `stratumComponent_eq`,
`stratumClosure_proper`, `stein_factor_finiteEtale`, `strata_detect_geometricComponents`,
`nonneat_descent`, `logKodairaSpencer`,
`hodgeLine_semiample`, `hodgeSectionAlgebra_fg`, `formallyCanonical`, `koecher`, `siegel_koecher`,
`ordinary_koecher`, `cyclicLevel_extend`, `siegel_canonicalBundle`, `goodReduction_geometry`;
`HodgeLineFJ`; `IntegralMinimalModel` with `hodgeLine_ample`, `moduli_quasiProjective`;
`NormalizedToroidalModel` with `chart_compare`; `ProjectiveToroidalModel`; `PrimeQGeneratorCover`;
`HilbertSiegel.minimalBoundary_codim`, `HilbertSiegel.formal_koecher`;
`SemiAbelianScheme.hodgeLine_generated`, `SemiAbelianScheme.isotrivial_of_degree_le_zero`.
Layer C6: `HilbertModular.meromorphic_support_bound`, `cusp_support_positive`, `koecher`,
`cuspidal_iff_constantTerm_eq_zero`, `HilbertCusp.Data`, `HilbertCusp.lattice_eq`,
`HilbertCusp.cocharacter_eq_traceDual`, `HilbertCusp.unramified_iff`,
`HilbertCusp.tracePairing_natural` (C6.13); `HilbertCusp.admissibleFan_iff`, `HilbertCusp.stabilizer_exact`, `CyclotomicPhase.tracePhase`,
`HilbertModular.cuspChart_family`, `toroidal_exists`, `toroidal_polarizationQuotient`,
`boundary_formal`, `boundary_etaleToric`, `regularRefinement_smooth`, `semiAbelian_extend`,
`conormal_compare`, `toroidal_proper`, `hodgeLine_semiample`, `minimal_contraction`, `sectionRing_fg`,
`minimal_normal_projective`, `minimal_polarizationQuotient`, `minimal_cusps`, `minimal_boundaryFibres`,
`minimal_formal`, `minimal_weightExtends_iff`, `qExpansion_compare`, `qExpansion_injective_module`,
`qExpansion_injective`, `qExpansion_descent`, `boundaryIdeal_pushforward`, `integralModel_compare`,
`hasseIdeal_compare`, `boundary_ordinary`, `nearOrdinary_compare`, `nearOrdinary_quotient`,
`levelMap_extend`, `integralDifferentials_compare`, `degreeOne_compare`, `degreeOne_cuspParameter`,
`degreeOne_primeDiamond`, `boundary_globalFunctions`; `FormalGluing.effective` (exactness only on permitted boundary-specializing points);
`HilbertModular.idealLevelModel` (C6.12a). The iff of `minimal_weightExtends_iff` requires parallel
weight and trivial cusp characters, with residual inertia trivial on coarse models.
`cuspChart_family` is built from C4.4–C4.6 without the good-prime hypothesis (C4-b), on
`Spec R̂_σ`, with abelian locus `Spec R̂_σ[1/t]` and formal family on `Spf R̂_σ`.
`HilbertModular.artinianRaynaudUniformization` (C6.20a) retains polarization and ideal-level data
on permitted Artinian thickenings and supplies the infinitesimal condition of `toroidal_exists`.
C6.20–C6.27 give scheme-valued fine families at neat tame level. At general (C6-a) levels,
`toroidal_exists`, `semiAbelian_extend` and `conormal_compare` retain the compactified quotient
stack and its inertia; coarse descent requires the respective trivial stabilizer actions.
-/

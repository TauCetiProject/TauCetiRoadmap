import Mathlib
import TauCeti.RepresentationTheory.SymmetricPower
import TauCeti.NumberTheory.ModularForms.Fricke.Matrix
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Composite
import TauCeti.NumberTheory.ModularForms.QExpansion.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.FieldTheory.FunctionField.Divisor.Conorm

/-!
# ModularCurvesPartII: representative target signatures

The definitive roadmap is README.md. This file is not exhaustive: it records light
real-bodied definitions and representative theorem signatures statable against the
pinned APIs. It fixes the pseudo-reflection convention of Serre's regularity criterion,
the lattice cubic's coordinate factors, the distinction between all and cyclic subgroup
counts, the analytic Fricke map as the action of Tau Ceti's Fricke matrix, integral image
and coefficient conventions, and the Taylor–Wiles minus sign. Geometric constructions
whose carriers are not available remain targets of README.md; the generalized elliptic
curve, its polygons and the n-gon Tate family are those of AdicSpacesPartIII.
Their supplier is §R2.11, `compactified-moduli-generalised-elliptic-curves`.
-/

namespace TauCetiRoadmap.ModularCurvesPartII

universe u

open scoped BigOperators TensorProduct
noncomputable section

/-! ## Conventions -/

/-- The normalized cubic associated with a genuine rank-two complex period pair. -/
def latticeWeierstrass (L : PeriodPair) : WeierstrassCurve ℂ where
  a₁ := 0
  a₂ := 0
  a₃ := 0
  a₄ := -L.g₂ / 4
  a₆ := -L.g₃ / 4

/-- Principal-level ordinary characters that vanish at a deeper principal level. -/
def IsCongruenceCharacter (N q : ℕ)
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) : Prop :=
  ∃ M : ℕ, 0 < M ∧ N ∣ M ∧
    ∀ (g : CongruenceSubgroup.Gamma N), g.val ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul g) = 0

open HeckeRing.GL2

local notation "S₂(" N ")" =>
  cuspFormCharSpace (N := N) (2 : ℤ) (1 : (ZMod N)ˣ →* ℂˣ)

/-- The full complex Hecke image on weight-two trivial-character cusp forms, generated
by every positive-index operator, including the bad-prime blocks (README §7.5). -/
def analyticFullHeckeAlgebra (N : ℕ) [NeZero N] :
    Subalgebra ℂ (Module.End ℂ S₂(N)) :=
  Algebra.adjoin ℂ (Set.range fun n : ℕ+ =>
    heckeRingHomCuspCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ)
      (heckeTCompositeGamma0 N n))

/-- The complex first-coefficient pairing `β(T,f)=a₁(Tf)`, on the full operator image
and the whole weight-two trivial-character cusp space (README §7.5). -/
def firstCoefficientHeckePairing (N : ℕ) [NeZero N] :
    analyticFullHeckeAlgebra N →ₗ[ℂ] S₂(N) →ₗ[ℂ] ℂ :=
  ((LinearMap.llcomp ℂ S₂(N) S₂(N) ℂ)
    ((CuspForm.qExpansionCoeffₗ (by norm_num) (TauCeti.one_mem_strictPeriods_Gamma1_map N)
      2 1).comp (cuspFormCharSpace (N := N) 2 (1 : (ZMod N)ˣ →* ℂˣ)).subtype)).comp
    (analyticFullHeckeAlgebra N).val.toLinearMap

/-! ## Milestones on existing carriers -/

/-- The full Hecke first-coefficient pairing is perfect over `ℂ`, identifying each
space with the other's dual, including the zero-dimensional case (README §7.6). -/
theorem perfectHeckePairing (N : ℕ) [NeZero N] :
    (firstCoefficientHeckePairing N).IsPerfPair := by
  sorry

/-- Every positive-index Hecke operator reads the corresponding Fourier coefficient,
including indices sharing a prime factor with the level (README §7.5). -/
theorem firstCoefficientHeckePairing_Tn (N : ℕ) [NeZero N] (n : ℕ+) (f : S₂(N)) :
    firstCoefficientHeckePairing N
      ⟨heckeRingHomCuspCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ)
        (heckeTCompositeGamma0 N n), Algebra.subset_adjoin ⟨n, rfl⟩⟩ f =
      (UpperHalfPlane.qExpansion 1
        (f : CuspForm ((CongruenceSubgroup.Gamma1 N).map
          (Matrix.SpecialLinearGroup.mapGL ℝ)) 2)).coeff n := by
  sorry

/-- Multiplication in the full Hecke image agrees with its action in the second
argument of the first-coefficient pairing (README §7.5). -/
theorem firstCoefficientHeckePairing_action (N : ℕ) [NeZero N]
    (S T : analyticFullHeckeAlgebra N) (f : S₂(N)) :
    firstCoefficientHeckePairing N (S * T) f =
      firstCoefficientHeckePairing N S (T.val f) := by
  sorry

/-- The discriminant of the normalized lattice cubic is `g₂³ − 27g₃²` (README §1.1). -/
theorem latticeWeierstrass_discriminant (L : PeriodPair) :
    (latticeWeierstrass L).Δ = L.g₂ ^ 3 - 27 * L.g₃ ^ 2 := by
  sorry

/-- The normalized lattice cubic is nonsingular (README §1.1):
`Δ = g₂³ - 27g₃² ≠ 0`. -/
theorem latticeWeierstrass_isElliptic (L : PeriodPair) :
    (latticeWeierstrass L).IsElliptic := by
  sorry

/-- The Weierstrass functions give affine points of the normalized cubic away from
lattice poles, with the factor `1/2` in the y-coordinate (README §1.1). -/
theorem latticeWeierstrass_equation (L : PeriodPair) (z : ℂ) (hz : z ∉ L.lattice) :
    (latticeWeierstrass L).toAffine.Equation (L.weierstrassP z)
      (L.derivWeierstrassP z / 2) := by
  sorry

/-- The analytic Fricke map is the Möbius action of Tau Ceti's Fricke matrix
`[[0, -1], [N, 0]]`, of determinant `N > 0`: on `ℍ` it is `τ ↦ -1/(Nτ)`. No separate
complex formula is introduced; `N = 0` has no Fricke matrix (README §9.3). -/
theorem frickeGL_smul_coe (N : ℕ) [NeZero N] (τ : UpperHalfPlane) :
    ((TauCeti.frickeGL ℝ N • τ : UpperHalfPlane) : ℂ) = -1 / ((N : ℂ) * τ) := by
  sorry

/-- Applying the Fricke matrix twice is the identity of `ℍ`, since its square is the
scalar `-N` (README §9.3). -/
theorem frickeGL_smul_smul (N : ℕ) [NeZero N] (τ : UpperHalfPlane) :
    TauCeti.frickeGL ℝ N • TauCeti.frickeGL ℝ N • τ = τ := by
  sorry

/-- An agreeing pair of ordinary characters under the two principal-level degeneracy
restrictions is congruence (README §15.6; CDT Lemma 4.6.2). The second leg is specified
by conjugation with `diag(p,1)`; the coefficient prime may equal p. -/
theorem iharaPrincipal_congruenceKernel (N p q : ℕ) (hN : 3 ≤ N)
    (hp : p.Prime) (hq : q.Prime) (hpN : ¬ p ∣ N)
    (c : ↥(CongruenceSubgroup.Gamma N ⊓ CongruenceSubgroup.Gamma0 p) →*
      CongruenceSubgroup.Gamma N)
    (hc : ∀ g, (c g).val.val.map (Int.castRingHom ℚ) =
      Matrix.diagonal ![(p : ℚ), 1] * g.val.val.map (Int.castRingHom ℚ) *
        Matrix.diagonal ![(p : ℚ)⁻¹, 1])
    (ψ φ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hagree : ∀ g, ψ (Additive.ofMul ⟨g.val, g.property.1⟩) =
      φ (Additive.ofMul (c g))) :
    IsCongruenceCharacter N q ψ ∧ IsCongruenceCharacter N q φ := by
  sorry

/-- A character whose every ambient conjugation difference is congruence is itself
congruence (README §15.9; CDT Corollary 4.5.3). The ambient action factors through
`SL₂(ℤ/N)` because inner conjugations fix additive characters. -/
theorem congruenceClasses_invariant (N q : ℕ) (hN : 3 ≤ N) (hq : q.Prime)
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) :
    letI : (CongruenceSubgroup.Gamma N).Normal := CongruenceSubgroup.Gamma_normal N
    (∀ g : Matrix.SpecialLinearGroup (Fin 2) ℤ, IsCongruenceCharacter N q
      (ψ.comp (MulAut.conjNormal g).toMonoidHom.toAdditive - ψ)) →
        IsCongruenceCharacter N q ψ := by
  sorry

/-- Agreement after restriction to `Γ(N) ∩ Γ₁(p)` still forces both ordinary
characters to be congruence (README §15.10; CDT Lemma 4.6.3), for every coefficient
prime, including primes dividing the intermediate covering degree. -/
theorem iharaPrincipalGamma1_congruenceKernel (N p q : ℕ) (hN : 3 ≤ N)
    (hp : p.Prime) (hq : q.Prime) (hpN : ¬ p ∣ N)
    (c : ↥(CongruenceSubgroup.Gamma N ⊓ CongruenceSubgroup.Gamma1 p) →*
      CongruenceSubgroup.Gamma N)
    (hc : ∀ g, (c g).val.val.map (Int.castRingHom ℚ) =
      Matrix.diagonal ![(p : ℚ), 1] * g.val.val.map (Int.castRingHom ℚ) *
        Matrix.diagonal ![(p : ℚ)⁻¹, 1])
    (ψ φ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hagree : ∀ g, ψ (Additive.ofMul ⟨g.val, g.property.1⟩) =
      φ (Additive.ofMul (c g))) :
    IsCongruenceCharacter N q ψ ∧ IsCongruenceCharacter N q φ := by
  sorry

/-! ## Layer 0: general inputs on stacks and invariant rings -/

/-- An endomorphism `σ` is a pseudo-reflection when `1 - σ` has rank at most one, so the
identity counts (Edixhoven, Remark 1.1.4.2). Serre's criterion of README §0.2 asks that the
image of a finite group in `GL(m/m²)` be generated by such elements. -/
def IsPseudoReflection {k V : Type*} [Field k] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V]
    (σ : V →ₗ[k] V) : Prop :=
  Module.finrank k (LinearMap.range (LinearMap.id - σ)) ≤ 1

/-- The identity is a pseudo-reflection. -/
example {k V : Type*} [Field k] [AddCommGroup V] [Module k V] [FiniteDimensional k V] :
    IsPseudoReflection (LinearMap.id : V →ₗ[k] V) := by
  unfold IsPseudoReflection
  rw [sub_self, LinearMap.range_zero, finrank_bot]
  exact zero_le_one

/-! ## Layer 2: generalized elliptic curves and polygons -/

/-- The integral split one-gon equation; its projective normalization is a README target. -/
def splitOneGonEquation : WeierstrassCurve ℤ where
  a₁ := 1
  a₂ := 0
  a₃ := 0
  a₄ := 0
  a₆ := 0

/-! ## Layer 3: integral level stacks and the open comparison -/

/-- Exponents of the basis of the fibre of the proper Tate power map at a node.
The geometric length comparison belongs to §3.7; this is its finite enumeration. -/
def nodePowerFibreMonomials (m : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range m).product (Finset.range m)).filter
    (fun ij => ij.1 = 0 ∨ ij.2 = 0)

/-- The square map has fibre basis 1,x,y: length three, not generic degree two. -/
example : nodePowerFibreMonomials 2 = {(0, 0), (1, 0), (0, 1)} ∧
    (nodePowerFibreMonomials 2).card = 3 := by decide

/-- Node-fibre length for positive power; no zero-power isogeny is asserted. -/
theorem nodePowerFibreMonomials_card (m : ℕ) (hm : 0 < m) :
    (nodePowerFibreMonomials m).card = 2 * m - 1 := by
  sorry

/-- The row action on the positive-pairing frame `(τ/N, 1/N)` has period
`(aτ+c)/(bτ+d)`: it is Mathlib's left action of the transpose label matrix.
The fibre multiplier is `(bτ+d)⁻¹`, as in README §3.14. -/
theorem positiveFrame_changeMarking (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (τ : UpperHalfPlane) :
    ((γ.transpose • τ : UpperHalfPlane) : ℂ) =
      ((γ 0 0 : ℂ) * (τ : ℂ) + (γ 1 0 : ℂ)) /
        ((γ 0 1 : ℂ) * (τ : ℂ) + (γ 1 1 : ℂ)) := by
  sorry

/-! ## Layer 4: connected components under field extension -/

open CategoryTheory Limits AlgebraicGeometry in
/-- Extending a separably closed base field preserves all connected components of a
scheme, through the actual base-change projection (README §4.9; Stacks 0363). -/
theorem connectedComponents_fieldExtension {k K : Type u} [Field k] [IsSepClosed k]
    [Field K] [Algebra k K] (X : Scheme.{u}) (f : X ⟶ Spec (.of k)) :
    Function.Bijective
      (pullback.fst f (Spec.map (CommRingCat.ofHom (algebraMap k K)))).continuous.connectedComponentsMap := by
  sorry

/-! ## Layer 9: algebraic correspondences and quotient curves -/

/-- Arithmetic degree of a prime degeneracy leg at positive level.
The geometric finite-flatness theorem is separate from this numerical function. -/
def degeneracyDegree (N p : ℕ) : ℕ := if p ∣ N then p else p + 1

/-- HNF branches of the all-subgroup correspondence, with ad=m and b<d. -/
def allSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  ((Finset.range (m + 1)).product
    ((Finset.range (m + 1)).product (Finset.range (m + 1)))).filter
    (fun t => 0 < t.1 ∧ 0 < t.2.1 ∧ t.1 * t.2.1 = m ∧ t.2.2 < t.2.1)

/-- The cyclic HNF filter; it omits the scalar subgroup E[r] for r>1. -/
def cyclicSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  (allSubgroupBranches m).filter (fun t => Nat.gcd (Nat.gcd t.1 t.2.1) t.2.2 = 1)

/-- Full-subgroup counting milestone, §9.9. -/
theorem allSubgroupBranches_card (m : ℕ) (hm : 0 < m) :
    (allSubgroupBranches m).card = ∑ d ∈ m.divisors, d := by
  sorry

/-- Prime-square cyclic degree milestone: ψ(p²)=p²+p. -/
theorem cyclicSubgroupBranches_primeSquare_card (p : ℕ) (hp : p.Prime) :
    (cyclicSubgroupBranches (p ^ 2)).card = p ^ 2 + p := by
  sorry

/-- At the first nonsquarefree level, the all-subgroup and cyclic degrees differ. -/
example : (allSubgroupBranches 4).card = 7 ∧ (cyclicSubgroupBranches 4).card = 6 := by
  decide

/-- The scalar branch belongs to the all-subgroup set and fails the cyclic filter. -/
example : (2, 2, 0) ∈ allSubgroupBranches 4 ∧ (2, 2, 0) ∉ cyclicSubgroupBranches 4 := by
  decide

/-! ## Layer 11: explicit semistable split-Cartan models -/

/-- Ramification exponent for the split-Cartan normalizer model X_s⁺ of README §11.7,
with the chosen root ϖ^((ℓ²−1)/2)=ℓ. BDMTV Theorems 6.5–6.6, pp.928–929;
the chosen root is stronger than its square equation. -/
def splitCartanRamificationIndex (ℓ : ℕ) : ℕ := (ℓ ^ 2 - 1) / 2

/-- Edixhoven's exponent at ℓ=12k+1, with no primality assertion for arbitrary k. -/
theorem splitCartanRamificationIndex_eq (k : ℕ) :
    splitCartanRamificationIndex (12 * k + 1) = 12 * k * (6 * k + 1) := by
  sorry

/-- Arithmetic genus of the stated normalizer fibre: component genera plus b₁(K_(k,3)).
Its geometric interpretation requires ℓ=12k+1 prime and k≥1 (BDMTV Theorem 6.6, p.929). -/
def splitCartanFibreGenus (k : ℕ) : ℕ :=
  k * (3 * k) + 2 * ((k - 1) * (3 * k - 2) / 2) + (3 * k + 1 - (k + 3))

/-- The fibre genus is the genus 6k²−3k of X_s⁺(ℓ). -/
theorem splitCartanFibreGenus_eq (k : ℕ) (hk : 1 ≤ k) :
    splitCartanFibreGenus k = 6 * k ^ 2 - 3 * k := by
  sorry

/-! ## Layer 13: function-field divisor norm -/

section DivisorNorm
open TauCeti

variable {k k' F F' : Type*} [Field k] [Field k'] [Field F] [Field F']
    [Algebra k k'] [Algebra k F] [Algebra k' F'] [Algebra F F'] [Algebra k F']
    [IsScalarTower k k' F'] [IsScalarTower k F F'] [FiniteDimensional F F']

/-- Pushforward of function-field divisors, weighted by residue degree (README §13.2).
The upper and lower constant fields can differ. -/
def functionFieldDivisorNorm : Divisor k' F' →+ Divisor k F :=
  Finsupp.liftAddHom fun P' =>
    zmultiplesHom _ ((Place.relativeDegree k F P' : ℤ) •
      TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint (P'.restrict k F))

/-- A single place pushes forward with its residue-field degree, rather than its
ramification index (README §13.2). -/
theorem functionFieldDivisorNorm_ofPoint (P' : Place k' F') :
    functionFieldDivisorNorm (TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint P') =
      (Place.relativeDegree k F P' : ℤ) •
        TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint (P'.restrict k F) := by
  sorry

/-- Divisor norm preserves degree measured over the lower constants; changing constants
contributes their extension degree (README §13.2). -/
theorem functionFieldDivisorNorm_degree [FiniteDimensional k k']
    (hF : IsFunctionField k F) (hF' : IsFunctionField k' F') (D' : Divisor k' F') :
    Divisor.degree (functionFieldDivisorNorm (k := k) (F := F) D') =
      (Module.finrank k k' : ℤ) * Divisor.degree D' := by
  sorry

/-- Divisor norm carries a principal divisor to the divisor of the field norm,
including finite inseparable extensions (README §13.2). -/
theorem functionFieldDivisorNorm_principal
    (hF : IsFunctionField k F) (hF' : IsFunctionField k' F') (z : F'ˣ) :
    functionFieldDivisorNorm (Divisor.principal hF' z) =
      Divisor.principal hF (Units.map (Algebra.norm F : F' →* F) z) := by
  sorry

/-- Norm after the pinned conorm is multiplication by the full field degree,
including its inseparable part (README §13.2). -/
theorem functionFieldDivisorNorm_conorm
    (hF : IsFunctionField k F) (D : Divisor k F) :
    functionFieldDivisorNorm (Divisor.conorm k' F' D) =
      (Module.finrank F F' : ℤ) • D := by
  sorry

end DivisorNorm

/-! ## Layer 14: cohomological realizations and parabolic lattices -/

/-- Specialize the existing symmetric-power action to weight k≥2, without defining
geometric relative H¹ or claiming that its fibre has already been constructed. -/
def weightCoefficients {R : Type} {G M : Type*} [CommRing R] [Group G]
    [AddCommGroup M] [Module R M] (ρ : Representation R G M) (k : ℕ) (_hk : 2 ≤ k) :
    Representation R G (Sym[R]^(k - 2) M) := ρ.symmetricPower (k - 2)

section Parabolic
variable {R C H : Type*} [CommRing R]
    [AddCommGroup C] [Module R C] [AddCommGroup H] [Module R H]

/-- Notation for Mathlib's image submodule of the actual support-forgetting map. -/
abbrev parabolicH1 (u : C →ₗ[R] H) : Submodule R H := LinearMap.range u

end Parabolic

/-- Permutation model for the diamond on the five width-one cusps at Γ₁(11),
with coefficients in 𝔽₅: the basis vector at `i` maps to that at `i + 1`. -/
def levelElevenCuspCycle : Module.End (ZMod 5) (ZMod 5 → ZMod 5) where
  toFun v i := v (i - 1)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- The cusp cycle is a nonidentity unipotent operator of order five in characteristic
five; a scalar extension cannot make it diagonalizable (README §14.9). -/
theorem levelElevenCuspCycle_unipotent :
    levelElevenCuspCycle ^ 5 = 1 ∧ levelElevenCuspCycle ≠ 1 ∧
      (levelElevenCuspCycle - 1) ^ 5 = 0 := by
  sorry

/-- The residue-sum kernel still has nontrivial unipotent action: for `v = e₁ - e₀`,
the next difference is `e₂ - 2e₁ + e₀`, which is nonzero. -/
example :
    let e₀ : ZMod 5 → ZMod 5 := Pi.single 0 1
    let v := (levelElevenCuspCycle - 1) e₀
    (∑ i, v i) = 0 ∧ (levelElevenCuspCycle - 1) v ≠ 0 := by
  decide

/-- Notation for Mathlib's ideal comap along the inverse adjoint ring equivalence.
For an involution `ι`, it consists of `t` such that `ι t` lies in `m` (README §14.11). -/
abbrev adjointIdeal {T : Type*} [CommRing T] (ι : T ≃+* T) (m : Ideal T) : Ideal T :=
  m.comap ι.symm.toRingHom

/-- A diamond-invariant bilinear pairing vanishes on a same-character block when
`a² - 1` is a unit. Its dual block has the inverse character (README §14.11). -/
theorem diamondPairing_sameCharacter_zero {R M : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] (B : M →ₗ[R] M →ₗ[R] R) (D : M →ₗ[R] M)
    (hB : ∀ x y, B (D x) (D y) = B x y) (a : R) (ha : IsUnit (a ^ 2 - 1))
    (x y : M) (hx : D x = a • x) (hy : D y = a • y) : B x y = 0 := by
  sorry

/-! ## Layer 15: Ihara and change of level -/

section Degeneracy
variable {R H H' : Type*} [CommRing R]
    [AddCommGroup H] [Module R H] [AddCommGroup H'] [Module R H']

/-- Notation for Mathlib's coprod of the two actual geometric pullbacks. -/
abbrev degeneracyH1 (a b : H →ₗ[R] H') : H × H →ₗ[R] H' := a.coprod b

end Degeneracy

/-- The general-character degeneracy norm determinant retains the inverse diamond unit.
README §15.8 uses its symmetric specialization only under actual trivial integral action. -/
theorem degeneracyNormMatrix_det {R : Type*} [CommRing R] (a b : R) (d : Rˣ) :
    Matrix.det !![a, b; (↑(d⁻¹) : R) * b, a] = a ^ 2 - (↑(d⁻¹) : R) * b ^ 2 := by
  rw [Matrix.det_fin_two_of]
  ring

/-- A finite codomain does not force an ordinary character to be congruence.
CDT Theorem 4.5.2 and the genus-zero four-cusp quotient Γ(3) give this negative control. -/
theorem exists_noncongruenceCharacter_level_three :
    ∃ ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma 3)) (ZMod 5),
      ¬ IsCongruenceCharacter 3 5 ψ := by
  sorry

/-! ## Layer 16: weight-two modular abelian quotients -/

section NormPull
open CategoryTheory TauCeti.AlgebraicGeometry

/-- A positive norm–pullback composite and equal dimensions make the pullback an
isogeny: its kernel is contained in the finite multiplication kernel (README §16.6). -/
theorem isogeny_of_norm_pull {K : Type} [Field K]
    (A B : AbelianVariety K) (u : A ⟶ B) (v : B ⟶ A)
    (d : ℕ) (hd : 0 < d) (hdim : A.dim = B.dim)
    (hcomp : u ≫ v = AbelianVariety.mulBy A (d : ℤ)) :
    AbelianVariety.IsIsogeny u := by
  sorry

end NormPull

/-- Notation for Mathlib's kernel ideal of the actual geometric Hecke eigencharacter. -/
abbrev heckePrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) : Ideal T :=
  RingHom.ker χ

/-! ## Layer 17: bad-prime and Taylor–Wiles interfaces -/

/-- Degree-zero combinations on the supplied geometric supersingular intersection set. -/
def supersingularDegreeZero (S : Type*) : Submodule ℤ (S →₀ ℤ) :=
  LinearMap.ker (Finsupp.linearCombination ℤ (fun _ : S => (1 : ℤ)))

section Minus
variable {O M : Type*} [CommRing O] [AddCommGroup M] [Module O M]

/-- Minus part for the actual conjugation involution on the supplied cover cohomology. -/
def taylorWilesMinus (ξ : M →ₗ[O] M) : Submodule O M :=
  LinearMap.ker (ξ + LinearMap.id)

/-- The projector only has geometric meaning with u=2 and ξ²=id. -/
def taylorWilesMinus_projector (ξ : M →ₗ[O] M) (u : Oˣ) : M →ₗ[O] M :=
  (↑u⁻¹ : O) • (LinearMap.id - ξ)

/-- Algebraic milestone for the minus summand; the two-invertibility assumption is explicit. -/
theorem taylorWilesMinus_projector_range (ξ : M →ₗ[O] M)
    (hξ : ξ.comp ξ = LinearMap.id) (u : Oˣ) (hu : (u : O) = 2) :
    LinearMap.range (taylorWilesMinus_projector ξ u) = taylorWilesMinus ξ := by sorry

/-- The minus projector is idempotent for an involution when two is a unit
(README §17.8). -/
theorem taylorWilesMinus_projector_idempotent (ξ : M →ₗ[O] M)
    (hξ : ξ.comp ξ = LinearMap.id) (u : Oˣ) (hu : (u : O) = 2) :
    (taylorWilesMinus_projector ξ u).comp (taylorWilesMinus_projector ξ u) =
      taylorWilesMinus_projector ξ u := by
  sorry

end Minus

/-- In characteristic two identity and negation coincide, so a complementary projector fails. -/
example {O M : Type*} [CommRing O] [CharP O 2] [AddCommGroup M] [Module O M] :
    taylorWilesMinus (LinearMap.id : M →ₗ[O] M) = ⊤ := by
  have htwo : (2 : O) = 0 := CharP.cast_eq_zero O 2
  have hsum : (LinearMap.id : M →ₗ[O] M) + LinearMap.id = 0 := by
    ext x
    simpa only [LinearMap.add_apply, LinearMap.id_apply, LinearMap.zero_apply,
      two_smul, zero_smul] using congrArg (fun a : O => a • x) htwo
  simp [taylorWilesMinus, hsum]

/-
Definitions and constructions whose geometric carriers remain in README.md (the generalized
elliptic curve, its polygons and the n-gon Tate family are AdicSpacesPartIII's carriers, and
the genus-one family over ℍ is AbelianSchemesAndArithmeticModuli's `SiegelFamily 1`):
* The lattice uniformization of the normalized Weierstrass model
* The marked torus family over the upper half-plane, with the positive-frame
  KγK action and the S transport for its forgetful maps (README §§3.14 and 4.5)
* Characteristic-zero pullback and trace actions
* The rational differential realization and scalar-extension comparison of the full
  Hecke first-coefficient pairing; its complex analytic perfection is stated above
* Semistable genus-one curves
* Homomorphisms of generalized elliptic curves
* Contraction along a positive Cartier divisor
* Finite subgroup quotients of generalized curves
* Drinfeld structures on the smooth locus
* Polygon-count stacks and decontractions
* Integral full, point and cyclic level structures
* Coherent cyclic data on decontractions
* The normalized Γ₀ moduli stack
* Power isogenies at the boundary
* Formal level structures at cusps
* Twisted Tate charts for Γ₁
* Integral coarse modular curves
* The integral cyclic modular polynomial modularPolynomial and its geometric criterion
  modularPolynomial_cyclic, together with modularPolynomial_degree, modularPolynomial_dual
  and modularPolynomial_normalization (README §5.6). The geometric criterion uses the
  base-changed curves over an algebraic closure; the criterion over K retains a K-defined
  cyclic kernel and a K-isomorphism from its quotient to the prescribed target.
* Projective scalar level quotients
* Igusa components of modular fibres
* Regular resolutions of modular fibres
* Prime-square semistable modular models
* Modular dual graphs and thicknesses
* Compactified Hecke degeneracy maps
* Diamond operators
* Cyclotomic Fricke involution
* Exact-divisor Atkin–Lehner operators
* Full and cyclic isogeny correspondences
* Integral coherent Hecke trace
* Modular Jacobians and norms
* The relative Jacobian point/divisor-class equivalence modularJacobian_divisorClass,
  with its semilinear Galois and two-leg Hecke compatibility (README §13.1)
* Upper and lower Jacobian Hecke operators
* Integral dualizing forms (README §13.7, integral-dualizing-forms), with distinct
  coarse, resolved and stack lattices and the prime-level coefficient ranges
* Integral modular Serre duality (README §13.8, integral-modular-serre-duality),
  including coherent base change and opposite node residues
* Integral Hecke adjoints (README §13.9, integral-hecke-duality-compatibility),
  using the relative dualizing models and their integral correspondences
* The geometric integral Hecke algebra
* The anemic image heckeAlgebraAnemic of AutomorphicFormsOnReductiveGroups' common
  presentation, jacobianHeckeTorsion and jacobianHeckeTorsion_nonzero, and the universal
  modularEisensteinSystem with its image ideal modularEisensteinIdeal (README §13.3)
* The modular Jacobian Tate module
* Open level subgroups and the standard levels
* Level-H structures away from the level
* The Deligne–Rapoport level-H stack
* The cyclotomic structure of X_H
* The fixed-pairing compactified curve (README §5.13): coarse base change for flat
  changes, for N≥3 with N invertible, for N≥2 outside positive prime powers and
  twice such powers, and for N=1 via the coarse projective j-line; the level-one
  stack retains inversion and is not a scheme.
* Compactified twisted curves X(ρ)
* Level maps between coarse curves
* Cartan modular curves
* Atkin–Lehner quotient curves X₀⁺(N), with noncuspidal CM fixed points and
  separate fixed-cusp contributions to the characteristic-zero ramification divisor
* Geometric weight coefficient systems
* Finite and adic parabolic cohomology
* The natural parabolic pairing between the m and adjointIdeal m summands, with
  two-sided boundary and reduction hypotheses, distinct from Fricke transport
* The GL₂ arithmetic Betti/support comparison of §14.4, including coefficient
  monodromy, inverse-double-coset adjoints and finite-cover descent
* The two geometric degeneracy pullbacks
* Congruence classes in ordinary H¹
* The Hecke prime and coefficient field of a newform
* The modular abelian variety A_f
* Cusp-normalised Abel–Jacobi maps
* The modular supersingular character lattice
* The finite Taylor–Wiles modular cover

The additional interfaces specified in the README are:
* §8.2: qExpansionField over any coefficient field, qExpansionCuspInfty,
  qExpansionGaloisAction and qExpansionTorsionRepresentation; qExpansionDegeneracy and
  qExpansionFricke with their geometric characterizations, and
  gammaZeroRationalFunctionField when the level is invertible in the coefficient field.
* §13.2: functionFieldDivisorNorm_baseChange and functionFieldCorrespondence, with
  the full tensor-product factors or the stated linear-disjointness hypothesis.
* §§12.1 and 17.5: gammaZeroPrimeGraph and gammaZeroPrime_mass at primes at least five,
  gammaZeroPrime_componentGroup and gammaZeroPrime_componentEisenstein, retaining
  thicknesses, cyclicity and the integral component-group order.
* §§17.1–17.2: GoodReductionSpecialisation, goodReductionSpecialisation_exists and
  goodReductionSpecialisation_frobenius for the canonical geometric-point reduction,
  its prime-to-residue-characteristic torsion isomorphisms and the diamond-valued relation.
* §17.7: modularJacobian_semistableTorsion in the supplier's SemistableTorsionDatum,
  with the identity-component and toric terms distinguished.
* §0.2: finiteInvariantModule_completion, regularInvariants_freeness and
  tameInertiaIdeal_cotangent for the local invariant ring and its finite module.
* §1.4a: latticeSigma, latticeQuasiPeriod, latticeSigma_quasiPeriod and
  latticeQuasiPeriod_legendre on the native period lattice.
* §2.6: generalizedContraction_noetherianApproximation for arbitrary-base contraction,
  with the finitely presented curve and positive Cartier divisor hypotheses.
* §2.11: generalizedTorsionDecontraction for the smooth-locus-preserving polygon lift.
* §2.10a: generalizedTorsionTransport before generalized generator ranks and level maps.
* §7.1a (R12.5): kodairaSpencer_normalization on the fine curve with its universal family.
* §7.5: firstCoefficientHeckePairing_bilinear is the linearity bundled in the complex
  definition; firstCoefficientHeckePairing_baseChange identifies the rational differential
  pairing with this complex analytic realization.
* §11.2: cyclicIsogenyDeformationRing with its source/target coordinates.
* §13.1: modularJacobian, modularJacobian_dimension, modularJacobian_polarization,
  modularJacobian_thetaSpecialization and modularJacobian_baseChange are the modular
  instances of JacobianChallengePartII §§1.2–1.4's positive-genus relative Jacobian,
  dimension, canonical principal polarization and arbitrary-base-change comparisons.
  Smooth proper geometrically connected curves over a locally Noetherian base use
  étale local projective charts. The genus-zero branch is the trivial principally
  polarized abelian scheme. The comparisons include nonreduced and non-Noetherian
  pullbacks and the geometric closed fibre of a good-reduction trait. Norm, divisor-class,
  cusp-normalized Abel maps and both Hecke leg comparisons belong to this roadmap.
* §13.5: jacobianTateModule_trace after jacobianTateModule_kummer.
* §14.9a: modularOpenFiniteGraph for the noncompact torsion-free quotient.
* §9.1: degeneracyDegree_coprime, degeneracyDegree_dvd.
* §14.1: weightCoefficients_fibre, weightCoefficients_isogeny,
  weightCoefficients_compare, on the geometric relative coefficient systems.
* §14.2: parabolicH1_inclusion, parabolicH1_map, parabolicH1_compact,
  parabolicH1_inverseLimit, parabolicH1_map_id, parabolicH1_map_comp,
  with the actual support maps and their finite/adic comparisons.
* §15.1: degeneracyH1_apply, degeneracyH1_fst, degeneracyH1_snd,
  degeneracyH1_sign, degeneracyH1_hecke, for the geometric degeneracy legs.
* §16.1: heckePrime_isPrime, heckePrime_quotient, heckePrime_conjugate,
  on the eigencharacter of the geometric Hecke algebra.
* §16.6: modularQuotientGamma0_norm_pull for the descended pullback and unnormalized
  norm at trivial character, weight two and primitive level N≥5; their composite is
  multiplication by the positive degree of X₁(N)→X₀(N).
* §17.4: supersingularDegreeZero_ext, supersingularDegreeZero_graph,
  supersingularDegreeZero_correspondence, on the modular intersection set.
* §17.8: taylorWilesMinus_coefficients, taylorWilesMinus_ext,
  for coefficient changes and maps of the modular cover cohomology.
-/

end
end TauCetiRoadmap.ModularCurvesPartII

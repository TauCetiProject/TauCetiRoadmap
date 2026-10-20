import Mathlib
import TauCeti.NumberTheory.HeckeRing.Associativity
import TauCeti.NumberTheory.HeckeRing.Representation
import TauCeti.RepresentationTheory.CharacterTwist
import TauCeti.RepresentationTheory.PGroupInvariants
import TauCeti.RepresentationTheory.Homological.GroupCohomology.Corestriction
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperTriangular.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.AlgebraicTopology.Singular.Relative
import TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic
import TauCeti.AlgebraicTopology.EilenbergMacLane.TopologicalVectorSpace

/-!
# ArithmeticLocallySymmetricSpaces: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular targets, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.
`sorry` is expected in this file — these are goals, not results.

The roadmap builds the arithmetic locally symmetric spaces `X_K = G(F)∖(X^G × G(𝔸^∞)/K)` and their
integral cohomology: symmetric spaces and adelic quotients (Layer ALS.0), arithmetic local systems
and Betti complexes (ALS.1), the Borel–Serre compactification and its boundary strata (ALS.2),
Hecke actions in the derived category (ALS.3), boundary complexes and Eisenstein localization
(ALS.4), finite-level duality (ALS.5a), characteristic-zero comparisons (ALS.5b) and descent along
finite covers (ALS.6).

Most carriers of the roadmap are not in Mathlib or Tau Ceti at the pinned commits: algebraic Cartan
involutions and twisted real forms, the adelic level quotients (AdelicAlgebraicGroups §4.4),
equivariant sheaves and their derived functors, manifolds with corners carrying the Borel–Serre
structure, singular cohomology with supports, and automorphic forms. Statements about them live in
`README.md` only; the closing comment of this file lists them. What is recorded here:

* the library declarations the roadmap consumes, pinned by `#check` in the layer that uses them;
* light definitions with real bodies over pinned carriers: the split-centre-corrected stabilizer
  `ℝ_{>0}·O(2)` of `i ∈ ℍ` (ALS.0.4), congruence and Iwahori level subgroups of `GL_n` over a
  commutative ring as preimages of Tau Ceti's upper-triangular and upper-unitriangular groups
  (ALS.0.10), the orientation character `sign(N(det))^{m−1}` of `GL_m` over a number field
  (ALS.0.12), the slice representation and the whole-inverse monodromy convention (ALS.1.1), the
  geodesic action of the diagonal torus on `ℍ` (ALS.2.1), basis elements of the Hecke ring, the
  operator of a double coset on a representation and the twist of a Hecke ring by a character
  (ALS.3);
* milestones whose carriers exist at the pins: the stabilizer of `i` under `GL(2, ℝ)`, the
  Iwahori indices and the comparison with classical `Γ₀`, the group cohomology of `SL_2(ℤ)`,
  the free geodesic action for `SL_2`, the Hecke rings of normal subgroups and product pairs,
  the double-coset operator on invariants and its degree, the `GL_2` spherical convolution
  relation, and the basis and composition formulas for character twists.

Design choices made explicit: Hecke rings are Mathlib's `HeckeRing` with Tau Ceti's convolution
ring structure, and a double coset `UgU = ⊔ g_iU` acts on invariants by `Σ g_i·m`, with degree
`[U : U ∩ gUg⁻¹] = (gUg⁻¹).relIndex U`; Tau Ceti's `HeckeCoset.heckeSum` is the transposed
(coinvariant, right-coset) form of the same sum. Level subgroups are preimages, under reduction
modulo an ideal, of Tau Ceti's `upperTriangularGroup` and `upperUnitriangularGroup`, and the
projective `Γ₁` asks the diagonal entries to agree rather than to be `1`. The monodromy of a lifted
loop ending at `δ(ℓ)x₀` inverts the whole slice action through Mathlib's `MulEquiv.inv'`, because
Tau Ceti's loop product `g * h` means `h` followed by `g`. Twisting coefficients by a character is
Tau Ceti's `Representation.charTwist`, applied to the inverse character.
-/

namespace TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

open Matrix
open scoped HeckeCosetModule Pointwise MatrixGroups TensorProduct

noncomputable section

/-! ## Hecke product convention and headline (ALS.3.2) -/

section HeckeProduct

variable {G H : Type*} [Group G] [Group H]

/-- **ALS.3.1.** The basis element `r·[UgU]` of the Hecke ring of `(G, U)` with coefficients in
`R`. -/
def heckeBasis (U : Subgroup G) (R : Type*) [Zero R] (g : G) (r : R) : 𝕋 (⊤ : Submonoid G) U R :=
  HeckeCosetModule.single R (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) r

/-- **ALS.3.2, `LocallySymmetric.Hecke.heckeRing_prod`.** The product of two Hecke pairs is a
Hecke pair: each product double coset has a finite decomposition into left cosets. -/
theorem isHeckeTriple_prod (U : Subgroup G) (V : Subgroup H)
    [IsHeckeTriple (⊤ : Submonoid G) U U] [IsHeckeTriple (⊤ : Submonoid H) V V] :
    IsHeckeTriple (⊤ : Submonoid (G × H)) (U.prod V) (U.prod V) := by
  sorry

attribute [local instance] isHeckeTriple_prod

/-- **ALS.3.2, `LocallySymmetric.Hecke.heckeRing_prod`.** The integral Hecke ring of a product
pair is the tensor product of the two Hecke rings, with pure basis tensors sent to the
corresponding product double coset. -/
theorem heckeRing_prod (U : Subgroup G) (V : Subgroup H)
    [IsHeckeTriple (⊤ : Submonoid G) U U] [IsHeckeTriple (⊤ : Submonoid H) V V] :
    ∃ e : (𝕋 (⊤ : Submonoid G) U ℤ ⊗[ℤ] 𝕋 (⊤ : Submonoid H) V ℤ) ≃+*
        𝕋 (⊤ : Submonoid (G × H)) (U.prod V) ℤ,
      ∀ (g : G) (h : H),
        e (heckeBasis U ℤ g 1 ⊗ₜ[ℤ] heckeBasis V ℤ h 1) =
          heckeBasis (U.prod V) ℤ (g, h) 1 := by
  sorry

end HeckeProduct

/-! ## Group-ring coefficients (ALS.F.2) -/

/-- **ALS.F.2, `groupRing_S3_noncomm`.** The integral group ring of `S₃` has two unequal
products of transposition basis elements, testing the handedness extensions of the shared
perfect left-module interface over a noncommutative coefficient ring. -/
theorem groupRing_S3_noncomm :
    MonoidAlgebra.single (Equiv.swap (0 : Fin 3) 1) (1 : ℤ) *
        MonoidAlgebra.single (Equiv.swap (1 : Fin 3) 2) (1 : ℤ) ≠
      MonoidAlgebra.single (Equiv.swap (1 : Fin 3) 2) (1 : ℤ) *
        MonoidAlgebra.single (Equiv.swap (0 : Fin 3) 1) (1 : ℤ) := by
  sorry

/-! ## Layer ALS.0: Symmetric spaces, arithmetic quotients and local geometry -/

-- Proper discontinuity, quotient topology and covering maps.
#check @ProperlyDiscontinuousSMul
#check @IsCoveringMap
-- The action of all of `GL(2, ℝ)` on `ℍ`, antiholomorphic for negative determinant, and the
-- fixed-point criteria for `i` in the two determinant signs.
#check @UpperHalfPlane.glAction
#check @UpperHalfPlane.σ
#check @UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos
#check @UpperHalfPlane.gl_smul_I_eq_I_iff_of_neg
-- `ℍ` is contractible and discrete subgroups of `SL(2, ℝ)` act properly discontinuously.
#check (inferInstance : ContractibleSpace UpperHalfPlane)
#check @UpperHalfPlane.instProperlyDiscontinuousSL2RSubgroup
-- A free properly discontinuous action on a real vector space has a `K(Γ, 1)` quotient (ALS.0.9).
#check @IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne_realTopologicalVectorSpace
-- Classical congruence subgroups of `SL_2(ℤ)` (ALS.0.10, ALS.6.4).
#check @CongruenceSubgroup.Gamma0
#check @CongruenceSubgroup.Gamma1

section SymmetricSpace

/-- **ALS.0.4, `symmetricSpace_GL2_Q`.** The subgroup `ℝ_{>0}·O(2)` of `GL(2, ℝ)`: the matrices
`g` with `gᵀg` a positive scalar. It is `K_∞A_∞` for `GL_{2,ℚ}`, the maximal compact subgroup
together with the identity component of the real points of the split centre. -/
def orthogonalTimesScalars : Subgroup (GL (Fin 2) ℝ) where
  carrier := {g | ∃ c : ℝ, 0 < c ∧ (g : Matrix (Fin 2) (Fin 2) ℝ).transpose * g = c • 1}
  one_mem' := ⟨1, one_pos, by simp⟩
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- **ALS.0.4.** The stabilizer of `i` for the action of all of `GL(2, ℝ)` on `ℍ` (positive
determinant holomorphically, negative determinant through complex conjugation) is
`ℝ_{>0}·O(2)`, so `GL(2, ℝ)/ℝ_{>0}O(2) ≅ ℍ` is the symmetric space of `GL_{2,ℚ}` with the split
centre removed. Without the scalars the quotient would be three-dimensional. The pointwise
criteria are Mathlib's `UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos` and `_of_neg`. -/
theorem stabilizer_I_eq_orthogonalTimesScalars :
    MulAction.stabilizer (GL (Fin 2) ℝ) UpperHalfPlane.I = orthogonalTimesScalars := by
  sorry

/-- `diag(−1, 1)` fixes `i` (it acts by `z ↦ −z̄`) although it has negative determinant: the
stabilizer meets both components of `GL(2, ℝ)`. -/
theorem orthogonalTimesScalars_reflection (g : GL (Fin 2) ℝ) (hg : (g : Matrix (Fin 2) (Fin 2) ℝ) = !![-1, 0; 0, 1]) :
    g ∈ orthogonalTimesScalars := by
  sorry

/-- `diag(2, 1)` is not in `ℝ_{>0}·O(2)`: it moves `i` to `2i`. -/
theorem orthogonalTimesScalars_not_diagonal (g : GL (Fin 2) ℝ) (hg : (g : Matrix (Fin 2) (Fin 2) ℝ) = !![2, 0; 0, 1]) :
    g ∉ orthogonalTimesScalars := by
  sorry

/-- The scalar `2` is in `ℝ_{>0}·O(2)`: `(2I)ᵀ(2I) = 4·1`, so the split centre lies in the group. -/
theorem orthogonalTimesScalars_scalar (g : GL (Fin 2) ℝ) (hg : (g : Matrix (Fin 2) (Fin 2) ℝ) = !![2, 0; 0, 2]) :
    g ∈ orthogonalTimesScalars := by
  sorry

/-- **ALS.0.1, `cartanInvolution_GL_transposeInverse`.** The fixed points of the Cartan
involution `g ↦ (gᵀ)⁻¹` of `GL_n(ℝ)` are the orthogonal group `O(n)`. This is the same
fixed subgroup for the AA.3.7 inverse-adjoint datum with standard representation and identity form. -/
theorem transposeInverse_fixed_iff_orthogonal {n : ℕ} (g : GL (Fin n) ℝ) :
    ((g⁻¹ : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ).transpose = g ↔
      (g : Matrix (Fin n) (Fin n) ℝ) ∈ Matrix.orthogonalGroup (Fin n) ℝ := by
  sorry

end SymmetricSpace

section Levels

variable {R : Type*} [CommRing R] {n : Type*} [Fintype n] [LinearOrder n]

/-- **ALS.0.10.** The matrices in `GL_n(R)` that are upper triangular modulo an ideal `I`: the
preimage of Tau Ceti's `upperTriangularGroup` of `GL_n(R/I)` under reduction modulo `I`. For `I`
the maximal ideal of the valuation ring of a nonarchimedean local field this is the Iwahori
subgroup; for `n = 2` and `I = (p^c)` it is the `GL_2`-preimage of `Γ₀(p^c)`. -/
def upperTriangularMod (I : Ideal R) : Subgroup (GL n R) :=
  (TauCeti.upperTriangularGroup n (R ⧸ I)).comap (GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- Membership in `upperTriangularMod I`: every entry below the diagonal lies in `I`. -/
theorem upperTriangularMod_mem_iff (I : Ideal R) (g : GL n R) :
    g ∈ upperTriangularMod I ↔ ∀ i j, j < i → (g : Matrix n n R) i j ∈ I := by
  sorry

/-- **ALS.0.10.** The matrices that are unipotent upper triangular modulo `I`: the preimage of Tau
Ceti's `upperUnitriangularGroup` of `GL_n(R/I)` under reduction modulo `I`. -/
def unipotentMod (I : Ideal R) : Subgroup (GL n R) :=
  (TauCeti.upperUnitriangularGroup n (R ⧸ I)).comap (GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- Membership in `unipotentMod I`: upper triangular modulo `I` with diagonal entries `≡ 1`. -/
theorem unipotentMod_mem_iff (I : Ideal R) (g : GL n R) :
    g ∈ unipotentMod I ↔
      (∀ i j, j < i → (g : Matrix n n R) i j ∈ I) ∧ ∀ i, (g : Matrix n n R) i i - 1 ∈ I := by
  sorry

/-- **ALS.0.10, `LocallySymmetric.iwahori`.** The matrices of `GL_n(R)`, `R` a local ring, that are
upper triangular modulo the maximal ideal: the case `I = 𝔪` of `upperTriangularMod`. When `R` is the
valuation ring of a nonarchimedean local field `K` this is the Iwahori subgroup, the group that
ReductiveGroupsPartII's `LevelSubgroups.iwahori` describes inside `GL_n(K)`. -/
def iwahori (R : Type*) [CommRing R] [IsLocalRing R] (n : Type*) [Fintype n]
    [LinearOrder n] : Subgroup (GL n R) :=
  upperTriangularMod (IsLocalRing.maximalIdeal R)

/-- **ALS.0.10, `LocallySymmetric.iwahoriOne`.** The matrices of `GL_n(R)`, `R` a local ring, that
are unipotent upper triangular modulo the maximal ideal. When `R` is the valuation ring of a
nonarchimedean local field of residue characteristic `p`, with its valuation topology, this is the
pro-`p` Iwahori subgroup, ReductiveGroupsPartII's `LevelSubgroups.proPIwahori`; over `R = ℂ` it is
the upper unipotent group, which is not pro-`p`. -/
def iwahoriOne (R : Type*) [CommRing R] [IsLocalRing R] (n : Type*) [Fintype n]
    [LinearOrder n] : Subgroup (GL n R) :=
  unipotentMod (IsLocalRing.maximalIdeal R)

/-- **ALS.0.10, `LocallySymmetric.gamma1`.** The `GL_2`-preimage of the projective `Γ₁(I)`: upper
triangular modulo `I` with equal diagonal entries modulo `I` (not diagonal entries `1`). -/
def gamma1Mod (I : Ideal R) : Subgroup (GL (Fin 2) R) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) R) 1 0 ∈ I ∧
    (g : Matrix (Fin 2) (Fin 2) R) 1 1 - (g : Matrix (Fin 2) (Fin 2) R) 0 0 ∈ I}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- **ALS.0.10, `LocallySymmetric.gammaP`.** The `GL_2`-preimage of the projective `Γ_p(I)`: upper
triangular modulo `I` with ratio of diagonal entries of `p`-power order modulo `I`, written without
division as `d^{p^m} ≡ a^{p^m}`, for a prime `p` (for `p = 0` or `1` the condition would collapse to
`Γ₀` or `Γ₁`). -/
def gammaPMod (I : Ideal R) (p : ℕ) [Fact p.Prime] : Subgroup (GL (Fin 2) R) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) R) 1 0 ∈ I ∧ ∃ m : ℕ,
    (g : Matrix (Fin 2) (Fin 2) R) 1 1 ^ p ^ m - (g : Matrix (Fin 2) (Fin 2) R) 0 0 ^ p ^ m ∈ I}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- **ALS.0.10, `iwahori_index_GL2`.** `[GL_2(ℤ_p) : Iw_p] = p + 1`, the number of lines in
`F_p²`; the `ℤ_p` case of ReductiveGroupsPartII's check `iwahori_relIndex_two`. -/
theorem iwahori_index_GL2 (p : ℕ) [Fact p.Prime] : (iwahori ℤ_[p] (Fin 2)).index = p + 1 := by
  sorry

/-- **ALS.0.10, `LocallySymmetric.iwahori.index`.** `[Iw : Iw₁] = (q − 1)^n` for a residue field
with `q` elements. -/
theorem iwahoriOne_relIndex (R : Type*) [CommRing R] [IsLocalRing R]
    [Finite (IsLocalRing.ResidueField R)] (n : Type*) [Fintype n] [LinearOrder n] :
    (iwahoriOne R n).relIndex (iwahori R n) =
      (Nat.card (IsLocalRing.ResidueField R) - 1) ^ Fintype.card n := by
  sorry

/-- Over `ZMod 5` with `I = ⊥`, the upper unipotent `(1, 1; 0, 1)` lies in both level groups. -/
theorem levels_upper_unipotent_five (g : GL (Fin 2) (ZMod 5)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![1, 1; 0, 1]) :
    g ∈ upperTriangularMod (⊥ : Ideal (ZMod 5)) ∧ g ∈ unipotentMod (⊥ : Ideal (ZMod 5)) := by
  sorry

/-- Over `ZMod 5` with `I = ⊥`, `diag(2, 1)` is upper triangular but not unipotent, and the lower
unipotent `(1, 0; 1, 1)` is not upper triangular. -/
theorem levels_diagonal_lower_five (g h : GL (Fin 2) (ZMod 5)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![2, 0; 0, 1])
    (hh : (h : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![1, 0; 1, 1]) :
    g ∈ upperTriangularMod (⊥ : Ideal (ZMod 5)) ∧ g ∉ unipotentMod (⊥ : Ideal (ZMod 5)) ∧
      h ∉ upperTriangularMod (⊥ : Ideal (ZMod 5)) := by
  sorry

/-- Modulo the unit ideal every matrix is upper triangular, unipotent and in `Γ₁`. -/
theorem levels_top : upperTriangularMod (⊤ : Ideal R) = (⊤ : Subgroup (GL n R)) ∧
    unipotentMod (⊤ : Ideal R) = (⊤ : Subgroup (GL n R)) ∧
    gamma1Mod (⊤ : Ideal R) = ⊤ := by
  sorry

/-- At residue field `F_2` every unit is `≡ 1`, so `Iw₁ = Iw` for `ℤ_2`; at residue field `F_3` the
inclusion `Iw₁ ⊂ Iw` is strict. -/
theorem iwahoriOne_two_eq_three_lt : iwahoriOne ℤ_[2] (Fin 2) = iwahori ℤ_[2] (Fin 2) ∧
    iwahoriOne ℤ_[3] (Fin 2) < iwahori ℤ_[3] (Fin 2) := by
  sorry

/-- **`gamma0_eq_congruenceSubgroup`.** Intersecting the `GL_2`-preimage of the projective `Γ₀(N)`
with `SL_2(ℤ)` gives Mathlib's `CongruenceSubgroup.Gamma0 N`. -/
theorem gamma0_eq_congruenceSubgroup (N : ℕ) :
    (upperTriangularMod (Ideal.span {(N : ℤ)})).comap Matrix.SpecialLinearGroup.toGL =
      CongruenceSubgroup.Gamma0 N := by
  sorry

/-- **`gamma0_eq_congruenceSubgroup`, the `2`-adic clause.** `(3, 1; 8, 3)` has determinant `1`,
lies in the `GL_2`-preimage of the projective `Γ₁(8)`, and has diagonal entries `≡ 3 ≢ ±1 mod 8`,
so it is in neither `Γ₁(8)` nor `−Γ₁(8)`: the unqualified `±Γ₁` description fails at `2^c`,
`c ≥ 3`. -/
theorem gamma1Mod_two_adic_witness (g : GL (Fin 2) ℤ) (hg : (g : Matrix (Fin 2) (Fin 2) ℤ) = !![3, 1; 8, 3]) :
    (g : Matrix (Fin 2) (Fin 2) ℤ).det = 1 ∧ g ∈ gamma1Mod (Ideal.span {(8 : ℤ)}) ∧
      (g : Matrix (Fin 2) (Fin 2) ℤ) 0 0 - 1 ∉ Ideal.span {(8 : ℤ)} ∧
      (g : Matrix (Fin 2) (Fin 2) ℤ) 0 0 + 1 ∉ Ideal.span {(8 : ℤ)} := by
  sorry

/-- **`gammaP_ne_gamma1`.** For `p = 3` and `q = 7`, `diag(1, 2)` has diagonal ratio of order `3`,
so it lies in `Γ_3` but not in `Γ₁`: the inclusion `Γ₁ ⊂ Γ_p` is strict when `p ∣ q − 1`. -/
theorem gammaPMod_three_seven_witness (g : GL (Fin 2) (ZMod 7)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 7)) = !![1, 0; 0, 2]) :
    g ∈ gammaPMod (⊥ : Ideal (ZMod 7)) 3 ∧ g ∉ gamma1Mod (⊥ : Ideal (ZMod 7)) := by
  sorry

/-- **`gammaP_ne_gamma1`, `p = 2`, `q = 7`.** `diag(1, −1)` has diagonal ratio of order `2`, so it
lies in `Γ_2` but not in `Γ₁`. -/
theorem gammaPMod_two_seven_witness (g : GL (Fin 2) (ZMod 7)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 7)) = !![1, 0; 0, -1]) :
    g ∈ gammaPMod (⊥ : Ideal (ZMod 7)) 2 ∧ g ∉ gamma1Mod (⊥ : Ideal (ZMod 7)) := by
  sorry

/-- **`gammaP_ne_gamma1`, equality.** For `p = 3` and `q = 5`, cubing is bijective on `F_5^×`, so a
diagonal ratio of `3`-power order is `1` and `Γ_3 = Γ₁`. -/
theorem gammaPMod_eq_gamma1Mod_five : gammaPMod (⊥ : Ideal (ZMod 5)) 3 = gamma1Mod (⊥ : Ideal (ZMod 5)) := by
  sorry

/-- **ALS.0.11, one pro-`v` factor does not suffice.** `(1, 1; −3, −2)` lies in the pro-`3`
Iwahori subgroup of `GL_2(ℤ_3)` and has order `3`, so a level whose only small factor is a single
pro-`v` Iwahori subgroup need not be neat. -/
theorem iwahoriOne_order_three (g : GL (Fin 2) ℤ_[3]) (hg : (g : Matrix (Fin 2) (Fin 2) ℤ_[3]) = !![1, 1; -3, -2]) :
    g ∈ iwahoriOne ℤ_[3] (Fin 2) ∧ g ^ 3 = 1 ∧ g ≠ 1 := by
  sorry

end Levels

section Orientation

variable (F : Type*) [Field F] [NumberField F]

/-- **ALS.0.12, `LocallySymmetric.orientationCharacter_GL`.** The orientation character of
`Res_{F/ℚ} GL_m` on rational points: `ε(γ) = sign(N_{F/ℚ}(det γ))^{m−1}`. It is trivial for odd
`m`, and neatness does not force it to be trivial. -/
def glOrientationSign (m : ℕ) : GL (Fin m) F →* ℤˣ where
  toFun γ := if 0 < Algebra.norm ℚ ((γ : Matrix (Fin m) (Fin m) F).det) then 1 else (-1) ^ (m - 1)
  map_one' := by sorry
  map_mul' := by sorry

/-- **`orientationCharacter_GL2_Q`.** `diag(−1, 1)` reverses the orientation of `ℍ`. -/
theorem glOrientationSign_neg_det (γ : GL (Fin 2) ℚ) (hγ : (γ : Matrix (Fin 2) (Fin 2) ℚ) = !![-1, 0; 0, 1]) :
    glOrientationSign ℚ 2 γ = -1 := by
  sorry

/-- **ALS.0.12.** In every odd rank the orientation character is trivial over every number field. -/
theorem glOrientationSign_odd (m : ℕ) (hm : Odd m) (γ : GL (Fin m) F) :
    glOrientationSign F m γ = 1 := by
  sorry

end Orientation

/-! ## Layer ALS.1: Arithmetic coefficients and Betti complexes -/

-- Local coefficient systems, their monodromy, relative singular chains and twisted cochains.
#check @TauCeti.LocalCoefficientSystem
#check @TauCeti.LocalCoefficientSystem.monodromyRepresentation
#check @TopPair.singularChainComplexFunctor
#check @TauCeti.LocalCoefficientSystem.twistedCochainComplex
-- Inversion from the opposite group, the endpoint convention of the monodromy (ALS.1.1).
#check @MulEquiv.inv'
-- Group cohomology, the comparison target at non-neat level (ALS.1.5), and its corestriction
-- (the trace at non-neat level, ALS.3.6).
#check @groupCohomology
#check @Rep.trivial
#check @TauCeti.groupCohomology.corestriction
-- Derived categories and idempotent completeness (ALS.1, ALS.4.9).
#check @DerivedCategory
#check @CategoryTheory.IsIdempotentComplete

section Slice

variable {R : Type*} [CommRing R] {V : Type*} [AddCommGroup V] [Module R V]
  {Γ Q : Type*} [Group Γ] [Group Q]

/-- **ALS.1.1.** The slice representation `γ ↦ ρ_{G(F)}(γ) ρ_{K_S}((g⁻¹γg)_S)` of an arithmetic
group, from two commuting actions on the coefficient module and the homomorphism `φ : Γ → K_S`.
There is no inverse on the second factor alone. -/
def sliceRepresentation (ρG : Representation R Γ V) (ρK : Representation R Q V) (φ : Γ →* Q)
    (hcomm : ∀ γ q, ρG γ * ρK q = ρK q * ρG γ) : Representation R Γ V where
  toFun γ := ρG γ * ρK (φ γ)
  map_one' := by simp
  map_mul' := by sorry

/-- With the trivial `K_S`-action the slice representation is the `G(F)`-representation itself. -/
theorem sliceRepresentation_trivial_right (ρG : Representation R Γ V) (φ : Γ →* Q) :
    sliceRepresentation ρG (1 : Representation R Q V) φ (fun _ _ => by simp) = ρG := by
  sorry

/-- **ALS.1.1.** With trivial rational action, the cyclic `K_S` character of value `2`
acts by `2` on the slice, retaining the character rather than its inverse. -/
theorem sliceRepresentation_two :
    let χ : Multiplicative ℤ →* ℚˣ := zpowersHom ℚˣ (Units.mk0 2 two_ne_zero)
    sliceRepresentation (1 : Representation ℚ (Multiplicative ℤ) ℚ)
      (Representation.ofLinearCharacter χ) (MonoidHom.id _) (fun _ _ => by simp)
      (Multiplicative.ofAdd 1) 1 = 2 := by
  sorry

/-- **ALS.1.1.** In the natural `GL₂(ℚ)` coefficient representation, two noncommuting
`K_S` values act in their slice-product order. -/
theorem sliceRepresentation_noncomm (A B : GL (Fin 2) ℚ) (hA : (A : Matrix (Fin 2) (Fin 2) ℚ) = !![1, 1; 0, 1])
    (hB : (B : Matrix (Fin 2) (Fin 2) ℚ) = !![1, 0; 1, 1]) :
    let ρ : Representation ℚ (GL (Fin 2) ℚ) (Fin 2 → ℚ) :=
      (Units.coeHom _).comp Matrix.GeneralLinearGroup.toLin.toMonoidHom
    let σ := sliceRepresentation (1 : Representation ℚ (GL (Fin 2) ℚ) (Fin 2 → ℚ))
      ρ (MonoidHom.id _) (fun _ _ => by simp)
    (σ A * σ B) ![1, 0] = ![2, 1] ∧ (σ B * σ A) ![1, 0] = ![1, 1] := by
  sorry

/-- **ALS.1.1, `LocallySymmetric.localSystem.monodromy`.** The monodromy of the associated local
system: a lifted loop ending at `δ(ℓ)x₀` defines `δ(ℓ) ∈ Γᵐᵒᵖ`, because Tau Ceti's loop product
`g * h` is `h` followed by `g`, and the monodromy is `ℓ ↦ ρ_Γ(δ(ℓ)⁻¹)`, inverting the whole slice
action through Mathlib's `MulEquiv.inv' : Γ ≃* Γᵐᵒᵖ`. -/
def endpointMonodromy {π : Type*} [Group π] (ρ : Representation R Γ V) (δ : π →* Γᵐᵒᵖ) :
    Representation R π V :=
  ρ.comp ((MulEquiv.inv' Γ).symm.toMonoidHom.comp δ)

/-- **ALS.1.1.** A constant identity endpoint gives trivial monodromy for every slice action. -/
theorem endpointMonodromy_one {π : Type*} [Group π] (ρ : Representation R Γ V) :
    endpointMonodromy ρ (1 : π →* Γᵐᵒᵖ) = 1 := by
  sorry

/-- **ALS.1.1.** The cyclic slice character of value `2` gives endpoint monodromy `1/2`. -/
theorem endpointMonodromy_half :
    let χ : Multiplicative ℤ →* ℚˣ := zpowersHom ℚˣ (Units.mk0 2 two_ne_zero)
    endpointMonodromy (Representation.ofLinearCharacter χ) (MonoidHom.id _)
      (MulOpposite.op (Multiplicative.ofAdd 1)) 1 = 1 / 2 := by
  sorry

/-- **`localSystem_eq_LocalCoefficientSystem`.** For the noncommuting `A = (1, 1; 0, 1)` and
`B = (1, 0; 1, 1)`, endpoint monodromy on the natural coefficient module takes the opposite
product to the product of the two inverse actions, with distinct values in the two orders. -/
theorem endpointMonodromy_noncomm (A B : GL (Fin 2) ℚ) (hA : (A : Matrix (Fin 2) (Fin 2) ℚ) = !![1, 1; 0, 1])
    (hB : (B : Matrix (Fin 2) (Fin 2) ℚ) = !![1, 0; 1, 1]) :
    let ρ : Representation ℚ (GL (Fin 2) ℚ) (Fin 2 → ℚ) :=
      (Units.coeHom _).comp Matrix.GeneralLinearGroup.toLin.toMonoidHom
    let μ := endpointMonodromy ρ (MonoidHom.id _)
    μ (MulOpposite.op A * MulOpposite.op B) = μ (MulOpposite.op A) * μ (MulOpposite.op B) ∧
      μ (MulOpposite.op A * MulOpposite.op B) ![1, 0] = ![2, -1] ∧
      μ (MulOpposite.op B * MulOpposite.op A) ![1, 0] = ![1, -1] := by
  sorry

end Slice

section TranslationCoefficients

variable {R H V : Type*} [CommRing R] [Group H] [AddCommGroup V] [Module R V]

/-- **ALS.1.8, `translationCoefficientEquiv`.** A group coefficient action supplies the
linear isomorphism from conjugation-transported coefficients to the prescribed coefficients.
In the arithmetic application this group contains the relevant levels and the translating element,
and its action commutes with the rational-group action. -/
def translationCoefficientEquiv (ρ : Representation R H V) (g : H) : V ≃ₗ[R] V where
  toLinearMap := ρ g
  invFun := ρ g⁻¹
  left_inv := ρ.inv_self_apply g
  right_inv := ρ.self_inv_apply g

/-- **ALS.1.8.** The group coefficient isomorphism intertwines the action transported from
`k` with the prescribed action at `g * k * g⁻¹`. -/
theorem translationCoefficientEquiv_intertwines (ρ : Representation R H V) (g k : H) :
    (translationCoefficientEquiv ρ g).toLinearMap.comp (ρ k) =
      (ρ (g * k * g⁻¹)).comp (translationCoefficientEquiv ρ g).toLinearMap := by
  sorry

/-- **ALS.1.8.** Inverse group elements give inverse coefficient isomorphisms. -/
theorem translationCoefficientEquiv_inv (ρ : Representation R H V) (g : H) :
    (translationCoefficientEquiv ρ g).symm = translationCoefficientEquiv ρ g⁻¹ := by
  sorry

/-- **ALS.1.8, monoid coefficient obstruction.** Multiplication by `p` on the integral
coefficient line is not surjective, so this specified monoid map cannot identify coefficient sheaves. -/
theorem translation_monoid_p_not_surjective (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (fun v : ℤ_[p] => (p : ℤ_[p]) * v) := by
  sorry

/-- **ALS.1.8, smooth mod-p obstruction.** The same monoid coefficient map reduces to zero
on a nonzero line, so it cannot be a coefficient isomorphism even with smooth level action. -/
theorem translation_monoid_p_mod_p_zero (p : ℕ) [Fact p.Prime] :
    let A : ZMod p →ₗ[ZMod p] ZMod p := (p : ZMod p) • LinearMap.id
    A = 0 ∧ ¬ Function.Bijective A := by
  sorry

end TranslationCoefficients

/-- **ALS.1.5, `RΓ_eq_groupCohomology_levelOne`.** At level `SL_2(Ẑ)` the Betti cohomology of
`SL_{2,ℚ}` is the group cohomology of `SL_2(ℤ)`, which has `H² = ℤ/12`, while the coarse quotient
`SL_2(ℤ)\ℍ ≅ ℂ` has vanishing `H²`. -/
theorem groupCohomology_SL2Z_two :
    Nonempty (groupCohomology (Rep.trivial ℤ SL(2, ℤ) ℤ) 2 ≃ₗ[ℤ] ZMod 12) := by
  sorry

/-- **ALS.1.5.** `H¹(SL_2(ℤ), ℤ) = 0`, since the abelianization of `SL_2(ℤ)` is finite. -/
theorem groupCohomology_SL2Z_one :
    Subsingleton (groupCohomology (Rep.trivial ℤ SL(2, ℤ) ℤ) 1) := by
  sorry

/-! ## Layer ALS.2: Borel–Serre corners and boundary strata -/

section Geodesic

open UpperHalfPlane

/-- **ALS.2.1, `LocallySymmetric.BorelSerre.geodesicAction`, for `SL_2` and the upper Borel.** The
geodesic action of `A_B ≅ ℝ` on `ℍ`: `t • (x + iy) = x + i e^{2t} y`. It moves every point
vertically, along the geodesics ending at the cusp `∞`. -/
def geodesicActionSL2 (t : ℝ) (z : ℍ) : ℍ :=
  ⟨z.re + (Real.exp (2 * t) * z.im : ℝ) * Complex.I, by
    have h := mul_pos (Real.exp_pos (2 * t)) z.im_pos
    simp only [Complex.add_im, Complex.ofReal_im, Complex.mul_im, Complex.ofReal_re,
      Complex.I_re, Complex.I_im, mul_zero, mul_one, zero_add, add_zero]
    exact h⟩

/-- **ALS.2.1, `LocallySymmetric.BorelSerre.geodesicAction_free`.** The geodesic action is an
action of the additive group `ℝ`. -/
theorem geodesicActionSL2_add (s t : ℝ) (z : ℍ) :
    geodesicActionSL2 (s + t) z = geodesicActionSL2 s (geodesicActionSL2 t z) := by
  sorry

/-- **ALS.2.1.** The geodesic action commutes with the unipotent radical `N_B(ℝ)` of the upper
Borel, acting by the translations `z ↦ b + z`. -/
theorem geodesicActionSL2_vadd (t b : ℝ) (z : ℍ) :
    geodesicActionSL2 t (b +ᵥ z) = b +ᵥ geodesicActionSL2 t z := by
  sorry

/-- The geodesic action fixes real parts. -/
theorem geodesicActionSL2_re (t : ℝ) (z : ℍ) : (geodesicActionSL2 t z).re = z.re := by
  sorry

/-- **ALS.2.1, `LocallySymmetric.BorelSerre.geodesicAction_free`.** Distinct geodesic parameters
move each point of the upper half-plane to distinct points. -/
theorem geodesicActionSL2_free (s t : ℝ) (z : ℍ) :
    geodesicActionSL2 s z = geodesicActionSL2 t z ↔ s = t := by
  sorry

end Geodesic

/-! ## Layer ALS.3: Finite-level Hecke actions and correspondences -/

-- Hecke rings: double cosets, the coset module and Tau Ceti's convolution ring and degrees.
#check @IsHeckeTriple
#check @HeckeCoset.mk
#check @HeckeCosetModule.single
#check @HeckeCosetModule.instRingHeckeRing
#check @HeckeCoset.degree_eq_relIndex
-- The coinvariant (right-coset) form of the double-coset sum on a representation.
#check @HeckeCoset.heckeSum
#check @HeckeCoset.heckeSum_eq_sum_of_rightCosets
-- Exact left adjoints give the injective preservation used by restriction and descent (ALS.3.4).
#check @CategoryTheory.Adjunction.map_injective
-- Twisting a representation by a character (ALS.3.12) and fixed vectors of `p`-groups (ALS.6.3).
#check @Representation.charTwist
#check @Representation.invariants_ne_bot_of_forall_pow_eq_one

section Hecke

variable {G : Type*} [Group G] (U : Subgroup G)

/-- **ALS.3.2, `LocallySymmetric.Hecke.heckeRing_normal`.** For a normal subgroup the Hecke ring
is the group ring of the quotient: double cosets are cosets and the structure constants of the
convolution product are `1` exactly when `γU = αβU`. Tau Ceti proves the multiplication formula
as `HeckeCosetModule.single_mul_single_of_mem_normalizer`; this target assembles the quotient
basis identification into a ring equivalence. -/
theorem heckeRing_normal [U.Normal] [IsHeckeTriple (⊤ : Submonoid G) U U] :
    Nonempty (𝕋 (⊤ : Submonoid G) U ℤ ≃+* MonoidAlgebra ℤ (G ⧸ U)) := by
  sorry

variable {M : Type*} [AddCommGroup M]

/-- **ALS.3.1, `LocallySymmetric.Hecke.smul_eq_trace`.** The operator `m ↦ Σ_i g_i·m` of a finite
family of representatives `g_i`; on `U`-invariants, for representatives of `UgU/U`, it is the
action of `[UgU]`. Tau Ceti's `HeckeCoset.heckeSum` is the coinvariant (right-coset) form of the
same sum; the two are exchanged by the contragredient with `g` replaced by `g⁻¹`. -/
def doubleCosetOperator (ρ : Representation ℤ G M) (reps : Finset G) : M →ₗ[ℤ] M :=
  ∑ r ∈ reps, ρ r

/-- `reps` is a set of representatives of the left cosets `g_iU` contained in `UgU`. -/
def IsDoubleCosetReps (g : G) (reps : Finset G) : Prop :=
  (∀ x : G, x ∈ DoubleCoset.doubleCoset g (U : Set G) (U : Set G) ↔
      ∃ r ∈ reps, (x : G ⧸ U) = (r : G ⧸ U)) ∧
    (reps : Set G).Pairwise fun r s => (r : G ⧸ U) ≠ (s : G ⧸ U)

/-- The double coset `U1U = U` is represented by `{1}`. -/
theorem isDoubleCosetReps_one : IsDoubleCosetReps U 1 {1} := by
  sorry

/-- **ALS.3.1, `LocallySymmetric.Hecke.invariantsModule`.** For representatives of `UgU/U` the
double-coset operator preserves `U`-invariants. -/
theorem doubleCosetOperator_mem_invariants (ρ : Representation ℤ G M) (g : G) (reps : Finset G)
    (hreps : IsDoubleCosetReps U g reps) (m : M) (hm : ∀ u ∈ U, ρ u m = m) :
    ∀ u ∈ U, ρ u (doubleCosetOperator ρ reps m) = doubleCosetOperator ρ reps m := by
  sorry

/-- **ALS.3.1.** On `U`-invariants the operator does not depend on the representatives. -/
theorem doubleCosetOperator_indep (ρ : Representation ℤ G M) (g : G) (reps reps' : Finset G)
    (hreps : IsDoubleCosetReps U g reps) (hreps' : IsDoubleCosetReps U g reps') (m : M)
    (hm : ∀ u ∈ U, ρ u m = m) :
    doubleCosetOperator ρ reps m = doubleCosetOperator ρ reps' m := by
  sorry

/-- **`hecke_degree_eq_index`.** On the trivial module `ℤ` the operator of `UgU` is multiplication
by the degree `[U : U ∩ gUg⁻¹]`, Tau Ceti's `(gUg⁻¹).relIndex U`. Tau Ceti provides the degree
homomorphism as `LeftCosetModule.deg` and proves its coefficient-sum action as
`LeftCosetModule.degree_smul_eq_deg`; this is its trivial-module form with explicit representatives. -/
theorem hecke_degree_eq_index (g : G) (reps : Finset G)
    (hreps : IsDoubleCosetReps U g reps) (z : ℤ) :
    doubleCosetOperator (1 : Representation ℤ G ℤ) reps z =
      ((ConjAct.toConjAct g • U).relIndex U : ℤ) * z := by
  sorry

/-- **ALS.3.4, `heckeInvariants_S3_obstruction`.** On the invariants of the regular
`𝔽₃[S₃]`-module under `⟨(0 1)⟩`, the Hecke element `ε = T + 1` acts by the all-ones
matrix. Its square is zero and `(1,2,0)` lies in its kernel outside its image, giving
the obstruction to extending the map from `(ε)` in the README's noninjectivity check. -/
theorem heckeInvariants_S3_obstruction :
    let ε : (Fin 3 → ZMod 3) →ₗ[ZMod 3] (Fin 3 → ZMod 3) :=
      Matrix.mulVecLin (fun _ _ => (1 : ZMod 3) : Matrix (Fin 3) (Fin 3) (ZMod 3))
    ε.comp ε = 0 ∧
      ![1, 2, 0] ∈ LinearMap.ker ε ∧ ![1, 2, 0] ∉ LinearMap.range ε := by
  sorry

/-- **ALS.3.8, `T_p² = T_{p²} + (p + 1)S_p`.** In the Hecke ring of `(GL_2(ℚ_p), GL_2(ℤ_p))`, with
`T_{p²}` the single double coset of `diag(p², 1)` and `S_p` that of `diag(p, p)`. Tau Ceti proves
the integral-pair relation as `HeckeRing.GL2.heckeT_prime_mul_heckeTDiag_one_prime_pow` at `k = 1`;
this target is the local spherical-pair form. -/
theorem heckeBasis_GL2_square (p : ℕ) [Fact p.Prime] (W : Subgroup (GL (Fin 2) ℚ_[p]))
    (hW : W = (GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p))).range)
    [IsHeckeTriple (⊤ : Submonoid (GL (Fin 2) ℚ_[p])) W W] (t t₂ s : GL (Fin 2) ℚ_[p])
    (ht : (t : Matrix (Fin 2) (Fin 2) ℚ_[p]) = !![(p : ℚ_[p]), 0; 0, 1])
    (ht₂ : (t₂ : Matrix (Fin 2) (Fin 2) ℚ_[p]) = !![(p : ℚ_[p]) ^ 2, 0; 0, 1])
    (hs : (s : Matrix (Fin 2) (Fin 2) ℚ_[p]) = !![(p : ℚ_[p]), 0; 0, (p : ℚ_[p])]) :
    heckeBasis W ℤ t 1 * heckeBasis W ℤ t 1 =
      heckeBasis W ℤ t₂ 1 + heckeBasis W ℤ s ((p : ℤ) + 1) := by
  sorry

variable (R : Type*) [CommRing R]

/-- The value `χ(g)` of a character trivial on `U` at a representative of the double coset `UgU`;
it does not depend on the representative. -/
def heckeCosetCharacter (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) :
    HeckeCoset (⊤ : Submonoid G) U U → Rˣ :=
  Quotient.lift (fun g : (⊤ : Submonoid G) => χ g) (by sorry)

/-- **ALS.3.12.** The character value of the identity double coset is `1`. -/
theorem heckeCosetCharacter_one (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) :
    heckeCosetCharacter U R χ hχ (HeckeCoset.mk U U ⟨1, Submonoid.mem_top 1⟩) = 1 := by
  sorry

/-- **ALS.3.12.** The two distinct translates `1` and `3` by even integers have the
same parity-character value on their double coset. -/
theorem heckeCosetCharacter_parity :
    let χ : Multiplicative ℤ →* ℚˣ := zpowersHom ℚˣ (-1)
    let U := χ.ker
    let hχ : ∀ u ∈ U, χ u = 1 := fun _ hu => hu
    Multiplicative.ofAdd (2 : ℤ) ∈ U ∧
      Multiplicative.ofAdd (1 : ℤ) ≠ Multiplicative.ofAdd (3 : ℤ) ∧
      heckeCosetCharacter U ℚ χ hχ
          (HeckeCoset.mk U U ⟨Multiplicative.ofAdd 1, Submonoid.mem_top _⟩) =
        heckeCosetCharacter U ℚ χ hχ
          (HeckeCoset.mk U U ⟨Multiplicative.ofAdd 3, Submonoid.mem_top _⟩) := by
  sorry

/-- **ALS.3.12.** The sign character on the normal quotient `S₃/A₃` has value `−1`
on the transposition double coset. -/
theorem heckeCosetCharacter_sign :
    let χ : Equiv.Perm (Fin 3) →* ℤˣ := Equiv.Perm.sign
    let U := χ.ker
    let hχ : ∀ u ∈ U, χ u = 1 := fun _ hu => hu
    Nat.card (Equiv.Perm (Fin 3) ⧸ U) = 2 ∧
      heckeCosetCharacter U ℤ χ hχ
        (HeckeCoset.mk U U ⟨Equiv.swap 0 1, Submonoid.mem_top _⟩) = -1 := by
  sorry

/-- **ALS.3.12, `LocallySymmetric.twistHecke`.** Twisting by a character `χ` trivial on `U`: the
ring automorphism of the Hecke ring multiplying the coefficient of `[UgU]` by `χ(g)⁻¹`. On
coefficients the matching twist is Tau Ceti's `Representation.charTwist` at `χ⁻¹`. -/
def twistHecke [IsHeckeTriple (⊤ : Submonoid G) U U] (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) :
    𝕋 (⊤ : Submonoid G) U R ≃+* 𝕋 (⊤ : Submonoid G) U R where
  toFun f := HeckeCosetModule.of ((HeckeCosetModule.of.symm f).sum fun D r =>
    Finsupp.single D ((((heckeCosetCharacter U R χ hχ D)⁻¹ : Rˣ) : R) * r))
  invFun f := HeckeCosetModule.of ((HeckeCosetModule.of.symm f).sum fun D r =>
    Finsupp.single D (((heckeCosetCharacter U R χ hχ D : Rˣ) : R) * r))
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
  map_add' := by sorry

/-- **ALS.3.12, `LocallySymmetric.twistHecke`.** On basis elements the twist is
`r·[UgU] ↦ χ(g)⁻¹r·[UgU]`; the check `twistHecke_T_GL1` is the case `G = F_v^×`, `U = O_v^×`,
`g = ϖ_v`. -/
theorem twistHecke_single [IsHeckeTriple (⊤ : Submonoid G) U U] (χ : G →* Rˣ)
    (hχ : ∀ u ∈ U, χ u = 1) (g : G) (r : R) :
    twistHecke U R χ hχ (heckeBasis U R g r) = heckeBasis U R g ((((χ g)⁻¹ : Rˣ) : R) * r) := by
  sorry

/-- **`twistHecke_trivial`.** Twisting by the trivial character is the identity. -/
theorem twistHecke_trivial [IsHeckeTriple (⊤ : Submonoid G) U U] :
    twistHecke U R 1 (fun _ _ => rfl) = RingEquiv.refl _ := by
  sorry

/-- **ALS.3.12, `LocallySymmetric.twistHecke_mul`.** Successive character twists multiply the
characters; in particular, twisting by inverse characters cancels. -/
theorem twistHecke_mul [IsHeckeTriple (⊤ : Submonoid G) U U] (χ ψ : G →* Rˣ)
    (hχ : ∀ u ∈ U, χ u = 1) (hψ : ∀ u ∈ U, ψ u = 1) :
    (twistHecke U R χ hχ).trans (twistHecke U R ψ hψ) =
      twistHecke U R (χ * ψ) (fun u hu => by simp [hχ u hu, hψ u hu]) := by
  sorry

end Hecke

/-!
## Statements not typed at the pins

The following README targets need carriers that Mathlib and Tau Ceti do not provide at the pinned
commits; they are stated in `README.md` with their exact hypotheses and are not Lean declarations
here.

* Foundations (Layer ALS.F): `realPoints_lieGroup` (real points of algebraic groups as Lie groups).
  DerivedModuleAlgebra §1.E.0 owns ordinary-module perfectness for every unital ring:
  `DerivedDeRham.IsPerfect` means a bounded finite-projective left-module representative in
  Mathlib's `DerivedCategory (ModuleCat A)`. `PerfectComplex.IsPerfect` is its shared alias.
  The elementary finite-model and closure API has that same owner.
  `PerfectComplex.IsPerfect.of_triangle` and `PerfectComplex.IsPerfect.of_summand` consume
  `isPerfect_triangle` and `isPerfect_retract`; triangle rotation and `isPerfect_shift`
  give two-out-of-three. For commutative rings `PerfectComplex.IsPerfect.baseChange` consumes
  `isPerfect_baseChange`. ALS.F.2 owns the additional noncommutative scalar extension in the
  order `B ⊗^L_A K`, `PerfectComplex.IsPerfect.restrictScalars` when `B` is perfect as a left
  `A`-module, `PerfectComplex.IsPerfect.iff_pseudoCoherent_finiteTorDimension` with right-module
  Tor tests, and `PerfectComplex.IsPerfect.dual` taking values in right modules, or left
  modules over the opposite ring, with opposite-ring biduality.
  EtaleCohomologyFoundations §F.10.3 / `PerfectComplex.lefschetzNumber`,
  `PerfectComplex.filteredTraceAdditivity` supplies the enhanced DG/module comparison,
  commutative compact/dualizable characterization, traces and coherent filtered additivity.
  On commutative rings `PerfectComplexInput(A)` identifies the supplier's enhanced perfect
  objects with the full subcategory defined by `DerivedDeRham.IsPerfect A`, equivalently
  `PerfectComplex.IsPerfect A`. Its realization is an equivalence with natural unit, counit
  and shift/scalar/tensor/dual comparisons, natural in module morphisms and coefficient maps.
  Finite-projective representatives realize to their usual derived objects and traces to
  alternating termwise traces. Finite filtered objects use the supplier's coherent enhancement
  and the same realization and graded-piece comparisons. This enhanced identification is an
  explicit hypothesis; the handedness, restriction-of-scalars and right-module Tor proofs and
  arithmetic finite-cell arguments use the supplied ordinary-module core independently of it.
  Tensor/dualizable identities for two left complexes require commutativity. Arithmetic duality
  uses `RHom_R(−,R)` with the contragredient finite-group action.
  Bounded constructible/ctf categories on the étale domain
  are supplied by EtaleCohomologyFoundations §F.1 /
  `VanishingCycles.constructibleDerivedCategory`.
  `SheafDerived.pushforward` and its API are only arithmetic adapters to the generic topological
  `j_!`, `Rf_!`, `RΓ_c` and comparison functors supplied by ComplexComparisonPartII §C6.1 /
  `topologicalCoefficientComparison`; §C6.4 / `artinComparisonCompactSupport` supplies
  compact-support Artin comparison and independence of algebraic compactification on separated
  finite-type complex schemes. Relative Borel–Serre comparison consumes §C6.1 and the arithmetic
  pair model. The finite-coefficient carrier `FiniteModuleLocalSystem Λ T` of §C6.1 is
  the finite-stalk subcategory of `TauCeti.LocalCoefficientSystem Λ T`. On locally
  path-connected, semilocally simply connected spaces its sheaf equivalence preserves
  vertex stalks and path transport, and its direct cochains use inverse first-edge
  transport. The arithmetic adapters use the supplied sheaf resolution and support functors.
  `TopologicalCoefficientInput(R)` assumes the ordinary
  local-system comparison for arbitrary commutative rings/stalk modules, compact support on
  the relative finite CW models, and functor coherence on all spaces used here outside that
  finite-coefficient domain, including ALS.F.4. It asserts no perfectness.
  `EquivariantSheaf` (equivariant sheaves for topological groups and their discrete specialization),
  `EquivariantSheaf.invariantSections` and `EquivariantSheaf.invariantSectionsWithSupport`
  (discrete invariant sections, the injective-acyclic composite and supported localization).
  Discrete equivariant sections preserve injectives for every topological carrier; supported
  and boundary sheaves receive separate injective resolutions.
  `lieCochains` (Chevalley–Eilenberg and relative cochains), `AutomorphicForm` (automorphic forms
  and cusp forms, with regularizing kernels invariant under conjugation by `K_∞` and
  `AutomorphicForm.cuspidalSpectrum_discrete` assembling cusp forms as an algebraic direct sum of
  admissible modules), `cohomologicalRepresentation` (algebraic weights, Wigner's lemma and the
  degree range; its coefficient lattices are finite free over the coefficient ring with a separate
  compact-group representation). ALS.F.7 also owns
  `cohomologicalRepresentation.finiteInfinitesimalCharacter`: for `G(F_∞)` with full maximal
  compact `K_∞`, each character of `Z(𝔤)` has finitely many isomorphism classes of irreducible
  admissible compatible `(𝔤, K_∞)`-modules. This precedes fixed-weight finiteness and the specialized
  cuspidal calculations. These module carriers are not provided at the pins.
* Algebraic groups over number fields, their real points as Lie groups and algebraic Cartan
  involutions (twisted real forms): `IsCartanInvolution` and its API, including
  `IsCartanInvolution.iff_inverseAdjoint` (the AA.3.7 comparison preserving the specified involution,
  fixed compact and split centre; AA.3.7 supplies rational existence), `realPoints_cartanDatum`,
  `isMaximalCompact_fixedPoints`, `symmetricSpace` and its API, `symmetricSpace.contractible`
  (ALS.0.5 owns the proper-action/discrete-image/finite-kernel theorem; KleinianGroups Layer 1,
  `properlyDiscontinuousSMul_of_discrete`, is its PSL₂(ℂ) special case after the equivariant
  H³ identification and trivial-split-centre verification).
* Adelic level quotients (AdelicAlgebraicGroups §4.4) and neat levels (§4.3, using
  `Neat.IsNeatLevel`'s arithmetic-intersection convention, implied by the adelic condition of NT16
  and ACC+): `X` and its API,
  `X.componentDecomposition`, `X.properlyDiscontinuous`, `X.manifold_of_neat`, `taylorWilesLevel`,
  `isNeat_of_two_proUnipotent`, `orientationSystem`, `nonorientable_neat_PGL2`.
* Parahoric group schemes (ReductiveGroupsPartII, Layer RG2.3): `iwahori.eq_parahoric`.
* Equivariant sheaves, their derived functors and supports, and singular cochains with supports:
  `localSystem`, `RΓ`, `RΓc`, `RΓrel`, `RΓ.refinementIndependence`, `RΓ.isoSingular`,
  `RΓ.isoGroupCohomology`, `RΓrel.perfect_of_freeCellModel`, `RΓ.baseChange`, `RΓ.pullback`,
  `RΓ.translate`. Geometric translation carries the conjugation-transported coefficient
  `V^(g)` at `gKg⁻¹`, with action `k′ ↦ ρ(g⁻¹k′g)`. Comparison with a prescribed coefficient
  carries an equivariant linear map commuting with the rational action; a translation isomorphism
  requires an equivariant `LinearEquiv`. `translationCoefficientEquiv` gives the sufficient group
  action case and `translationCoefficientEquiv_intertwines` its conjugation identity.
  Compact-support, boundary and relative versions retain this datum and conjugate the deck group.
  For `RΓ.isoSingular`, consume ComplexComparisonPartII §C6.1's comparison
  with the arithmetic slice and whole-inverse endpoint conventions. Its value system is `V_K`;
  the pinned Hom-of-twisted-chains carrier uses `L = V_K^∨`, `M = R` and finite-projective
  biduality `Hom_R(V^∨,R) = V`. The arithmetic adapter retains level/translation and Hecke
  naturality, forget-supports and relative Borel–Serre comparisons. Uses outside the supplier
  domain carry `TopologicalCoefficientInput(R)`, including arbitrary modules in ALS.1.5.
  For `RΓ.isoGroupCohomology`, the neat-component-group-cohomology clause is
  supplied by ClassifyingSpaces §Stage 4, items 16–18 / item 17 Homology, local-coefficient
  cohomology; the arithmetic consumer retains the deck/opposite and slice-action
  adapter, CW-model transport, sheaf/derived comparison over arbitrary commutative rings and
  arbitrary coefficient modules, finite component assembly and non-neat stabilizer descent.
  For `RΓrel.perfect_of_freeCellModel`, cellular-freeness is supplied by ClassifyingSpaces
  §Stage 3, item 13 / CW structures and coverings, free cellular chain clause;
  the arithmetic consumer discharges the Hausdorff CW and quotient-cover hypotheses for the
  full group `G(F) × K` and retains finite basis-orbit counts, boundedness, the relative/coefficient
  model and derived perfectness over possibly noncommutative `R[K/K′]`, using the shared
  `PerfectComplex.IsPerfect` interface of ALS.F.2. No abelian hypothesis on the quotient is
  imposed in ALS.1.6 or ALS.6.1. These supplier clauses are README targets, not additional Lean
  declarations here.
* The Borel–Serre bordification as a manifold with corners and its strata:
  `BorelSerre.face`, `BorelSerre.bordification`, `BorelSerre.compact_quotient`,
  `BorelSerre.finiteTriangulation` (the geometric boundary-compatible cell structure precedes
  `RΓ.isoSingular` and `RΓrel.perfect_of_freeCellModel`; cohomological finiteness follows them),
  `BorelSerre.stratum`, `BorelSerre.unipotentLattice_cocompact`,
  `BorelSerre.parabolicArithmeticExtension`, `BorelSerre.stratum_fibration`,
  `BorelSerre.stratSpectralSequence`, `BorelSerre.mayerVietorisSpectralSequence`,
  `BorelSerre.stratumCompactification`.
* Hecke operators on Betti complexes and their strict lifts: `Hecke.invariantsFunctor`,
  `Hecke.derivedInvariants`, `heckeAction`, `heckeComplex` and its API,
  where ALS.3.4 uses `Sh_Δ(Z,R) → Mod(R[Δ]) → Mod(𝕋(Δ,U) ⊗ R)` with global sections
  preserving injectives and Hecke invariants applied termwise to that injective complex.
  The sheaf category is the discrete-group specialization of ALS.F.4.
  Restriction to `L = K` and free `U = K′` descent at neat level give the comparison in
  `D(R[K/K′])`; at non-neat level free descent by neat normal `K₀` is followed by derived
  `K′/K₀` invariants. The latter preserve injectives in `Mod(R[K/K′])` by exact inflation.
  No injective preservation into the full Hecke-module category is assumed;
  `heckeInvariants_S3_obstruction` states the all-ones-matrix obstruction over `𝔽₃`.
  Supported and boundary sheaves receive their own equivariant injective resolutions.
  The API also includes
  `heckeAction_eq_correspondence` (at S, the middle arrow is a coefficient morphism
  `c_g : p₂^*V → p₁^*V`, whose stalk map commutes with the rational action and satisfies
  `A_g ρ(g⁻¹kg) = ρ(k) A_g` on the intersection level; an isomorphism requires invertibility),
  `RΓ.trace`, `RΓ.mackey`, `heckeAction_mul`,
  `heckeAction_compatible` (the cup class is fixed in the inverse-character twist, with the
  character trivial on the level),
  `heckeAction_discrete_eq_topological` (smooth discrete coefficients),
  `heckeAction_integralLimit` (at fixed good level, finite free lattices with smooth reductions,
  complete DVR coefficients and compatible bounded finite models, with the strict Hecke action),
  `derivedHeckeAlgebra` (the
  derived Hecke image of IntegralHeckeAndGaloisDeterminants, Layer 2, applied to `RΓ(X_K, V)`),
  `idelicCharacter`, `twistMaximalIdeal`, `twistIso` (coefficients finite free over `O`, with a
  separate `O`-linear `K_S`-action), `oldformSplitting`.
* Boundary complexes and localization: `boundaryTriangle`, `Hecke.restrictParabolic`,
  `Hecke.integrateUnipotent`, `Hecke.satakeUnnormalized`, `BorelSerre.stratum_hecke_restrict`,
  `nomizu`, `kostant_splittingField`, `BorelSerre.stratum_kostant`,
  `BorelSerre.stratum_hochschildSerre`, `BorelSerre.boundary_localized_vanishing`, `heckeLocalize`,
  `IsGaloisType`, `IsEisenstein`, `IsEisensteinCG`, `boundary_vanishing_of_eigenvalues`,
  `boundary_isEisenstein_GL`, `ResidualUnitaryGaloisInput`, `boundary_localized_eq_siegel`.
  In ALS.4.10, `siegel_pullback_boundary_can_survive` localizes the unitary boundary at the
  Satake pullback of a non-Eisenstein rank-`n` Siegel Levi ideal. The companion check
  `siegel_pullback_isEisenstein` uses the two rank-`n` summands of the ambient rank-`2n` system:
  either is a nonzero proper invariant subspace for `n ≥ 1`, even when the summands are isomorphic.
  At `n = 1` the Levi character is absolutely irreducible and its unitary pullback is reducible.
  In ALS.4.13, `ResidualUnitaryGaloisInput(F,n,O,S)` supplies continuous semisimple rank-`2a`
  representations of `G_{F,S}` for all supported eigensystems of `U(a,a)`, `0 < a < n`, at every
  good level hyperspecial outside the finite conjugation-stable `S ⊃ S_p` containing the places
  ramified over `F⁺`. It includes all finite smooth coefficients over finite residue-field
  extensions, their local-coefficient subquotients and dual orientation twists, and good level
  refinements inside `S`. Frobenius is geometric and its characteristic polynomial is the
  unitary polynomial with coefficients `(−1)^j q_v^{j(j−1)/2} T̃_{v,j}` in degree `2a−j`.
  The boundary theorem assumes this input alongside rank-`m` general linear Galois type for
  `1 ≤ m ≤ n` with the same level and finite-coefficient coverage, and a non-Eisenstein Siegel
  ideal. For `U(2,2)` the contract supplies the middle rank-two representation for the Levi
  `Res GL₁ × U(1,1)`; the Satake comparison gives dimensions `1 + 2 + 1`. Arithmetic existence
  is a residual-cohomology hypothesis, separate from the characteristic-zero `GaloisInput`.
* Topological manifolds with boundary carrying orientation local systems and Verdier duality:
  `BorelSerre.manifoldWithBoundary`, `verdierDuality`, `dualityPairing` and its API,
  `verdierDuality_hecke`, `verdierDuality_triangle` (perfect coefficients; its localization clause
  uses complete-DVR finite Hecke images and dual idempotent summands),
  `verdierDuality_of_invertibleOrder`.
* Flat bundles, automorphic forms and Galois representations: `deRhamIso`, `deRham_pairing`,
  `moderateGrowthIso`, `automorphicComparisonMap`, `FrankeInput`, `automorphicComparison`,
  `cuspidalCohomology` and its API, `cuspidal_contributes_GL`, `GaloisInput.GL`,
  `GaloisInput.unitary`, `GaloisInput.induced_charpoly`, `GaloisInput.unitary_constituents`,
  `nonEisenstein_cuspidal_range`, `unitary_middleDegree_cuspidal`.
* Finite covers of level quotients: `RΓrel.descent`, `hochschildSerre`, `lowestDegree_descent`,
  `towerChecks`.
-/

end

end TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

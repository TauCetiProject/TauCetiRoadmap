import Mathlib
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Coordinate.HopfAlgebra
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.GroupTheory.Coxeter.Parabolic

/-!
# ShimuraData: representative target signatures

The roadmap is `README.md`. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It fixes common determinants,
left Kostant cosets, the central character in genus-two coordinates, and normalized valuations.
The matrix, character-lattice and local-family statements below are the explicitly indicated
parts of the geometric targets; the README states their full geometric conclusions.
The genus-two statements specialize AutomorphicFormsOnReductiveGroups §§6.1, 6.3 and 6.7:
its Hermitian datum, lattice/root/chamber API and Siegel Kostant indices are expressed in the
CG basis obtained by swapping its last two symplectic basis vectors. The matrix comparisons
identify the supplied stabilizer, compact quotient and Hodge summands with the CG centralizer,
compact Cartan and Cayley basis. Kostant's Lie-cohomology theorem is supplied by
ArithmeticLocallySymmetricSpaces ALS.4.5; the native Coxeter parabolic API supplies factorization
and length additivity, and the local comparison identifies its index conventions.
-/

noncomputable section
open scoped TensorProduct
open TauCeti

namespace TauCetiRoadmap.ShimuraData

/-! ## Layer 0: real and adelic points of the Hilbert groups -/

section HilbertPoints
variable (F : Type*) [Field F] [NumberField F]

/-- The algebraic real-points comparison and its exact common-determinant locus.
The topology, Lie-group and component comparisons are the additional README conclusions. -/
theorem hilbertRealPoints [NumberField.IsTotallyReal F] :
    ∃ e : ℝ ⊗[ℚ] F ≃ₐ[ℝ] ((F →+* ℝ) → ℝ),
      (∀ (r : ℝ) (x : F) (σ : F →+* ℝ), e (r ⊗ₜ x) σ = r * σ x) ∧
      ∀ g : GL (Fin 2) (ℝ ⊗[ℚ] F),
        (∃ t : ℝ, ∀ σ : F →+* ℝ,
            ((Matrix.GeneralLinearGroup.map
              ((Pi.evalRingHom (fun _ : F →+* ℝ ↦ ℝ) σ).comp e.toRingHom) g).det : ℝ) = t) ↔
          (Matrix.GeneralLinearGroup.det g : ℝ ⊗[ℚ] F) ∈ Set.range (algebraMap ℝ (ℝ ⊗[ℚ] F)) := by
  sorry

/-- The finite-adelic ring comparison underlying the Hilbert point comparison.
The adelic topology and the restricted-product group comparison remain in the README. -/
theorem hilbertAdelicPoints :
    ∃ e : IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] F ≃+*
        IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F,
      ∀ x : F, e (1 ⊗ₜ x) = algebraMap F _ x := by
  sorry

/-- Equal signs do not imply equal determinants. -/
example : (0 : ℝ) < (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ).det ∧
    (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ).det ≠
      (1 : Matrix (Fin 2) (Fin 2) ℝ).det := by
  sorry
end HilbertPoints

/-! ## Layer 1: rational weight, Mumford–Tate groups and Hodge genericity -/

section MumfordTate
variable {B : Type*} [CommRing B] [Algebra ℚ B]

/-- The largest Hopf ideal killed by a rational coordinate map. For the split complexified
Hodge map this is the Mumford–Tate ideal; a real descent condition is not needed for this
lattice operation. The coordinate algebra and Hopf-ideal lattice already exist. -/
def mumfordTateHopfIdeal (n : ℕ)
    (φ : (GeneralLinear.coordinateHopfAlgebra ℚ n : Type) →ₐ[ℚ] B) :
    TauCeti.HopfIdeal ℚ (GeneralLinear.coordinateHopfAlgebra ℚ n : Type) :=
  sSup {I | ∀ x ∈ I, φ x = 0}

/-- The Hopf ideal lies in the coordinate kernel and is universal among Hopf ideals there. -/
theorem mumfordTateHopfUniversal (n : ℕ)
    (φ : (GeneralLinear.coordinateHopfAlgebra ℚ n : Type) →ₐ[ℚ] B) :
    (mumfordTateHopfIdeal n φ).toIdeal ≤ RingHom.ker φ ∧
      ∀ I : TauCeti.HopfIdeal ℚ (GeneralLinear.coordinateHopfAlgebra ℚ n : Type),
        I ≤ mumfordTateHopfIdeal n φ ↔ ∀ x ∈ I, φ x = 0 := by
  sorry

/-- The coordinate quotient is finite type; finite tensor equations are not an extra input. -/
theorem mumfordTateFiniteType (n : ℕ)
    (φ : (GeneralLinear.coordinateHopfAlgebra ℚ n : Type) →ₐ[ℚ] B) :
    Algebra.FiniteType ℚ
      ((GeneralLinear.coordinateHopfAlgebra ℚ n : Type) ⧸ (mumfordTateHopfIdeal n φ).toIdeal) := by
  sorry

/-- An injective coordinate map has no nonzero killed Hopf ideal, as in the Tate example. -/
example (n : ℕ) (φ : (GeneralLinear.coordinateHopfAlgebra ℚ n : Type) →ₐ[ℚ] B)
    (hφ : Function.Injective φ) : mumfordTateHopfIdeal n φ = ⊥ := by
  sorry

/-- The trivial action gives the augmentation ideal, rather than the whole GL₁. -/
example : (mumfordTateHopfIdeal 1 (GeneralLinear.counit ℚ 1)).toIdeal =
    RingHom.ker (GeneralLinear.counit ℚ 1) := by
  sorry
end MumfordTate

/-! ## Layer 2: uniqueness of the complex structure

`uniqueComplexStructure` uses the supplied Hermitian component and its holomorphic variation.
`PureDatum.toHermitianGroupDatum` constructs the actual `h`, centralizer, full positive real
split centre, compact quotient and adjoint Hodge summands of the supplied Hermitian interface,
with tangent signs and product/restriction-of-scalars comparisons as in README §2.2.
-/

/-! ## Layer 3: variations, compact duals and integral flags -/

/-- A complex scalar preserving a weight-zero filtration need not preserve its rational form. -/
example : ¬ ∃ q : ℚ, (q : ℝ) = Real.sqrt 2 := by
  sorry

/-- For `μ(t)=diag(1,t)`, the filtration-preserving upper unipotent contracts under `μ⁻¹`. -/
example (t : ℂ) (ht : t ≠ 0) :
    (!![1, 0; 0, t⁻¹] : Matrix (Fin 2) (Fin 2) ℂ) * !![1, 1; 0, 1] * !![1, 0; 0, t] =
      !![1, t; 0, 1] := by
  sorry

section Kostant
variable {B W : Type*} [Group W] {M : CoxeterMatrix B} (cs : CoxeterSystem M W)

/-- The native Coxeter-system form of the minimal LEFT representatives, to compare with
ALS.4.5's root-theoretic representatives. -/
def kostantRepresentatives (J : Set B) : Set W :=
  {w | cs.IsMinimalCosetRep J w⁻¹}

/-- The native parabolic factorization and length additivity in the left-minimal convention. -/
theorem kostantFactorization (J : Set B) :
    (∀ w : W, ∃! v, v ∈ kostantRepresentatives cs J ∧
      ∃ u ∈ cs.parabolic J, w = u * v) ∧
    (∀ u w : W, u ∈ cs.parabolic J →
      w ∈ kostantRepresentatives cs J → cs.length (u * w) = cs.length u + cs.length w) := by
  constructor
  · intro w
    obtain ⟨⟨u, v⟩, ⟨hu, hv, hw⟩, huniq⟩ := cs.existsUnique_mem_parabolic_mul J w
    have hmin : v ∈ kostantRepresentatives cs J :=
      cs.isMinimalCosetRep_iff.mpr fun i hi hd => hv i hi (cs.isRightDescent_inv_iff.mp hd)
    refine ⟨v, ⟨hmin, u, hu, hw⟩, ?_⟩
    rintro v' ⟨hv', u', hu', hw'⟩
    have hdesc : ∀ i ∈ J, ¬ cs.IsLeftDescent v' i :=
      fun i hi hd => cs.isMinimalCosetRep_iff.mp hv' i hi
        (cs.isRightDescent_inv_iff.mpr hd)
    exact congrArg Prod.snd (huniq (u', v') ⟨hu', hdesc, hw'⟩)
  · intro u w hu hw
    exact cs.length_mul_of_forall_not_isLeftDescent hu fun i hi hd =>
      cs.isMinimalCosetRep_iff.mp hw i hi (cs.isRightDescent_inv_iff.mpr hd)

/-- Longest Levi/full elements give opposition and complementary lengths. -/
theorem kostantInvolution (J : Set B) (w₀ w₀J : W) (h₀ : ∀ v, cs.length v ≤ cs.length w₀)
    (hJ : w₀J ∈ cs.parabolic J)
    (h₀J : ∀ v ∈ cs.parabolic J, cs.length v ≤ cs.length w₀J)
    (w : W) (hw : w ∈ kostantRepresentatives cs J) :
    w₀J * w * w₀ ∈ kostantRepresentatives cs J ∧ w₀J * (w₀J * w * w₀) * w₀ = w ∧
      cs.length (w₀J * w * w₀) + cs.length w + cs.length w₀J = cs.length w₀ := by
  sorry

example : kostantRepresentatives cs ∅ = Set.univ := by
  sorry

example : kostantRepresentatives cs Set.univ = {1} := by
  sorry
end Kostant

/-! ## Layer 4: types, additional axioms and distinguished data

The data, type predicates and distinguished fibre-product datum require the supplied group
and Shimura carriers. Their statements, including the prescribed-cover lift, are in README.md.
`distinguishedDatum_levi` forms its centralizers over a chosen common splitting field `L`
containing the reflex fields, with compatible cocharacter representatives over `L`.
Its central quotients use the base changes of the rational subtori `Z_s`.
-/

/-! ## Layer 5: Hilbert and Siegel coordinates and neat levels -/

section GenusTwo

/-- Coordinate presentation of the supplied split character lattice; the third coordinate
is the similitude exponent. -/
abbrev CGWeight : Type := ℤ × ℤ × ℤ

example : ((0, 0, 1) : CGWeight).2.2 = 1 := by
  sorry

/-- The supplied positive-root table transported to the CG upper-triangular convention. -/
abbrev cgRoots : Fin 4 → CGWeight := ![(1, -1, 0), (0, 2, -1), (1, 1, -1), (2, 0, -1)]

example : cgRoots 1 = (0, 2, -1) := by
  sorry

/-- Coroots in the order of `cgRoots`. -/
def cgCoroots : Fin 4 → CGWeight := ![(1, -1, 0), (0, 1, 0), (1, 1, 0), (1, 0, 0)]

example : cgCoroots 1 = (0, 1, 0) := by
  sorry

/-- The weight/coweight dot pairing in these coordinates. -/
def cgPair (χ μ : CGWeight) : ℤ := χ.1 * μ.1 + χ.2.1 * μ.2.1 + χ.2.2 * μ.2.2

example : ∀ i, cgPair (0, 0, 1) (cgCoroots i) = 0 := by
  sorry

/-- The dot pairing retains the central coordinate even though every coroot has central zero. -/
example : cgPair (0, 0, 1) (0, 0, 1) = 1 := by
  sorry

/-- The supplied root table has the C₂ pairings and half-sum in the CG presentation.
The comparison with the Shimura filtration uses the transported root matrices of README §5.9. -/
theorem gsp4CgRoots :
    (∀ i, cgPair (cgRoots i) (cgCoroots i) = 2) ∧ cgPair (cgRoots 0) (cgCoroots 1) = -1 ∧
      cgPair (cgRoots 1) (cgCoroots 0) = -2 ∧ (∑ i, cgRoots i) = (4, 2, -3) := by
  sorry

/-- Coordinate presentation of the supplied split-to-compact parity conversion. -/
abbrev cgToPilloni (χ : CGWeight) : CGWeight := (χ.1, χ.2.1, χ.1 + χ.2.1 + 2 * χ.2.2)

example : cgToPilloni (0, 0, 1) = (0, 0, 2) := by
  sorry

example : cgToPilloni (1, 0, 0) = (1, 0, 1) ∧
    cgToPilloni (0, 0, 0) = (0, 0, 0) := by
  sorry

example : ¬ ∃ χ : CGWeight, cgToPilloni χ = (1, 0, 0) := by
  sorry

/-- CG coordinate actions of the four `GSp₄` minimal left representatives supplied by
AutomorphicFormsOnReductiveGroups §6.7, including the similitude exponent. -/
def gsp4KostantAction : Fin 4 → CGWeight → CGWeight :=
  ![fun χ ↦ χ, fun χ ↦ (χ.1, -χ.2.1, χ.2.1 + χ.2.2), fun χ ↦ (χ.2.1, -χ.1, χ.1 + χ.2.2),
    fun χ ↦ (-χ.2.1, -χ.1, χ.1 + χ.2.1 + χ.2.2)]

example : gsp4KostantAction 1 (2, 1, 0) = (2, -1, 1) := by
  sorry

example : gsp4KostantAction 2 (3, 2, 1) = (2, -3, 4) := by
  sorry

/-- The `g = 2` specialization of the supplied Siegel indices has CG opposition `i ↦ 3-i`.
The Levi swap and full longest action are distinguished. -/
theorem gsp4Kostant :
    (∀ i : Fin 4,
      (fun χ : CGWeight ↦ (χ.2.1, χ.1, χ.2.2)) ∘ gsp4KostantAction i ∘
        (fun χ : CGWeight ↦ (-χ.1, -χ.2.1, χ.1 + χ.2.1 + χ.2.2)) =
      gsp4KostantAction (Fin.rev i)) ∧
    (fun χ : CGWeight ↦ (χ.2.1, χ.1, χ.2.2)) ≠
      (fun χ : CGWeight ↦ (-χ.1, -χ.2.1, χ.1 + χ.2.1 + χ.2.2)) := by
  sorry

/-- Coordinate presentation of the supplied four closed chambers; their central coordinate
is unrestricted. README §5.11 compares them with the Shimura-filtration representatives. -/
abbrev gsp4Chamber : Fin 4 → Set (ℝ × ℝ × ℝ) :=
  ![{x | x.1 ≥ x.2.1 ∧ x.2.1 ≥ 0}, {x | x.1 ≥ -x.2.1 ∧ -x.2.1 ≥ 0},
    {x | -x.2.1 ≥ x.1 ∧ x.1 ≥ 0}, {x | -x.2.1 ≥ -x.1 ∧ -x.1 ≥ 0}]

example : (2, 1, 7) ∈ gsp4Chamber 0 ∧ (2, 1, 7) ∉ gsp4Chamber 3 := by
  sorry

example : (-1, -2, 7) ∈ gsp4Chamber 3 := by
  sorry

example : (2, 1, -17) ∈ gsp4Chamber 0 ∧ (2, 1, 23) ∈ gsp4Chamber 0 := by
  sorry

example : ∀ c : ℝ, (1, 0, c) ∈ gsp4Chamber 0 ∩ gsp4Chamber 1 := by
  sorry

/-- CG specialization of AutomorphicFormsOnReductiveGroups §6.3's chamber duality by minus
the Levi longest element, indexed by §6.7's genus-two representatives as in README §5.11. -/
theorem gsp4ConeReversal (i : Fin 4) :
    (fun x : ℝ × ℝ × ℝ ↦ (-x.2.1, -x.1, -x.2.2)) '' gsp4Chamber i =
      gsp4Chamber (Fin.rev i) := by
  sorry

/-- Minus the full longest element preserves each chamber. -/
example (i : Fin 4) :
    (fun x : ℝ × ℝ × ℝ ↦ (x.1, x.2.1, -x.1 - x.2.1 - x.2.2)) ''
      gsp4Chamber i = gsp4Chamber i := by
  sorry

/-- The anti-diagonal two-by-two block in the CG symplectic form. -/
def cgS : Matrix (Fin 2) (Fin 2) ℝ := !![0, 1; 1, 0]

example : cgS * cgS = 1 := by
  sorry

example : cgS.det = -1 := by
  sorry

example : cgS.mulVec ![1, 0] = ![0, 1] := by
  sorry

/-- The matrix `J=h(i)` for the Siegel specialization of the supplied Hermitian datum
in the CG basis. -/
def cgJ : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℝ := Matrix.fromBlocks 0 cgS (-cgS) 0

example : cgJ * cgJ = -1 := by
  sorry

example : cgJ.transpose = -cgJ := by
  sorry

/-- The CG matrix characterization of the Siegel `hodgeStabilizer` supplied by
AutomorphicFormsOnReductiveGroups §6.1, including positive similitude. -/
theorem gsp4Centralizer (g : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℝ) (ν : ℝ)
    (hg : g.transpose * cgJ * g = ν • cgJ) (hdet : IsUnit g.det) :
    g * cgJ = cgJ * g ↔ 0 < ν ∧ g.transpose * g = ν • 1 := by
  sorry

/-- The CG matrix presentation of the supplied Siegel compact quotient after normalization
by its positive split centre, as identified in README §5.12. -/
def kInfinityOne : Set (Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℝ) :=
  {k | k.transpose * k = 1 ∧ k * cgJ = cgJ * k}

example : cgJ ∈ kInfinityOne := by
  sorry

/-- An orthogonal negative similitude is excluded. -/
example : Matrix.fromBlocks (1 : Matrix (Fin 2) (Fin 2) ℝ) 0 0 (-1) ∉ kInfinityOne := by
  sorry

example :
    let D := Matrix.fromBlocks (1 : Matrix (Fin 2) (Fin 2) ℝ) 0 0 (-1)
    D.transpose * D = 1 ∧ D.transpose * cgJ * D = -cgJ := by
  sorry

/-- The CG matrix model of the supplied Siegel compact quotient is in bijection with U(2).
README §5.13 identifies the quotient and refines this bijection to a Lie-group isomorphism. -/
theorem gsp4Unitary :
    ∃ e : kInfinityOne ≃ Matrix.unitaryGroup (Fin 2) ℂ,
      ∀ k : kInfinityOne, (e k : Matrix (Fin 2) (Fin 2) ℂ) =
        (k.1.toBlocks₂₂).map (algebraMap ℝ ℂ) +
          Complex.I • (cgS * k.1.toBlocks₁₂).map (algebraMap ℝ ℂ) := by
  sorry

/-- The centralizer block parametrization respects matrix multiplication. -/
example (A B A' B' : Matrix (Fin 2) (Fin 2) ℝ) :
    Matrix.fromBlocks (cgS * A * cgS) (cgS * B) (-(B * cgS)) A *
        Matrix.fromBlocks (cgS * A' * cgS) (cgS * B') (-(B' * cgS)) A' =
      Matrix.fromBlocks (cgS * (A * A' - B * B') * cgS) (cgS * (A * B' + B * A'))
        (-((A * B' + B * A') * cgS)) (A * A' - B * B') := by
  sorry

/-- Coordinate presentation of the supplied compact character lattice as a parity subset. -/
abbrev compactCartanCharacter : Set CGWeight := {χ | (χ.1 + χ.2.1 - χ.2.2) % 2 = 0}

example : (1, 0, 1) ∈ compactCartanCharacter := by
  sorry

example : (1, 0, 0) ∉ compactCartanCharacter := by
  sorry

example : (0, 1, 1) ∈ compactCartanCharacter ∧ (0, 0, 2) ∈ compactCartanCharacter := by
  sorry

/-- The coordinate conversion presents the supplied split/compact lattice equivalence.
README §5.14 identifies this lattice with the characters of the actual compact Cartan. -/
theorem compactCartanLattice :
    Function.Injective cgToPilloni ∧
      ∀ χ : CGWeight, χ ∈ compactCartanCharacter ↔ ∃ ψ : CGWeight, cgToPilloni ψ = χ := by
  sorry

/-- A character descends exactly when it is trivial on the simultaneous-sign kernel. -/
theorem compactCartanEmbedding (χ : CGWeight) :
    (-1 : ℂˣ) ^ χ.1 * (-1) ^ χ.2.1 * (-1) ^ χ.2.2 = 1 ↔
      χ ∈ compactCartanCharacter := by
  sorry
/-- The kernel of `(t₁, t₂, z) ↦ [(e^{i t₁}, e^{i t₂}, e^{z})]` modulo
`(−1, −1, −1)`. -/
theorem gsp4ExpKernel (t₁ t₂ z : ℂ) :
    ((Complex.exp (t₁ * Complex.I) = 1 ∧ Complex.exp (t₂ * Complex.I) = 1 ∧ Complex.exp z = 1) ∨
      (Complex.exp (t₁ * Complex.I) = -1 ∧ Complex.exp (t₂ * Complex.I) = -1 ∧ Complex.exp z = -1)) ↔
    ∃ m n k : ℤ, (t₁ = 2 * Real.pi * m ∧ t₂ = 2 * Real.pi * n ∧ z = 2 * Real.pi * Complex.I * k) ∨
      (t₁ = Real.pi + 2 * Real.pi * m ∧ t₂ = Real.pi + 2 * Real.pi * n ∧
        z = Real.pi * Complex.I + 2 * Real.pi * Complex.I * k) := by
  sorry

/-- The simultaneous odd half-period maps to the sign kernel and is not an even period. -/
example : Complex.exp ((Real.pi : ℂ) * Complex.I) = -1 ∧
    ¬ ∃ m : ℤ, (Real.pi : ℂ) = 2 * Real.pi * m := by
  sorry

/-- One odd angle and one even angle do not give the simultaneous-sign kernel. -/
example : ¬ ((Complex.exp ((Real.pi : ℂ) * Complex.I) = 1 ∧
      Complex.exp ((0 : ℂ) * Complex.I) = 1 ∧ Complex.exp (Real.pi * Complex.I) = 1) ∨
    (Complex.exp ((Real.pi : ℂ) * Complex.I) = -1 ∧
      Complex.exp ((0 : ℂ) * Complex.I) = -1 ∧ Complex.exp (Real.pi * Complex.I) = -1)) := by
  sorry

/-- The CG Cayley matrix `C = [[I, −iS], [−iS, I]]` realizing the eigenspaces of the
Siegel `h` underlying AutomorphicFormsOnReductiveGroups §6.1's Hermitian datum. -/
def gsp4CayleyBasis : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℂ :=
  Matrix.fromBlocks 1 (-Complex.I • cgS.map (algebraMap ℝ ℂ)) (-Complex.I • cgS.map (algebraMap ℝ ℂ)) 1

example : gsp4CayleyBasis (Sum.inr 1) (Sum.inl 0) = -Complex.I := by
  sorry

example : (Matrix.fromBlocks (1 : Matrix (Fin 2) (Fin 2) ℂ)
    (Complex.I • cgS.map (algebraMap ℝ ℂ))
    (-Complex.I • cgS.map (algebraMap ℝ ℂ)) 1).det = 0 := by
  sorry

/-- The inverse Cayley matrix. -/
theorem cayleyInverse :
    gsp4CayleyBasis * ((1 / 2 : ℂ) • Matrix.fromBlocks 1 (Complex.I • cgS.map (algebraMap ℝ ℂ))
      (Complex.I • cgS.map (algebraMap ℝ ℂ)) 1) = 1 := by
  sorry

/-- The two block columns span the negative and positive `i` eigenspaces of the Siegel `h(i)`.
Their adjoint Hom blocks realize the supplied `pPlus` and `pMinus` as in README §5.16. -/
theorem cayleyHodgeLines (j : Fin 2) :
    Matrix.mulVec (cgJ.map (algebraMap ℝ ℂ)) (fun i ↦ gsp4CayleyBasis i (Sum.inl j)) =
        (-Complex.I) • (fun i ↦ gsp4CayleyBasis i (Sum.inl j)) ∧
      Matrix.mulVec (cgJ.map (algebraMap ℝ ℂ)) (fun i ↦ gsp4CayleyBasis i (Sum.inr j)) =
        Complex.I • (fun i ↦ gsp4CayleyBasis i (Sum.inr j)) := by
  sorry

/-- Complex conjugation exchanges Cayley columns, reverses their order and contributes `i`. -/
theorem cayleyConjugation (j : Fin 2) :
    (fun i ↦ star (gsp4CayleyBasis i (Sum.inl j))) = Complex.I • fun i ↦ gsp4CayleyBasis i (Sum.inr (Fin.rev j)) := by
  sorry

/-- In the CG realization of the supplied Siegel stabilizer,
`C⁻¹ k C = diag(SAS − iSBS, A + iB)` for `k = [[SAS, SB], [−BS, A]]`. -/
theorem gsp4CayleyAction (A B : Matrix (Fin 2) (Fin 2) ℝ) :
    let Sc := cgS.map (algebraMap ℝ ℂ)
    let Ac := A.map (algebraMap ℝ ℂ)
    let Bc := B.map (algebraMap ℝ ℂ)
    ((1 / 2 : ℂ) • Matrix.fromBlocks 1 (Complex.I • Sc) (Complex.I • Sc) 1) *
        (Matrix.fromBlocks (Sc * Ac * Sc) (Sc * Bc) (-(Bc * Sc)) Ac) * gsp4CayleyBasis =
      Matrix.fromBlocks (Sc * Ac * Sc - Complex.I • (Sc * Bc * Sc)) 0 0 (Ac + Complex.I • Bc) := by
  sorry

/-- The actual Cayley coordinate change, with a sign change on both angular coordinates. -/
def cgToCompact (χ : CGWeight) : CGWeight := (-χ.1, -χ.2.1, χ.1 + χ.2.1 + 2 * χ.2.2)

example : cgToCompact (0, -2, 1) = (0, 2, 0) := by
  sorry

example : cgToCompact (0, 0, 1) = (0, 0, 2) := by
  sorry

/-- The lower triangular roots become the positive compact-coordinate roots. -/
theorem gsp4CayleyCompactCoordinates :
    (Finset.univ.image fun i ↦ cgToCompact (-cgRoots i)) =
        ({(1, -1, 0), (0, 2, 0), (1, 1, 0), (2, 0, 0)} : Finset CGWeight) ∧
      (∑ i, cgToCompact (-cgRoots i)) = (4, 2, 0) ∧
      ∀ χ : CGWeight, ((-(cgToCompact χ).1, -(cgToCompact χ).2.1, (cgToCompact χ).2.2) : CGWeight) =
        cgToPilloni χ := by
  sorry

/-- Pilloni's lower-Borel positive roots `e₂−e₁, −2e₁+e₃,
−e₁−e₂+e₃, −2e₂+e₃` in parity coordinates are the negatives of the CG positive roots after
`(a,b;c) ↦ (a,b;a+b+2c)`, and `ρ = (−2, −1; 0)`. -/
theorem gsp4PilloniConvention :
    (Finset.univ.image fun i ↦ -cgToPilloni (cgRoots i)) =
        ({(-1, 1, 0), (-2, 0, 0), (-1, -1, 0), (0, -2, 0)} : Finset CGWeight) ∧
      (∑ i, -cgToPilloni (cgRoots i)) = (-4, -2, 0) := by
  sorry

end GenusTwo

section LocalNeatness

variable {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ))

/-- With `v(ℓ) = 1`, a root `λ` of a monic quartic congruent to
`(X − 1)⁴` modulo `ℓ` (the characteristic polynomial of an element of `Iw₁(v)`, absolutely
unramified) satisfies `v(λ − 1) ≥ 1/4`. -/
theorem localEigenvalueBound (ℓ : ℕ) (hℓ : v (ℓ : K) = 1) (f : Polynomial K) (hf : f.Monic)
    (hdeg : f.natDegree = 4) (hint : ∀ i, 0 ≤ v (f.coeff i))
    (hcong : ∀ i, 1 ≤ v ((f - (Polynomial.X - 1) ^ 4).coeff i)) (lam : K) (hlam : f.eval lam = 0) :
    ((1 / 4 : ℚ) : WithTop ℚ) ≤ v (lam - 1) := by
  sorry

/-- At odd residue characteristic, `−1` lies outside the positive-distance ball. -/
example (h₂ : v (2 : K) = 0) : v ((-1 : K) - 1) = 0 := by
  sorry

/-- At residue characteristic two, the distance bound permits the torsion eigenvalue `−1`. -/
example (h₂ : v (2 : K) = 1) : v ((-1 : K) - 1) = 1 := by
  sorry

/-- The units within `v(x − 1) ≥ 1/4` form a subgroup. -/
theorem localProductsBound (S : Set Kˣ) (hS : ∀ u ∈ S, ((1 / 4 : ℚ) : WithTop ℚ) ≤ v ((u : K) - 1)) :
    ∀ x ∈ Subgroup.closure S, ((1 / 4 : ℚ) : WithTop ℚ) ≤ v ((x : K) - 1) := by
  sorry

example [CharZero K] (h₇ : v (7 : K) = 1) (h₂ : v (2 : K) = 0) (h₃ : v (3 : K) = 0) :
    v ((8 : K) * (-6) - 1) = 2 := by
  sorry

example [CharZero K] (h₇ : v (7 : K) = 1) (h₂ : v (2 : K) = 0) (h₃ : v (3 : K) = 0) :
    v ((8 : K) / (-6) - 1) = 1 := by
  sorry

/-- The local torsion-free conclusion for a family of quartic eigenvalues. The all-places
restriction-of-scalars assembly is stated in the README. -/
theorem iwahoriNeat (ℓ : ℕ) (hℓ5 : 5 < ℓ) (hℓprime : ℓ.Prime) (hℓ : v (ℓ : K) = 1)
    (hprime : ∀ p : ℕ, p.Prime → p ≠ ℓ → v (p : K) = 0) [CharZero K]
    (S : Set Kˣ) (hS : ∀ u ∈ S, ∃ f : Polynomial K, f.Monic ∧ f.natDegree = 4 ∧ (∀ i, 0 ≤ v (f.coeff i)) ∧
      (∀ i, 1 ≤ v ((f - (Polynomial.X - 1) ^ 4).coeff i)) ∧ f.eval (u : K) = 0) :
    ∀ x ∈ Subgroup.closure S, IsOfFinOrder x → x = 1 := by
  sorry

/-- The subgroup generated by all eigenvalues of an invertible matrix, using units. -/
def eigenvalueGroup {n : Type*} [Fintype n] [DecidableEq n] (g : GL n K) : Subgroup Kˣ :=
  Subgroup.closure {u | g.val.charpoly.eval (u : K) = 0}

example : eigenvalueGroup (1 : GL (Fin 2) ℚ) = ⊥ := by
  sorry

example : eigenvalueGroup (1 : GL (Fin 0) ℚ) = ⊥ := by
  sorry

example : (eigenvalueGroup (-1 : GL (Fin 2) ℚ) : Set ℚˣ) = {1, -1} := by
  sorry

/-- Both diagonal eigenvalues have infinite order, but their product is torsion. -/
example (g : GL (Fin 2) ℚ) (hg : g.val = !![2, 0; 0, -(1 / 2)]) :
    (-1 : ℚˣ) ∈ eigenvalueGroup g := by
  sorry
end LocalNeatness

section AdelicNeat
variable {n : Type*} [Fintype n] [DecidableEq n]
  (Kℓ : Nat.Primes → Type) [∀ ℓ, Field (Kℓ ℓ)] [∀ ℓ, IsAlgClosed (Kℓ ℓ)]
  (ι : ∀ ℓ, AlgebraicClosure ℚ →+* Kℓ ℓ)

/-- Simultaneous-prime torsion intersection for a family in a faithful representation.
For a finite adele use its local matrices in the chosen algebraic closures. -/
def adelicNeat (Sg : Set Nat.Primes) (g : ∀ ℓ, GL n (Kℓ ℓ)) : Prop :=
  ∀ ζ : (AlgebraicClosure ℚ)ˣ, IsOfFinOrder ζ →
    (∀ ℓ ∉ Sg, Units.map (ι ℓ).toMonoidHom ζ ∈ eigenvalueGroup (g ℓ)) → ζ = 1

example : adelicNeat Kℓ ι ∅ (fun ℓ ↦ (1 : GL (Fin 2) (Kℓ ℓ))) := by
  sorry

example (Sg : Set Nat.Primes) :
    ¬ adelicNeat Kℓ ι Sg (fun ℓ ↦ (-1 : GL (Fin 2) (Kℓ ℓ))) := by
  sorry

/-- A rational invertible matrix satisfying the simultaneous condition is rationally neat. -/
theorem adelicNeatRational (Sg : Set Nat.Primes) (γ : GL n ℚ)
    (hγ : adelicNeat Kℓ ι Sg fun ℓ ↦ Matrix.GeneralLinearGroup.map
      ((ι ℓ).comp (algebraMap ℚ (AlgebraicClosure ℚ))) γ) :
    ∀ ζ : (AlgebraicClosure ℚ)ˣ, IsOfFinOrder ζ →
      ζ ∈ eigenvalueGroup (Matrix.GeneralLinearGroup.map
        (algebraMap ℚ (AlgebraicClosure ℚ)) γ) → ζ = 1 := by
  sorry

/-- Local conjugation preserves the generated eigenvalue groups. -/
theorem adelicNeatConjugate (Sg : Set Nat.Primes) (g h : ∀ ℓ, GL n (Kℓ ℓ)) :
    adelicNeat Kℓ ι Sg (fun ℓ ↦ h ℓ * g ℓ * (h ℓ)⁻¹) ↔ adelicNeat Kℓ ι Sg g := by
  sorry

/-- A prime-to-p neat family remains adelically neat after any p component is inserted. -/
theorem primeToPNeatInsert (p : Nat.Primes) (g : ∀ ℓ, GL n (Kℓ ℓ)) (gp : GL n (Kℓ p))
    (hg : adelicNeat Kℓ ι {p} g) : adelicNeat Kℓ ι ∅ (Function.update g p gp) := by
  sorry
end AdelicNeat

/-!
The remaining README targets include rational-weight descent, the geometric Mumford–Tate group
and connectedness/reductivity, Hodge genericity, uniqueness of the domain complex structure,
variations and their polarizations, filtration parabolics, compact duals and reflex-field
forms, integral Schubert geometry, type predicates and additional axioms, connected-datum lifts,
product reflex fields, distinguished data and their Levi quotients, Hilbert datum comparisons,
Siegel root/permutation and Kostant-sequence geometry, identification of the supplied compact
Cartan and its Lie group structure, and the global all-places Iwahori criterion. These use the
group, analytic or flag carriers specified in README.md.

In particular, the geometric definitions `mumfordTateGroup`, `hodgeGeneric`, `Variation`,
`VariationHom`, `RationalPolarizedVariation`, `polarizedIntegralVariation`, `filtrationParabolic`,
`parabolicTypeVariety`, `compactDual` and `schubertFamilies` remain README targets. So do
`preabelianType`, `PureDatum.AdditionalAxioms`, `PureDatum.IsPELType`, `distinguishedDatum`,
`hilbertDatum`, the supplied-datum comparison `hilbertStarDatum`, `kostantSequence` and
`gsp4CompactCartan`. The additional-axiom and type conclusions are
`sv2Star_indep`, `sv2Star_sv2`, `sv4_rationalHodge`, `additionalAxioms_iso`,
`additionalAxioms_prod`, `sv5_iff_anisotropic`, `pelType_iso`, `pelType_hodgeType`,
`pelType_sv4`, `pelType_ofDatum`, `exists_pureDatum_lift`, `reflexField_prod` and
`distinguishedDatum_levi`; their full carriers are not constructed by the coordinate statements above.
-/
end TauCetiRoadmap.ShimuraData

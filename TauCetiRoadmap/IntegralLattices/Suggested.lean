module

public import Mathlib
public import TauCeti.FieldTheory.SquareClassGroup.Basic
public import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic
public import TauCeti.LinearAlgebra.IntegralLattice.Gram
public import TauCeti.LinearAlgebra.IntegralLattice.Signature
public import TauCeti.LinearAlgebra.IntegralLattice.Unimodular
public import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Group
public import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Niemeier
public import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Minimum
public import TauCeti.LinearAlgebra.IntegralLattice.TwoElementary
public import TauCeti.LinearAlgebra.FiniteBilinearModule.GaussSum
public import TauCeti.LinearAlgebra.FiniteBilinearModule.OddCyclic.Basic
public import TauCeti.LinearAlgebra.FiniteBilinearModule.Dyadic.Cyclic
public import TauCeti.LinearAlgebra.FiniteBilinearModule.Dyadic.RankTwo.Basic
public import TauCeti.Geometry.Euclidean.Volume.OrthogonalGroup
public import TauCeti.Geometry.Manifold.Riemannian.Induced
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
public import TauCeti.NumberTheory.IntegralLattice.ClassNumber
public import TauCeti.NumberTheory.IntegralLattice.Genus
public import TauCeti.NumberTheory.QuadraticForm.OrthogonalGroup.Integral.CompactOpen
public import TauCeti.NumberTheory.QuadraticForm.OrthogonalGroup.FiniteAdelic
public import TauCeti.Topology.Algebra.RestrictedProduct.Diagonal

/-!
# Integral quadratic forms and lattices: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every other target, API list and Check is in `README.md` only.

The carrier is Tau Ceti's native `TauCeti.IntegralLattice V` (a full `Submodule ℤ V` in a rational
ambient space with a symmetric rational form integral on it), with its native dual, discriminant
group, half-norm discriminant forms, finite quadratic modules, Gauss-sum invariant `gaussSign`,
root lattices, Nikulin's generator decomposition
`FiniteQuadraticModule.exists_isometry_prod_pi_generators`, genus relation `SameGenus`, isometry
classes `IsometryQuotient` and class sets `genusClasses`. None of them is restated here.

The headline theorems stated here are: the adelic double-coset description of the classes in a
genus (4B); the determination of the genus of an even lattice by its signature and discriminant
form, Nikulin's Corollary 1.9.4 (5A); the choice-independence of `discr K(q_p)` with its dyadic
exception, Nikulin's existence theorem 1.10.1 with its strict corollary 1.10.2, his
primitive-embedding theorems 1.12.2 and 1.12.4 (5B, 5G), and the sufficiency half of his
`2`-elementary existence theorem 3.6.2 on Tau Ceti's own predicates (5J); the classification of
indefinite unimodular lattices of both parities (6A); the separation of the rank-24 lattices by
their root systems, for the lattices of two rootful rows whose root sublattices are their
displayed root lattices and for every rootful row lattice against the Leech lattice (6E); and the
comparison of the Riemannian volume of the bi-invariant metric `−tr(XY)/2` on `SO(n)` and `O(n)`
with Tau Ceti's Euclidean Haar measure of the orthogonal group and its volumes (7E).

Headline theorems of the roadmap that are **proved in Tau Ceti at the pin**, and so are consumed
rather than stated: Nikulin's Theorem 1.11.3
(`FiniteQuadraticModule.nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq`, 1H), Milgram's
theorem (`gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`, 1I), van der Blij's
congruence (`vanDerBlij`, 1L), Minkowski's second theorem
(`IsPosDef.prod_successiveMinimum_mul_pi_pow_le`, 2F), reduction theory and the finiteness of
positive definite classes (`IsMinkowskiReduced`, `exists_finset_forall_exists_gramMatrix_mem`,
`IsPosDef.finite_genusClasses`, 2G), the finite genus test
(`sameGenus_iff_localIntegralForm_equivalent_primeFactors`, 3F), class numbers (`classNumber`,
`properClassNumber`, 4A), the binary class-number finiteness
(`finite_genusClasses_of_finrank_eq_two`, 4E), the infinitude of the isometry group of an
indefinite lattice of rank at least 3 (`infinite_isometry_of_isIndefinite`, 4F), the necessity half
of Theorem 3.6.2 (`TwoElementaryLatticeWithInvariants.twoElementaryAdmissible`, 5J), the existence
of even unimodular positive definite lattices exactly in ranks divisible by 8
(`exists_isEven_isUnimodular_isPosDef_iff`, 6B), the classification of positive definite
unimodular lattices of rank at most 9 with the uniqueness of `E₈`
(`IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine`,
`IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven`, 6C), the rank-16 pair in one genus and
not isometric (`sameGenus_e8PowLattice_checkerboardPlusLattice`,
`isEmpty_isometry_e8PowLattice_checkerboardPlusLattice`, 6D), `|O(E₈)| = 696729600`
(`card_isometry_typeE₈RootLattice`, 6G), the failure of cancellation
(`nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice`, 6H), the masses with
`m⁺ = 2m` and the rank-0 and rank-1 values (`mass`, `properMass`, `properMass_eq_two_mul_mass`,
7A, 7G), the local density count with its stabilization and odd-prime values
(`Matrix.localDensityCount`, `Matrix.localDensity`, `localDensityCount_div_pow_of_det_ne_zero`,
`tendsto_localDensityCount_div_of_card_eq_two_mul_add_one`, `…_two_mul_add_two`, 7C), the
Euclidean volumes of `SO(n)` and `O(n)` (`specialOrthogonalGroupVolume_eq_prod`,
`orthogonalGroupVolume_eq_two_mul_specialOrthogonalGroupVolume`, 7E), and completeness of a
list of classes from the mass (`sum_inv_natCard_isometry_eq_mass_iff`, 9B).

The local stabilizers `K_p(L)`, their compact-open family, the finite adelic orthogonal group and
the local and adelic spinor norms are Tau Ceti's (`integralOrthogonalSubgroup`,
`OrthogonalCompactOpens.integral`, `finiteAdelicOrthogonal`, `localSpinorNormImage`,
`adelicSpinorNorm`), as are the Hilbert symbol `hilbertSymbol`, the orders `NumberFieldOrder` of
a number field with `Pic` and `NarrowPic`, and the odd-prime diagonalization of a localized
lattice; none of them is restated here.

Headline theorems that are **not statable at the pins**, and what each lacks:

* the Conway–Sloane genus symbol, the 2-adic symbol calculus, and the oddity formula and sign
  product conditions on a symbol (3E, 3G): no carrier for genus symbols; the Hilbert symbol the
  oddity formula uses is native;
* the proper-spinor-genus class group `J/(ℚˣ·J_L)` and the count of proper spinor genera (4C):
  the finite adelic square-class group relative to the local spinor images is native
  (`finiteAdelicSquareClasses`), but the diagonal of `ℚˣ` into it needs, inside the definition, the
  proof that a rational square class is a unit square class at almost every prime and that the
  unit square classes are the spinor image there, so the quotient has no carrier at the pin;
* the odd-prime value of the Gauss-sum invariant of `q_θ^{(p)}(p^k)` (1H): a statement about
  Tau Ceti's `oddCyclic`, which is a README target rather than a headline.

Nikulin's Proposition 1.15.1 (5I), a correspondence of gluing data used inside proofs, is a
`README.md` target rather than a headline.

The binary dictionary into `Pic 𝒪_Δ` and `NarrowPic 𝒪_Δ` (B2) and the ring class field of a
negative discriminant (B3) are proved in Tau Ceti at the pin, on its order
`TauCeti.QuadraticOrder.numberFieldOrder` of a nonsquare discriminant in the number field
`QuadraticAlgebra ℚ Δ 0` (`QuadraticAlgebra.instNumberField`):
`TauCeti.BinaryQuadraticForm.posDefProperClassEquivPic`,
`TauCeti.BinaryQuadraticForm.properClassEquivNarrowPic` and
`TauCeti.BinaryQuadraticForm.posDefProperClassEquivGal`, the last through ring-class
reciprocity `TauCeti.ClassFieldTheory.ringClassArtinEquiv`. They are not restated here.

Conventions follow `README.md`: the rational bilinear form is primary, its restriction to the
carrier is integral, even lattices correspond to `QuadraticForm ℤ L` through `polarBilin`, and
discriminant forms use the half-norm convention `q_L(x̄) = B(x,x)/2 mod ℤ`.
-/

@[expose] public section

namespace TauCetiRoadmap.IntegralLattices

open QuadraticMap MeasureTheory NumberField
open scoped Real
open TauCeti TauCeti.IntegralLattice

universe u v

/-! ## Layer 1: the generator decomposition data of a finite quadratic module (1G) -/

namespace FiniteQuadraticModule

/-- **Nikulin's primary generators** (Nikulin Proposition 1.8.1): the odd cyclic module
`q_θ^{(p)}(p^k)` for an odd prime `p`, the dyadic cyclic module `q_θ^{(2)}(2^k)` for `k ≥ 1`, and
the two dyadic rank-two modules `u^{(2)}(2^k)` and `v^{(2)}(2^k)`, as labels for a decomposition. -/
inductive NikulinGenerator where
  | oddCyclic (p k : ℕ) (hp : p.Prime) (hodd : Odd p) (θ : ℤ)
  | dyadicCyclic (k : ℕ) (hk : 0 < k) (θ : ℤ)
  | dyadicU (k : ℕ)
  | dyadicV (k : ℕ)

/-- Positive exponent and unit parameter: the generators that are nondegenerate and nonzero. -/
def NikulinGenerator.IsAdmissible : NikulinGenerator → Prop
  | .oddCyclic p k _ _ θ => 0 < k ∧ ¬ (p : ℤ) ∣ θ
  | .dyadicCyclic _ _ θ => Odd θ
  | .dyadicU k => 0 < k
  | .dyadicV k => 0 < k

/-- The prime at which a generator is primary. -/
def NikulinGenerator.prime : NikulinGenerator → ℕ
  | .oddCyclic p _ _ _ _ => p
  | .dyadicCyclic _ _ _ => 2
  | .dyadicU _ => 2
  | .dyadicV _ => 2

/-- The finite quadratic module of a generator: Tau Ceti's native `oddCyclic (p^k)`,
`dyadicCyclic k`, `dyadicU k` or `dyadicV k`. -/
noncomputable def NikulinGenerator.toFiniteQuadraticModule :
    NikulinGenerator → TauCeti.FiniteQuadraticModule.{0}
  | .oddCyclic p k _ hodd θ => TauCeti.FiniteQuadraticModule.oddCyclic (p ^ k) hodd.pow θ
  | .dyadicCyclic k hk θ =>
      haveI : NeZero k := ⟨hk.ne'⟩
      TauCeti.FiniteQuadraticModule.dyadicCyclic k θ
  | .dyadicU k => TauCeti.FiniteQuadraticModule.dyadicU k
  | .dyadicV k => TauCeti.FiniteQuadraticModule.dyadicV k

/-- **The Gram determinant of the minimal `p`-adic realization of a generator**: `⟨θ·p^k⟩` for
`q_θ^{(p)}(p^k)`, `⟨θ·2^k⟩` for `q_θ^{(2)}(2^k)`, `2^k·U` (determinant `−4^k`) for `u^{(2)}(2^k)`
and `2^k·!![2,1;1,2]` (determinant `3·4^k`) for `v^{(2)}(2^k)`. -/
def NikulinGenerator.realizationDet : NikulinGenerator → ℤ
  | .oddCyclic p k _ _ θ => θ * (p : ℤ) ^ k
  | .dyadicCyclic k _ θ => θ * 2 ^ k
  | .dyadicU k => -(4 ^ k)
  | .dyadicV k => 3 * 4 ^ k

/-- The orthogonal sum of a finite list of generators; the empty list gives the zero module. -/
noncomputable def orthogonalSumNikulinGenerators :
    List NikulinGenerator → TauCeti.FiniteQuadraticModule.{0}
  | [] => TauCeti.FiniteQuadraticModule.ofQuadraticMap
      (0 : QuadraticMap ℤ PUnit.{1} (AddCircle (1 : ℚ)))
  | g :: gs => g.toFiniteQuadraticModule.prod (orthogonalSumNikulinGenerators gs)

/-- A generator decomposition of a finite quadratic module (1G): a list of admissible generators
together with an isometry onto their orthogonal sum. The native
`exists_isometry_prod_pi_generators` produces one for every nondegenerate module. -/
structure NikulinDecomposition (A : TauCeti.FiniteQuadraticModule.{u}) where
  /-- The generators, as labels. -/
  generators : List NikulinGenerator
  /-- Each is nondegenerate and nonzero. -/
  admissible : ∀ g ∈ generators, g.IsAdmissible
  /-- The module is isometric to their orthogonal sum. -/
  isometry : A.Isometry (orthogonalSumNikulinGenerators generators)

/-- The `p`-primary component of a finite quadratic module: Tau Ceti's `restrict` to Mathlib's
`AddCommGroup.primaryComponent`. -/
noncomputable abbrev primaryComponent (A : TauCeti.FiniteQuadraticModule.{u}) (p : ℕ) :
    TauCeti.FiniteQuadraticModule.{u} :=
  A.restrict (AddCommGroup.primaryComponent A p)

/-- **Nikulin's `discr K(q_p)`, read off a generator decomposition.** The orthogonal sum of the
minimal realizations of the `p`-primary generators of `D` is a `p`-adic lattice `K(q_p)` of rank
`l(A_{q_p})` with discriminant form `q_p`; the value is the square class of the product of their
`realizationDet`s in `ℚ_p^*/(ℚ_p^*)²` (the product is nonzero for an admissible decomposition; the
other branch only makes the function total). It is a function of `q_p` alone only at odd `p`, and
at `p = 2` exactly when `q₂` has no summand `q_θ^{(2)}(2)` (Nikulin Theorem 1.9.1). -/
noncomputable def NikulinDecomposition.padicDiscriminant {A : TauCeti.FiniteQuadraticModule.{u}}
    (D : NikulinDecomposition A) (p : ℕ) [Fact p.Prime] : TauCeti.SquareClassGroup ℚ_[p] :=
  let d : ℤ := ((D.generators.filter fun g => g.prime = p).map
    NikulinGenerator.realizationDet).prod
  if h : d = 0 then TauCeti.squareClass (1 : ℚ_[p]ˣ)
  else TauCeti.squareClass (Units.mk0 (d : ℚ_[p]) (Int.cast_ne_zero.mpr h))

/-- **The dyadic alternative of Nikulin's condition (4)**: `q₂ ≅ q_θ^{(2)}(2) ⊕ q'` for some odd
`θ` and some `q'`. Condition (4) applies exactly when this fails. -/
def HasCyclicTwoSummand (A : TauCeti.FiniteQuadraticModule.{u}) : Prop :=
  ∃ (θ : ℤ) (A' : TauCeti.FiniteQuadraticModule.{0}),
    Odd θ ∧ Nonempty (A.Isometry ((TauCeti.FiniteQuadraticModule.dyadicCyclic 1 θ).prod A'))

end FiniteQuadraticModule

/-! ## Layer 4: the class set as an adelic double coset -/

section Layer4

open TauCeti.QuadraticMap

/-- The rational quadratic form `x ↦ xᵀGx` of an integral Gram matrix on the coordinate space. -/
noncomputable abbrev gramForm {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ) :
    QuadraticForm ℚ (Fin n → ℚ) :=
  Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℚ))

/-- **The stabilizer family of the lattice `ℤⁿ` (N0, 4B)**: Tau Ceti's integral compact-open
reference family of the standard basis, whose subgroup at `p` is the stabilizer `K_p` of
`ℤ_pⁿ` in `O(V_p)`, with the Spin references over it. -/
noncomputable abbrev gramIntegralFamily {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ)
    (hG : (gramForm G).Nondegenerate) : OrthogonalCompactOpens (gramForm G) :=
  OrthogonalCompactOpens.integral (gramForm G) hG (Pi.basisFun ℚ (Fin n))

/-- **The rational diagonal `O(V)(ℚ) → O(V)(𝔸_f)` (4B)**, assembled from Tau Ceti's base change
of rational isometries and the native fact that a rational isometry is integral at almost every
prime. -/
noncomputable def gramAdelicDiagonal {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ)
    (hG : (gramForm G).Nondegenerate) :
    orthogonalGroup (gramForm G) →* (gramIntegralFamily G hG).finiteAdelicOrthogonal :=
  letI : Invertible (2 : ℚ) := invertibleOfNonzero two_ne_zero
  rationalDiagonal (fun (p : Nat.Primes) => orthogonalGroupBaseChange (A := ℚ_[p]) (gramForm G))
    (gramIntegralFamily G hG).orthogonal (gramIntegralFamily G hG).eventually_orthogonal

/-- **Layer 4B, the class set as a double coset space.** For a nondegenerate symmetric integral
Gram matrix `G`, the classes in the genus of the lattice `ℤⁿ ⊆ ℚⁿ` with Gram matrix `G` (Tau
Ceti's `ofGramMatrix` on the standard basis, with its native `genusClasses`, the isometry classes
of the lattices on `ℚⁿ` in its genus `SameGenus`) are in bijection with the double cosets
`O(V)(ℚ) \\ O(V)(𝔸_f) / K_f`, `K_f = ∏_p K_p` the stabilizer of `ℤⁿ`, where `V = ℚⁿ` carries the
form of `G` and `O(V)` is the orthogonal group of `gramForm`, whose rational points are the
isometries of the bilinear form of `G`. The adele carrying `L` to `M` is assembled from local
isometries `L_p ≅ M_p`, and `M` lies in the rational class of `L` by Hasse–Minkowski, which is why
the double cosets live in `O(V)(𝔸_f)` for the one rational space `V` (O'Meara §§101–102). For
`⟨1⟩` every `K_p` is the whole `O(V_p) = {±1}`, the double coset space is a point and the genus is
one class; for the genus of `!![4,1;1,6]` it has two points. -/
theorem exists_genusClasses_equiv_doubleCoset {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ)
    (hs : G.IsSymm) (hG : (gramForm G).Nondegenerate) :
    Nonempty ((ofGramMatrix (Pi.basisFun ℚ (Fin n)) G hs).genusClasses ≃
      DoubleCoset.Quotient (Set.range (gramAdelicDiagonal G hG))
        (integralSubgroup (gramIntegralFamily G hG).orthogonal : Set _)) :=
  sorry

end Layer4

/-! ## Layer 5: Nikulin's existence theory -/

section Layer5

/-- **Layer 5A, Nikulin Corollary 1.9.4.** Two even nondegenerate integral lattices lie in one
genus (Tau Ceti's `SameGenus`: equal signatures and isometric integral localizations at every
prime) exactly when they have the same signature and isometric half-norm discriminant forms.
`E₈ ⊕ E₈` and `D₁₆⁺` have invariants `(16, 0, 0)` and lie in one genus; `I₈` and `E₈` have equal
signature and trivial discriminant group but `I₈` is odd, so evenness cannot be dropped. The
unimodular case is native (`sameGenus_iff_of_isUnimodular`). -/
theorem sameGenus_iff_of_isEven {V : Type u} {W : Type v} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup W] [Module ℚ W] (L : IntegralLattice V) (M : IntegralLattice W)
    [L.IsNondegenerate] [M.IsNondegenerate] (hL : L.IsEven) (hM : M.IsEven) :
    L.SameGenus M ↔
      L.signature = M.signature ∧
        Nonempty ((L.discriminantQuadraticModule hL).Isometry
          (M.discriminantQuadraticModule hM)) :=
  sorry

open FiniteQuadraticModule in
/-- **Layer 5B, choice-independence of `discr K(q_p)`, with its exception.** An even
nondegenerate lattice whose rank is `l(A_{q_p})` and whose discriminant form has `p`-primary part
isometric to `q_p` localizes at `p` to a minimal realization `K(q_p)`, so the square class of its
Gram determinant is `discr K(q_p)` computed from any generator decomposition `D` of `A`: at odd
`p` unconditionally, and at `p = 2` only when `q₂` has no summand `q_θ^{(2)}(2)` (Nikulin Theorem
1.9.1). Without the dyadic exception it is false: `⟨2⟩` and `⟨10⟩` realize one `q₂` in rank 1 with
determinants differing by the nonsquare `5`. -/
theorem IntegralLattice.padicDiscriminant_eq_squareClass_gramDet
    {V : Type u} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V) [L.IsNondegenerate]
    (A : TauCeti.FiniteQuadraticModule.{u}) (D : NikulinDecomposition A) (p : ℕ) [Fact p.Prime]
    (hp : p ≠ 2 ∨ ¬ HasCyclicTwoSummand (primaryComponent A 2))
    (hL : L.IsEven) {ι : Type*} [Fintype ι] [DecidableEq ι] (e : Module.Basis ι ℤ L.carrier)
    (hrank : Fintype.card ι = AddGroup.rank (primaryComponent A p))
    (hq : Nonempty (TauCeti.FiniteQuadraticModule.Isometry
      (primaryComponent (L.discriminantQuadraticModule hL) p) (primaryComponent A p))) :
    ∃ u : ℚ_[p]ˣ, (u : ℚ_[p]) = ((L.gramDet e : ℤ) : ℚ_[p]) ∧
      TauCeti.squareClass u = D.padicDiscriminant p := sorry

/-- **Nikulin Theorem 1.10.1, the four conditions** on `(t₊, t₋, q)`, one field per clause.
Conditions 3 and 4 apply only at the equality `t₊ + t₋ = l(A_{q_p})`; condition 4 additionally
switches off when `q₂` has a summand `q_θ^{(2)}(2)`; condition 3 carries the sign `(−1)^{t₋}` and
condition 4 allows either sign. `discr K(q_p)` is read off a generator decomposition `D` of `q`. -/
structure NikulinExistenceConditions (tp tm : ℕ) (q : FiniteQuadraticModule)
    (D : FiniteQuadraticModule.NikulinDecomposition q) : Prop where
  /-- (1) The signature is congruent to the Gauss-sum invariant mod 8. -/
  signature_congr : (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = q.gaussSign
  /-- (2) The rank is at least `l(A_q)`, Nikulin's least number of generators, which is Mathlib's
  `AddGroup.rank` of the finite group `A_q`; `t₊ ≥ 0` and `t₋ ≥ 0` are carried by `ℕ`. -/
  rank_le : AddGroup.rank q ≤ tp + tm
  /-- (3) At every odd prime where the rank meets `l(A_{q_p})`, the determinant square class is
  pinned, with the sign `(−1)^{t₋}`. -/
  odd_boundary : ∀ (p : ℕ) [Fact p.Prime], p ≠ 2 →
    tp + tm = AddGroup.rank (FiniteQuadraticModule.primaryComponent q p) →
    ∃ u : ℚ_[p]ˣ, (u : ℚ_[p]) = (((-1) ^ tm * (Nat.card q : ℤ) : ℤ) : ℚ_[p]) ∧
      TauCeti.squareClass u = D.padicDiscriminant p
  /-- (4) The dyadic clause, when the rank meets `l(A_{q₂})` and `q₂` has no summand
  `q_θ^{(2)}(2)`: `|A_q|` matches `discr K(q₂)` up to a sign that is not fixed. -/
  dyadic_boundary :
    tp + tm = AddGroup.rank (FiniteQuadraticModule.primaryComponent q 2) →
    ¬ FiniteQuadraticModule.HasCyclicTwoSummand (FiniteQuadraticModule.primaryComponent q 2) →
    ∃ (ε : ℤ) (u : ℚ_[2]ˣ), (ε = 1 ∨ ε = -1) ∧
      (u : ℚ_[2]) = ((ε * (Nat.card q : ℤ) : ℤ) : ℚ_[2]) ∧
        TauCeti.squareClass u = D.padicDiscriminant 2

/-- **The left-hand side of 5B**: an even nondegenerate lattice of signature `(t₊, t₋)` whose
half-norm discriminant quadratic module is isometric to `q`. -/
def EvenLatticeWithInvariants (tp tm : ℕ) (q : FiniteQuadraticModule) : Prop :=
  ∃ (L : IntegralLattice (Fin (tp + tm) → ℚ)) (hnd : L.IsNondegenerate) (hev : L.IsEven),
    L.signature = (tp, 0, tm) ∧
      Nonempty (letI := hnd; (L.discriminantQuadraticModule hev).Isometry q)

/-- **Layer 5B, Nikulin Theorem 1.10.1.** For nondegenerate `q` with a generator decomposition
`D`, an even lattice with invariants `(t₊, t₋, q)` exists exactly when the four conditions hold. -/
theorem exists_evenLattice_iff (tp tm : ℕ) (q : FiniteQuadraticModule)
    (hq : q.IsNondegenerate) (D : FiniteQuadraticModule.NikulinDecomposition q) :
    EvenLatticeWithInvariants tp tm q ↔ NikulinExistenceConditions tp tm q D :=
  sorry

/-- **Layer 5B, Nikulin Corollary 1.10.2**: under the strict inequality `t₊ + t₋ > l(A_q)`
conditions 1 and 2 suffice. -/
theorem exists_evenLattice_of_lt (tp tm : ℕ) (q : FiniteQuadraticModule)
    (hq : q.IsNondegenerate)
    (hsign : (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = q.gaussSign)
    (hrank : AddGroup.rank q < tp + tm) :
    EvenLatticeWithInvariants tp tm q :=
  sorry

/-- **A primitive embedding** of integral lattices (5F): an injective `ℚ`-linear map of the ambient
spaces that preserves the forms, carries `S` into `L`, and has saturated image in `L`, i.e. torsion-
free cokernel. -/
def IsPrimitiveEmbedding {V : Type u} {W : Type v} [AddCommGroup V] [Module ℚ V] [AddCommGroup W]
    [Module ℚ W] (S : IntegralLattice V) (L : IntegralLattice W) (f : V →ₗ[ℚ] W) : Prop :=
  Function.Injective f ∧ (∀ x y, L.form (f x) (f y) = S.form x y) ∧
    S.carrier.map (f.restrictScalars ℤ) ≤ L.carrier ∧
      ∀ w ∈ L.carrier, ∀ k : ℤ, k ≠ 0 → k • w ∈ S.carrier.map (f.restrictScalars ℤ) →
        w ∈ S.carrier.map (f.restrictScalars ℤ)

/-- **Layer 5G, Nikulin Theorem 1.12.2, (a) ⇔ (b).** An even nondegenerate lattice `S` of
signature `(t₊, t₋)` with `t₊ ≤ l₊` and `t₋ ≤ l₋` embeds primitively into some even unimodular
lattice of signature `(l₊, l₋)` exactly when an even lattice with invariants
`(l₊ − t₊, l₋ − t₋, −q_S)` exists; the orthogonal complement is that lattice. -/
theorem exists_primitiveEmbedding_iff {V : Type u} [AddCommGroup V] [Module ℚ V]
    [FiniteDimensional ℚ V] (S : IntegralLattice V) [S.IsNondegenerate] (hS : S.IsEven)
    (lp lm : ℕ) (hp : S.sigPos ≤ lp) (hm : S.sigNeg ≤ lm) :
    (∃ L : IntegralLattice (Fin (lp + lm) → ℚ), L.IsEven ∧ L.IsUnimodular ∧
        L.signature = (lp, 0, lm) ∧ ∃ f, IsPrimitiveEmbedding S L f) ↔
      EvenLatticeWithInvariants (lp - S.sigPos) (lm - S.sigNeg)
        (S.discriminantQuadraticModule hS).neg :=
  sorry

/-- **Layer 5G, Nikulin Theorem 1.12.4.** Every even nondegenerate lattice of signature
`(t₊, t₋)` embeds primitively into some even unimodular lattice of signature `(l₊, l₋)` exactly
when `l₊ − l₋ ≡ 0 (mod 8)`, `t₊ ≤ l₊`, `t₋ ≤ l₋` and `2(t₊ + t₋) ≤ l₊ + l₋`. For `t₊ = t₋ = 0`
it is the existence of an even unimodular lattice of signature `(l₊, l₋)`. -/
theorem forall_exists_primitiveEmbedding_iff (tp tm lp lm : ℕ) :
    (∀ (S : IntegralLattice (Fin (tp + tm) → ℚ)), S.IsNondegenerate → S.IsEven →
        S.signature = (tp, 0, tm) →
        ∃ L : IntegralLattice (Fin (lp + lm) → ℚ), L.IsEven ∧ L.IsUnimodular ∧
          L.signature = (lp, 0, lm) ∧ ∃ f, IsPrimitiveEmbedding S L f) ↔
      ((((lp : ℤ) - (lm : ℤ) : ℤ) : ZMod 8) = 0 ∧ tp ≤ lp ∧ tm ≤ lm ∧ 2 * (tp + tm) ≤ lp + lm) :=
  sorry

/-- **Layer 5J, the sufficiency half of Nikulin Theorem 3.6.2**, on Tau Ceti's predicates: when
the invariants `(δ; t₊, t₋, a)` satisfy Nikulin's seven conditions (`TwoElementaryAdmissible`), an
even nondegenerate `2`-elementary lattice of signature `(t₊, t₋)` with `A_S ≅ (ℤ/2)^a` and parity
`δ` exists (`TwoElementaryLatticeWithInvariants`). The necessity half is native
(`TwoElementaryLatticeWithInvariants.twoElementaryAdmissible`), as are the four boundary
witnesses that each of conditions 4 to 7 excludes. -/
theorem twoElementaryLatticeWithInvariants_of_twoElementaryAdmissible (δ : ZMod 2) (tp tm a : ℕ)
    (h : TwoElementaryAdmissible δ tp tm a) : TwoElementaryLatticeWithInvariants δ tp tm a :=
  sorry

end Layer5

/-! ## Layer 6: indefinite unimodular lattices and the rank-24 separation -/

section Layer6

/-- **Layer 6A, even indefinite unimodular uniqueness.** Two even unimodular indefinite integral
Gram matrices of equal signature are integrally equivalent
(`II_{t₊,t₋} ≅ U^{min(t₊,t₋)} ⊕ E₈(±1)^{|t₊−t₋|/8}`; Serre, *A Course in Arithmetic*, V.2.2;
Milnor–Husemoller, Chapter II). The definite analogue fails in rank 16. -/
theorem equivalent_of_isEven_unimodular_indefinite {n : ℕ} (G₁ G₂ : Matrix (Fin n) (Fin n) ℤ)
    (h₁s : G₁.IsSymm) (h₂s : G₂.IsSymm)
    (h₁e : ∀ i, 2 ∣ G₁ i i) (h₂e : ∀ i, 2 ∣ G₂ i i)
    (h₁u : G₁.det = 1 ∨ G₁.det = -1) (h₂u : G₂.det = 1 ∨ G₂.det = -1)
    (hp : sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigPos (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hn : sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigNeg (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hindef : 0 < sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ))) ∧
        0 < sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))) :
    (Matrix.toBilin' G₁).Equivalent (Matrix.toBilin' G₂) :=
  sorry

/-- **Layer 6A, odd indefinite unimodular uniqueness.** Two odd unimodular indefinite integral
Gram matrices of equal signature are integrally equivalent, both to
`I_{t₊,t₋} = ⟨1⟩^{t₊} ⊕ ⟨−1⟩^{t₋}` (Serre, V.2.2). A Gram matrix is odd exactly when one of its
diagonal entries is odd. `U` and `⟨1⟩ ⊕ ⟨−1⟩` show that parity cannot be dropped. -/
theorem equivalent_of_odd_unimodular_indefinite {n : ℕ} (G₁ G₂ : Matrix (Fin n) (Fin n) ℤ)
    (h₁s : G₁.IsSymm) (h₂s : G₂.IsSymm)
    (h₁o : ∃ i, ¬ 2 ∣ G₁ i i) (h₂o : ∃ i, ¬ 2 ∣ G₂ i i)
    (h₁u : G₁.det = 1 ∨ G₁.det = -1) (h₂u : G₂.det = 1 ∨ G₂.det = -1)
    (hp : sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigPos (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hn : sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigNeg (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hindef : 0 < sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ))) ∧
        0 < sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))) :
    (Matrix.toBilin' G₁).Equivalent (Matrix.toBilin' G₂) :=
  sorry

/-- **Layer 6E, the root system separates the rootful rank-24 lattices.** Let `N_r` be the
lattice of a row `r` of the rootful rank-24 table, glued from the orthogonal sum `R_r` of the
row's component root lattices. If the norm-2 vectors of `N_r` and of `N_s` span `R_r` and `R_s`,
then `N_r ≅ N_s` forces `r = s`. An isometry carries the span of the norm-2 vectors onto the
span of the norm-2 vectors (`Isometry.map_span_vectorsOfNorm`), so `R_r ≅ R_s`. The multiset of
components of an orthogonal sum of ADE root lattices is an isometry invariant: the summands are
spanned by the classes of roots under the equivalence generated by non-orthogonality, and an
irreducible summand is determined by its rank and its number of roots. The 23 displayed
multisets are pairwise distinct (`components_multiset_injective`). The hypotheses are native for
the rows other than `A₁²⁴`, `A₂¹²`, `D₄⁶` and `A₁₁ D₇ E₆` (`span_vectorsOfNorm_two_lattice_of_ne`).
The root count alone does not separate the rows: `D₁₆ E₈` and `E₈³` both have 720 roots. -/
theorem RootfulNiemeierType.eq_of_nonempty_isometry_lattice {r s : RootfulNiemeierType}
    (hr : Submodule.span ℤ ((fun x : r.lattice ↦ (x : ∀ i, Fin (r.componentType i).rank → ℚ)) ''
        r.lattice.vectorsOfNorm 2) = r.rootLattice.carrier)
    (hs : Submodule.span ℤ ((fun x : s.lattice ↦ (x : ∀ i, Fin (s.componentType i).rank → ℚ)) ''
        s.lattice.vectorsOfNorm 2) = s.rootLattice.carrier)
    (h : Nonempty (r.lattice.Isometry s.lattice)) : r = s :=
  sorry

/-- **Layer 6E, the Leech lattice is not a rootful row.** No lattice `N_r` of the rootful rank-24
table is isometric to Tau Ceti's Leech lattice: `N_r` contains the roots of its component root
lattices (`rootLattice_carrier_le_lattice_carrier`), while the Leech lattice has minimum 4 and no
vector of norm 2 (`vectorsOfNorm_two_leechLattice`). Both are even, unimodular, positive definite
and of rank 24, so they lie in one genus and no genus invariant separates them. -/
theorem RootfulNiemeierType.isEmpty_isometry_lattice_leechLattice (r : RootfulNiemeierType) :
    IsEmpty (r.lattice.Isometry leechLattice) :=
  sorry

end Layer6

/-! ## Layer 7: the archimedean factor, as a Riemannian volume -/

section ArchimedeanVolume

namespace Archimedean

open Bundle Manifold
open scoped Manifold

noncomputable section

/-- The native real special orthogonal group. -/
abbrev SO (n : ℕ) := Matrix.specialOrthogonalGroup (Fin n) ℝ

/-- The native real orthogonal group. -/
abbrev O (n : ℕ) := Matrix.orthogonalGroup (Fin n) ℝ

/-- Entrywise coordinates divided by `√2`: the Euclidean metric they induce is `−tr(XY)/2` on
skew tangent matrices, so each `E_ij − E_ji`, `i < j`, has norm 1. -/
def skewMetricCoordinates (n : ℕ) (A : Matrix (Fin n) (Fin n) ℝ) :
    EuclideanSpace ℝ (Fin n × Fin n) :=
  WithLp.toLp 2 (fun ij => A ij.1 ij.2 / Real.sqrt 2)

/-- The coordinate embedding of `SO(n)`. -/
def soCoordinates (n : ℕ) (g : SO n) : EuclideanSpace ℝ (Fin n × Fin n) :=
  skewMetricCoordinates n (g : Matrix (Fin n) (Fin n) ℝ)

/-- The coordinate embedding of `O(n)`. -/
def oCoordinates (n : ℕ) (g : O n) : EuclideanSpace ℝ (Fin n × Fin n) :=
  skewMetricCoordinates n (g : Matrix (Fin n) (Fin n) ℝ)

section Geometry
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- The native Riemannian measure of the Euclidean metric induced on `SO(n)` by its coordinate
embedding, for a `C¹` manifold structure in which that embedding is an immersion. -/
def soEuclideanMeasure (n : ℕ) [ChartedSpace E (SO n)]
    [IsManifold 𝓘(ℝ, E) 1 (SO n)] [LindelofSpace (SO n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (soCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (soCoordinates n) g)) :
    Measure (SO n) :=
  let g := (TauCeti.inducedRiemannianMetric (n := 0) (soCoordinates n) hf hinj).toContinuousRiemannianMetric
  letI : RiemannianBundle (fun x : SO n => TangentSpace 𝓘(ℝ, E) x) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContinuousRiemannianBundle E (fun x : SO n => TangentSpace 𝓘(ℝ, E) x) :=
    inferInstance
  TauCeti.riemannianVolume 𝓘(ℝ, E) (SO n)

/-- **Layer 7E, the Riemannian volume of `SO(n)`**: in the bi-invariant metric `−tr(XY)/2` the
total Riemannian volume of `SO(n)` is Tau Ceti's `specialOrthogonalGroupVolume n`, the measure of
the determinant-one subset for the Euclidean Haar measure `orthogonalGroupMeasure n` of `O(n)`,
whose value `∏_{j=2}^{n} 2π^{j/2}/Γ(j/2)` is native (`specialOrthogonalGroupVolume_eq_prod`); so
`vol(SO(2)) = 2π` and `vol(SO(3)) = 8π²`. The comparison is the identification of the Riemannian
density of the fibration `SO(n) → S^{n−1}` with the sphere-by-fibre construction of the native
measure. -/
theorem soEuclideanMeasure_univ (n : ℕ) [ChartedSpace E (SO n)]
    [IsManifold 𝓘(ℝ, E) 1 (SO n)] [LindelofSpace (SO n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (soCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (soCoordinates n) g)) :
    soEuclideanMeasure n hf hinj Set.univ = ENNReal.ofReal (specialOrthogonalGroupVolume n) := by
  sorry

/-- The native Riemannian measure of the Euclidean metric induced on `O(n)` by its coordinate
embedding, for a `C¹` manifold structure in which that embedding is an immersion. -/
def oEuclideanMeasure (n : ℕ) [ChartedSpace E (O n)]
    [IsManifold 𝓘(ℝ, E) 1 (O n)] [LindelofSpace (O n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (oCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (oCoordinates n) g)) :
    Measure (O n) :=
  let g := (TauCeti.inducedRiemannianMetric (n := 0) (oCoordinates n) hf hinj).toContinuousRiemannianMetric
  letI : RiemannianBundle (fun x : O n => TangentSpace 𝓘(ℝ, E) x) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContinuousRiemannianBundle E (fun x : O n => TangentSpace 𝓘(ℝ, E) x) :=
    inferInstance
  TauCeti.riemannianVolume 𝓘(ℝ, E) (O n)

/-- **Layer 7E, the Riemannian measure of `O(n)` is the native Euclidean Haar measure.** The
Riemannian measure of the bi-invariant metric `−tr(XY)/2` on `O(n)` is Tau Ceti's
`orthogonalGroupMeasure n`: both are Haar measures of the compact group `O(n)`, and their total
masses agree, `vol(O(n)) = 2·vol(SO(n))` for `n ≥ 1` and `1` at `n = 0`
(`orthogonalGroupVolume_eq_two_mul_specialOrthogonalGroupVolume`), the two determinant
components being isometric by a reflection. -/
theorem oEuclideanMeasure_eq_orthogonalGroupMeasure (n : ℕ) [ChartedSpace E (O n)]
    [IsManifold 𝓘(ℝ, E) 1 (O n)] [LindelofSpace (O n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (oCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (oCoordinates n) g)) :
    oEuclideanMeasure n hf hinj = orthogonalGroupMeasure n := by
  sorry

end Geometry

end

end Archimedean

end ArchimedeanVolume

end TauCetiRoadmap.IntegralLattices

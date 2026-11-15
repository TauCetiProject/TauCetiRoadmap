module

public import Mathlib
public import TauCeti.FieldTheory.SquareClassGroup.Basic
public import TauCeti.LinearAlgebra.IntegralLattice.Characteristic.Basic
public import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic
public import TauCeti.LinearAlgebra.IntegralLattice.Gram
public import TauCeti.LinearAlgebra.IntegralLattice.Signature
public import TauCeti.LinearAlgebra.IntegralLattice.Unimodular
public import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Group
public import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeE.Basic
public import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Niemeier
public import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Minimum
public import TauCeti.LinearAlgebra.IntegralLattice.PosDef.SuccessiveMinima
public import TauCeti.LinearAlgebra.FiniteBilinearModule.GaussSum
public import TauCeti.LinearAlgebra.FiniteBilinearModule.OddCyclic.Basic
public import TauCeti.LinearAlgebra.FiniteBilinearModule.Dyadic.Cyclic
public import TauCeti.LinearAlgebra.FiniteBilinearModule.Dyadic.RankTwo.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Induced
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
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
root lattices and Nikulin's generator decomposition
`FiniteQuadraticModule.exists_isometry_prod_pi_generators`. None of them is restated here.

The headline theorems stated here are: Nikulin's classification of finite quadratic forms by
their bilinear form and Gauss-sum invariant, Theorem 1.11.3 (1H); van der Blij's congruence (1L)
and Milgram's theorem at every signature (1I); Minkowski's second theorem (2F) and finiteness of
positive definite classes (2G); the adelic double-coset description of the classes in a genus
(4B), finiteness of the classes in a binary genus (4E) and infinitude of the isometry group of
an indefinite lattice of rank at least 3 (4F); the determination of the genus of an even lattice
by its signature and discriminant form, Nikulin's Corollary 1.9.4 (5A); the choice-independence
of `discr K(q_p)` with its dyadic exception, Nikulin's existence theorem 1.10.1 with its strict
corollary 1.10.2, his primitive-embedding theorems 1.12.2 and 1.12.4, and his `2`-elementary
existence theorem 3.6.2 (5B, 5G, 5J); the classification of
indefinite unimodular lattices of both parities (6A), existence of even unimodular positive
definite lattices exactly in ranks divisible by 8 (6B), the classification of positive definite
unimodular lattices in rank at most 9 with the uniqueness of `E₈` (6C), the rank-16 pair
`E₈ ⊕ E₈` and `D₁₆⁺` in one genus and not isometric (6D) with the failure of cancellation built
on it (6H), the separation of the rank-24 lattices by their root systems, for the lattices of two
rootful rows whose root sublattices are their displayed root lattices and for every rootful row
lattice against the Leech lattice (6E), and `|O(E₈)| = 696729600` (6G); stabilization of the local density count at every
prime and its closed value at the odd primes not dividing the determinant (7C); the Euclidean
volumes of `SO(n)` and `O(n)` (7E); and completeness of a list of classes from the mass (9B).

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
* the binary dictionary into `Pic 𝒪_Δ` and `NarrowPic 𝒪_Δ` (B2) and the ring class field of a
  negative discriminant (B3): the quadratic algebra `QuadraticAlgebra ℚ Δ 0` is a field for
  nonsquare `Δ` at the pin, but it carries no `NumberField` instance and the order `ℤ[(Δ+√Δ)/2]`
  is not a `NumberFieldOrder` of it (its finite generation and full rank are proofs inside the
  definition), and no ring class field exists at the pin.

Nikulin's Proposition 1.15.1 (5I), a correspondence of gluing data used inside proofs, is a
`README.md` target rather than a headline.

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

/-! ## Layer 1: finite quadratic forms, the Gauss-sum invariant, and signature mod 8 -/

namespace IntegralLattice

variable {V : Type u} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)

/-- **Layer 1L, van der Blij's congruence.** For a nondegenerate **unimodular** lattice and any
characteristic vector `w` (Tau Ceti's `IsCharacteristicVector`),
`t₊ − t₋ ≡ β(w, w) (mod 8)`. The signature difference is taken in `ℤ`. At `w = 0` this recovers
`8 ∣ t₊ − t₋` for even unimodular lattices, and for `⟨1⟩` it is `w² ≡ 1 (mod 8)` for odd `w`.
Unimodularity is needed: for `⟨2⟩` every vector is characteristic, `t₊ − t₋ = 1`, and every
`β(w,w) = 2k²` is even (van der Blij 1959; Milnor–Husemoller, Appendix 4). -/
theorem vanDerBlij [FiniteDimensional ℚ V] [L.IsNondegenerate] (hU : L.IsUnimodular)
    {w : L} (hw : L.IsCharacteristicVector w) :
    Int.ModEq 8 ((L.sigPos : ℤ) - (L.sigNeg : ℤ)) (L.integralForm w w) := sorry

end IntegralLattice

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

/-- **Layer 1H, Nikulin Theorem 1.11.3.** Two nondegenerate finite quadratic modules whose
underlying bilinear modules are isometric are themselves isometric exactly when their Gauss-sum
invariants agree in `ℤ/8`. The dyadic modules `u^{(2)}(2)` and `v^{(2)}(2)` share the bilinear
module on `(ℤ/2)²` and have invariants `0` and `4`, so they are not isometric; `q_1^{(2)}(2)` and
`q_5^{(2)}(2)` are isometric with equal invariants. At odd `p` the bilinear module already
determines the quadratic one (Nikulin, §1, 11°). -/
theorem nonempty_isometry_iff_gaussSign_eq (q₁ q₂ : TauCeti.FiniteQuadraticModule.{u})
    (h₁ : q₁.IsNondegenerate) (h₂ : q₂.IsNondegenerate)
    (hb : Nonempty (q₁.toFiniteBilinearModule.Isometry q₂.toFiniteBilinearModule)) :
    Nonempty (q₁.Isometry q₂) ↔ q₁.gaussSign = q₂.gaussSign :=
  sorry

end FiniteQuadraticModule

section Layer1

variable {V : Type v} [AddCommGroup V] [Module ℚ V]

/-- **Layer 1I, Milgram's theorem at every signature.** For an even nondegenerate lattice the
signature difference is the Gauss-sum invariant of its discriminant form:
`t₊ − t₋ ≡ sign q_L (mod 8)`, where `∑_{γ ∈ A_L} e(q_L(γ)) = √|A_L| · e(sign q_L / 8)` (Nikulin
Theorem 1.3.3; Milnor–Husemoller, Appendix 4). For `⟨2⟩`: `A = ℤ/2`, `q = 1/4`, Gauss sum
`1 + i = √2 · e(1/8)`, and `t₊ − t₋ = 1`. -/
theorem milgram [FiniteDimensional ℚ V] (L : IntegralLattice V) [L.IsNondegenerate]
    (hL : L.IsEven) :
    ((((L.sigPos : ℤ) - (L.sigNeg : ℤ) : ℤ) : ZMod 8)) =
      (L.discriminantQuadraticModule hL).gaussSign :=
  sorry

end Layer1

/-! ## Gram-level vocabulary

Isometry, local isometry and genus membership of integral Gram matrices, used by the
class-number statements of Layers 2 and 4, the classification statements of Layer 6 and the
exhaustion theorem of Layer 9. -/

/-- **Isometry at the level of Gram matrices** (integral congruence by a matrix invertible over
`ℤ`). -/
def GramIsometric {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  ∃ P : Matrix (Fin n) (Fin n) ℤ, IsUnit P.det ∧ P.transpose * G * P = H

/-- **Local isometry at `p`** (3A, 3F): congruence over `ℤ_p`, by base change of the Gram matrix,
which keeps `p = 2` in scope. -/
def GramIsometricAt (p : ℕ) [Fact p.Prime] {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  ∃ P : Matrix (Fin n) (Fin n) ℤ_[p], IsUnit P.det ∧
    P.transpose * G.map (Int.cast : ℤ → ℤ_[p]) * P = H.map (Int.cast : ℤ → ℤ_[p])

/-- **Membership in one genus** (3F): congruence over every `ℤ_p` together with equality of the
real signature. -/
def GramSameGenus {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  (∀ (p : ℕ) [Fact p.Prime], GramIsometricAt p G H) ∧
    sigPos (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ)))
        = sigPos (Matrix.toQuadraticForm' (H.map (Int.cast : ℤ → ℝ))) ∧
      sigNeg (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ)))
        = sigNeg (Matrix.toQuadraticForm' (H.map (Int.cast : ℤ → ℝ)))

/-! ## Layer 2: Minkowski's second theorem and reduction -/

section Layer2

/-- **Layer 2F, Minkowski's second theorem.** For a positive definite integral lattice of rank
`n` with native successive minima `λ₁ ≤ … ≤ λₙ` (values of the norm `β x x`),
`vol(Bₙ) · ∏ λ_i^{1/2} ≤ 2ⁿ · (det L)^{1/2}`, where `Bₙ` is the Euclidean unit ball and
`(det L)^{1/2}` is the covolume of the real realization (Cassels, *An Introduction to the Geometry
of Numbers*, Chapter VIII). For `⟨a⟩` it is `2√a ≤ 2√a`. -/
theorem IntegralLattice.IsPosDef.volume_ball_mul_prod_sqrt_successiveMinimum_le
    {V : Type u} [AddCommGroup V] [Module ℚ V] {L : IntegralLattice V} (hL : L.IsPosDef) :
    (volume (Metric.ball (0 : EuclideanSpace ℝ (Fin (Module.finrank ℤ L))) 1)).toReal *
        ∏ i, Real.sqrt (L.successiveMinimum i) ≤
      2 ^ (Module.finrank ℤ L) * Real.sqrt (L.determinant) :=
  sorry

/-- **Layer 2G, reduction-theory finiteness**, the positive definite branch of class-number
finiteness: there are finitely many positive definite integral Gram matrices of given size and
determinant up to integral congruence. Every class contains a Minkowski-reduced Gram matrix, and
reduced matrices of bounded determinant have bounded entries. Definiteness is needed: the
argument has no indefinite analogue (`[0,1;1,2k]` is a Gram matrix of `U` for every `k`). -/
theorem finite_classes_of_posDef (n : ℕ) (d : ℤ) :
    ∃ S : Finset (Matrix (Fin n) (Fin n) ℤ), ∀ G : Matrix (Fin n) (Fin n) ℤ,
      G.IsSymm → (Matrix.toQuadraticForm' G).PosDef → G.det = d →
        ∃ H ∈ S, GramIsometric G H :=
  sorry

end Layer2

/-! ## Layer 4: the class set as an adelic double coset, and the binary class-number branch -/

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
Gram matrix `G`, the classes in the genus of `G` correspond to the double cosets
`O(V)(ℚ) \ O(V)(𝔸_f) / K_f`, `K_f = ∏_p K_p` the stabilizer of `ℤⁿ`: there is a map from the
Gram matrices in the genus of `G` onto the double coset space whose fibres are exactly the
integral isometry classes. The adele carrying `G` to `H` is assembled from local isometries
`L_p ≅ M_p`, and `H` lies in the rational class of `G` by Hasse–Minkowski, which is why the double
cosets live in `O(V)(𝔸_f)` for the one rational space `V` (O'Meara §§101–102). For `⟨1⟩` every
`K_p` is the whole `O(V_p) = {±1}`, the double coset space is a point and the genus is one class;
for the genus of `!![4,1;1,6]` it has two points. -/
theorem exists_genusClasses_equiv_doubleCoset {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ)
    (hs : G.IsSymm) (hG : (gramForm G).Nondegenerate) :
    ∃ f : {H : Matrix (Fin n) (Fin n) ℤ // H.IsSymm ∧ GramSameGenus G H} →
        DoubleCoset.Quotient (Set.range (gramAdelicDiagonal G hG))
          (integralSubgroup (gramIntegralFamily G hG).orthogonal : Set _),
      Function.Surjective f ∧ ∀ H H', f H = f H' ↔ GramIsometric H.1 H'.1 :=
  sorry

/-- **Layer 4E, rank 2.** For a nondegenerate binary lattice the classes in a genus are finitely
many: they inject into the invertible proper ideal classes of the quadratic order of B1 (finite by
`finite_pic` and `finite_narrowPic` of Global Number Fields), and in the square-discriminant
branch B5 counts the split classes directly. Indefiniteness is not a hypothesis; the definite
case agrees with `finite_classes_of_posDef`. The rank-`≥ 3` indefinite statement rests on
Eichler's theorem and belongs to `OrthogonalTamagawaAndLatticeMass`. -/
theorem finite_genusClasses_rank_two (G : Matrix (Fin 2) (Fin 2) ℤ)
    (hs : G.IsSymm) (hd : G.det ≠ 0) :
    ∃ S : Finset (Matrix (Fin 2) (Fin 2) ℤ), ∀ H : Matrix (Fin 2) (Fin 2) ℤ,
      H.IsSymm → GramSameGenus G H → ∃ H' ∈ S, GramIsometric H' H :=
  sorry

/-- **Layer 4F, automorphism groups of indefinite lattices.** A nondegenerate indefinite
integral lattice of rank at least 3 has infinite isometry group: in the isotropic case the
Eichler transvections `E_{u,w}` in a primitive isotropic `u` and the even-norm vectors `w` of
`u^⊥ ∩ L` give an injective image of a free group of rank `rank L − 2 ≥ 1`, and in the anisotropic
case an indefinite binary sublattice has infinite isometry group by the Pell equation (B4) and a
finite-index subgroup of `O(M) × O(M^⊥)` embeds in `O(L)`. Rank 2 is excluded and is B4's:
`O(⟨1⟩ ⊕ ⟨−2⟩)` is infinite through `ℤ[√2]ˣ`, while `O(⟨1⟩ ⊕ ⟨−1⟩)` is finite because the split
order has finitely many units; `x² + y² − 3z²` is indefinite and anisotropic over `ℚ`, so the
isotropic argument alone does not cover rank 3. -/
theorem infinite_isometry_of_isIndefinite {V : Type u} [AddCommGroup V] [Module ℚ V]
    (L : IntegralLattice V) [L.IsNondegenerate] (hL : L.IsIndefinite)
    (hr : 3 ≤ Module.finrank ℚ V) : Infinite (L.Isometry L) :=
  sorry

end Layer4

/-! ## Layer 5: Nikulin's existence theory -/

section Layer5

/-- **Layer 5A, Nikulin Corollary 1.9.4, at the level of Gram matrices.** Two even
nondegenerate integral Gram matrices of one size lie in one genus exactly when the lattices
they define on `ℚⁿ` have the same signature and isometric half-norm discriminant forms. The
lattices are Tau Ceti's `ofGramMatrix` on the standard basis, so evenness and nondegeneracy are
hypotheses on those lattices. `E₈ ⊕ E₈` and `D₁₆⁺` have invariants `(16, 0, 0)` and lie in one
genus; `I₈` and `E₈` have equal signature and trivial discriminant group but `I₈` is odd, so
evenness cannot be dropped. -/
theorem gramSameGenus_iff_of_isEven {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ)
    (hGs : G.IsSymm) (hHs : H.IsSymm)
    (hGe : (ofGramMatrix (Pi.basisFun ℚ (Fin n)) G hGs).IsEven)
    (hHe : (ofGramMatrix (Pi.basisFun ℚ (Fin n)) H hHs).IsEven)
    [(ofGramMatrix (Pi.basisFun ℚ (Fin n)) G hGs).IsNondegenerate]
    [(ofGramMatrix (Pi.basisFun ℚ (Fin n)) H hHs).IsNondegenerate] :
    GramSameGenus G H ↔
      (ofGramMatrix (Pi.basisFun ℚ (Fin n)) G hGs).signature =
          (ofGramMatrix (Pi.basisFun ℚ (Fin n)) H hHs).signature ∧
        Nonempty (((ofGramMatrix (Pi.basisFun ℚ (Fin n)) G hGs).discriminantQuadraticModule
          hGe).Isometry
            ((ofGramMatrix (Pi.basisFun ℚ (Fin n)) H hHs).discriminantQuadraticModule hHe)) :=
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

/-- **Nikulin Theorem 3.6.2, the seven conditions** for an even `2`-elementary lattice with
invariants `(δ_S; t₊, t₋, a)`, one field per clause. -/
structure TwoElementaryAdmissible (δ : ZMod 2) (tp tm a : ℕ) : Prop where
  /-- (1) `a ≤ t₊ + t₋`. -/
  le_rank : a ≤ tp + tm
  /-- (2) `t₊ + t₋ + a ≡ 0 (mod 2)`. -/
  parity : ((tp + tm + a : ℕ) : ZMod 2) = 0
  /-- (3) `t₊ − t₋ ≡ 0 (mod 4)` when `δ_S = 0`. -/
  four_of_delta_zero : δ = 0 → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 4) = 0
  /-- (4) `δ_S = 0` and `t₊ − t₋ ≡ 0 (mod 8)` when `a = 0`. -/
  unimodular_of_a_zero : a = 0 → δ = 0 ∧ (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 0
  /-- (5) `t₊ − t₋ ≡ ±1 (mod 8)` when `a = 1`. -/
  pm_one_of_a_one : a = 1 →
    (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 1 ∨ (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = -1
  /-- (6) `δ_S = 0` when `a = 2` and `t₊ − t₋ ≡ 4 (mod 8)`. -/
  delta_zero_of_a_two : a = 2 → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 4 → δ = 0
  /-- (7) `t₊ − t₋ ≡ 0 (mod 8)` when `δ_S = 0` and `a = t₊ + t₋`. -/
  eight_of_a_eq_rank : δ = 0 → a = tp + tm → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 0

/-- **The left-hand side of 5J**: an even nondegenerate `2`-elementary lattice of signature
`(t₊, t₋)` with `A_S ≅ (ℤ/2)^a`, where `δ_S = 0` exactly when the half-norm discriminant form
takes values in `½ℤ/ℤ`. -/
def TwoElementaryLatticeWithInvariants (δ : ZMod 2) (tp tm a : ℕ) : Prop :=
  ∃ (L : IntegralLattice (Fin (tp + tm) → ℚ)) (_hnd : L.IsNondegenerate) (hev : L.IsEven),
    L.signature = (tp, 0, tm) ∧
      Nonempty (L.DiscriminantGroup ≃+ (Fin a → ZMod 2)) ∧
        (δ = 0 ↔ ∀ x : L.DiscriminantGroup,
          L.discriminantQuadraticMap hev x + L.discriminantQuadraticMap hev x = 0)

/-- **Layer 5J, the existence half of Nikulin Theorem 3.6.2.** -/
theorem exists_twoElementaryLattice_iff (δ : ZMod 2) (tp tm a : ℕ) :
    TwoElementaryLatticeWithInvariants δ tp tm a ↔ TwoElementaryAdmissible δ tp tm a :=
  sorry

end Layer5

/-! ## Layer 6: unimodular lattices in low rank -/

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

/-- **Layer 6B, existence in the definite case.** An even unimodular positive definite lattice of
rank `n` exists exactly when `8 ∣ n` (existence: Serre's `Γ₈ = E₈` of V.1.4.3 and the remark after
V.2 Theorem 2; necessity: Corollary 2 of that theorem, Milgram's theorem). Rank 0 is included: the
zero lattice is even, unimodular and positive definite. -/
theorem exists_isEven_isUnimodular_isPosDef_iff (n : ℕ) :
    (∃ L : IntegralLattice (Fin n → ℚ), L.IsEven ∧ L.IsUnimodular ∧ L.IsPosDef) ↔ 8 ∣ n :=
  sorry

/-- **Layer 6C, uniqueness of `E₈`.** Every even unimodular positive definite lattice of rank 8 is
isometric to Tau Ceti's `E₈` root lattice (O'Meara 106:13). `I₈` is unimodular, positive definite
and odd, so evenness is needed. -/
theorem nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight
    {V : Type u} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)
    (hV : Module.finrank ℚ V = 8) (he : L.IsEven) (hu : L.IsUnimodular) (hp : L.IsPosDef) :
    Nonempty (L.Isometry typeE₈RootLattice) :=
  sorry

/-- **Layer 6C, odd unimodular lattices of rank at most 8.** An odd unimodular positive definite
integral Gram matrix of size at most 8 is integrally equivalent to the identity, that is, the
lattice is `Iₙ` (O'Meara 106:13). In size 9 the odd lattice `E₈ ⊕ I₁` is a second class. -/
theorem equivalent_one_of_odd_unimodular_posDef_of_le_eight {n : ℕ} (hn : n ≤ 8)
    (G : Matrix (Fin n) (Fin n) ℤ) (hs : G.IsSymm) (hodd : ∃ i, ¬ 2 ∣ G i i)
    (hu : G.det = 1) (hp : (Matrix.toQuadraticForm' G).PosDef) :
    (Matrix.toBilin' G).Equivalent (Matrix.toBilin' (1 : Matrix (Fin n) (Fin n) ℤ)) :=
  sorry

/-- **Layer 6C, rank 9.** A unimodular positive definite integral Gram matrix of size 9 is
integrally equivalent to `I₉` or to the block sum of the `E₈` Cartan matrix and `I₁`
(O'Meara 106:13). The two are distinct: `E₈ ⊕ I₁` has 2 vectors of norm 1 and `I₉` has 18. -/
theorem equivalent_one_or_e8_sum_one_of_unimodular_posDef_nine
    (G : Matrix (Fin 9) (Fin 9) ℤ) (hs : G.IsSymm) (hu : G.det = 1)
    (hp : (Matrix.toQuadraticForm' G).PosDef) :
    (Matrix.toBilin' G).Equivalent (Matrix.toBilin' (1 : Matrix (Fin 9) (Fin 9) ℤ)) ∨
      (Matrix.toBilin' G).Equivalent (Matrix.toBilin'
        (Matrix.reindex finSumFinEquiv finSumFinEquiv
          (Matrix.fromBlocks (CartanMatrix.E 8) 0 0 (1 : Matrix (Fin 1) (Fin 1) ℤ)))) :=
  sorry

/-- **A Gram matrix of `D₁₆⁺`** (6D), in the basis `h, e₁ − e₂, e₂ − e₃, …, e₁₄ − e₁₅, e₁₄ + e₁₅`
of `D₁₆⁺ = D₁₆ ∪ (h + D₁₆)` with `h = (½, …, ½)`: the diagonal is `4, 2, …, 2`, the fifteen
norm-2 vectors form the `D₁₅` diagram (the chain `e₁ − e₂, …, e₁₄ − e₁₅` with `e₁₄ + e₁₅`
attached to `e₁₃ − e₁₄`: `(e₁₃ − e₁₄)·(e₁₄ + e₁₅) = −1` and `(e₁₄ − e₁₅)·(e₁₄ + e₁₅) = 0`),
`h` pairs to `1` with `e₁₄ + e₁₅` and to `0` with the chain, and the determinant is `1`, so the
sixteen vectors generate `D₁₆⁺` (Serre V.1.4.3, where the lattice is `Γ₁₆`). -/
def d16PlusGram : Matrix (Fin 16) (Fin 16) ℤ :=
  !![4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1;
     0, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, -1, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, -1, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, -1, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, -1, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, -1, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, -1, 2, -1, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, -1, 2, -1, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -1, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -1, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -1, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -1, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -1, -1;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, 0;
     1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 2]

/-- **The Gram matrix of `E₈ ⊕ E₈`** (6D): the block sum of two copies of Mathlib's `E₈` Cartan
matrix, reindexed to `Fin 16`. -/
def e8SumE8Gram : Matrix (Fin 16) (Fin 16) ℤ :=
  Matrix.reindex finSumFinEquiv finSumFinEquiv
    (Matrix.fromBlocks (CartanMatrix.E 8) 0 0 (CartanMatrix.E 8))

/-- **Layer 6D, the rank-16 pair.** `D₁₆⁺` is even, unimodular and positive definite, it lies in
the genus of `E₈ ⊕ E₈` (both have invariants `(16, 0, 0)`, 5A), and the two are not integrally
isometric: the norm-2 vectors of `D₁₆⁺` are the 480 roots of `D₁₆` and span a sublattice of
index 2, while the 480 roots of `E₈ ⊕ E₈` span everything (Serre V.1.4.3 and VII.6.6). At
`n = 8` the same construction gives `D₈⁺ ≅ E₈`, so the rank enters through `h² = 4`. -/
theorem d16Plus_sameGenus_not_isometric_e8SumE8 :
    (∀ i, 2 ∣ d16PlusGram i i) ∧ d16PlusGram.det = 1 ∧
      (Matrix.toQuadraticForm' d16PlusGram).PosDef ∧
        GramSameGenus e8SumE8Gram d16PlusGram ∧ ¬ GramIsometric e8SumE8Gram d16PlusGram :=
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

/-- **Layer 6H, the failure of cancellation over `ℤ`.** `E₈ ⊕ E₈ ⊕ U` and `D₁₆⁺ ⊕ U` are
integrally isometric, both being even unimodular indefinite of signature `(17, 1)` (6A), although
`E₈ ⊕ E₈` and `D₁₆⁺` are not (6D). Dropping `U` would contradict 6D; `U ⊕ ⟨1⟩ ≅ I_{2,1}` while
`U ≇ ⟨1⟩ ⊕ ⟨−1⟩` is the parity analogue. -/
theorem gramIsometric_e8SumE8_sum_U_d16Plus_sum_U :
    GramIsometric
      (Matrix.reindex finSumFinEquiv finSumFinEquiv
        (Matrix.fromBlocks e8SumE8Gram 0 0 !![0, 1; 1, 0]))
      (Matrix.reindex finSumFinEquiv finSumFinEquiv
        (Matrix.fromBlocks d16PlusGram 0 0 !![0, 1; 1, 0])) :=
  sorry

/-- **Layer 6G, the order of `O(E₈)`.** The isometry group of Tau Ceti's `E₈` root lattice has
order `240 · 126 · 23040 = 696729600`: it is the Weyl group, generated by the reflections in the
240 roots, which contains `−1`. -/
theorem natCard_isometry_typeE₈RootLattice :
    Nat.card (typeE₈RootLattice.Isometry typeE₈RootLattice) = 696729600 :=
  sorry

end Layer6

/-! ## Layer 7: local densities and the archimedean factor -/

section Layer7

/-- **The congruence count of 7C**: the number of `X ∈ Mₙ(ℤ/p^r)` with `Xᵀ A X ≡ A (mod p^r)`,
the bilinear count whose normalized limit is the local density `α_p`. -/
noncomputable def localDensityCount (p : ℕ) {n : ℕ} (A : Matrix (Fin n) (Fin n) ℤ) (r : ℕ) : ℕ :=
  Nat.card {X : Matrix (Fin n) (Fin n) (ZMod (p ^ r)) //
    X.transpose * A.map (Int.cast : ℤ → ZMod (p ^ r)) * X = A.map (Int.cast : ℤ → ZMod (p ^ r))}

/-- **Layer 7C, stabilization of the local density count.** For a nondegenerate symmetric
integral `A` of size `n` and every prime `p`, `p = 2` included, the count grows by exactly
`p^{n(n−1)/2}` from each level to the next once `r` is large, so
`α_p(A) = lim p^{−r·n(n−1)/2}·#{X mod p^r : XᵀAX ≡ A}` exists. For `U` at `p = 2` the count is
`2^{r+2}` for `r ≥ 2` and `α_2(U) = 4`. -/
theorem localDensityCount_succ_eq (p : ℕ) [Fact p.Prime] {n : ℕ} (A : Matrix (Fin n) (Fin n) ℤ)
    (hA : A.IsSymm) (hdet : A.det ≠ 0) :
    ∃ r₀ : ℕ, ∀ r ≥ r₀,
      localDensityCount p A (r + 1) = p ^ (n * (n - 1) / 2) * localDensityCount p A r :=
  sorry

/-- **Layer 7C, the value at an odd prime not dividing the determinant.** For odd `p ∤ det A`
and `n ≥ 1` the count is, from some level on, `p^{r·n(n−1)/2}` times
`2 ∏_{i=1}^{m} (1 − p^{−2i})` when `n = 2m + 1`, and times
`2 (1 − ε p^{−m}) ∏_{i=1}^{m−1} (1 − p^{−2i})` when `n = 2m`, where `ε = ((−1)^m det A | p)` is
the Legendre symbol of the signed determinant, the split/nonsplit type of the reduction. For `U`
at `p = 3` the count is `4` at level 1 and `12` at level 2, both `4/3 = 2(1 − 1/3)` normalized,
with `ε = (1 | 3) = 1` although `det U = −1` is a nonsquare mod 3; for `I₂` at `p = 3` it is
`8/3 = 2(1 + 1/3)` with `ε = (−1 | 3) = −1`, and at `p = 5` it is `8/5` with `ε = 1`. Rank 0 is
excluded: its count is `1` and has no factor `2`. -/
theorem localDensityCount_eq_of_odd_of_not_dvd (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {n : ℕ}
    (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.IsSymm) (hdet : ¬ (p : ℤ) ∣ A.det) (hn : 0 < n) :
    ∃ r₀ : ℕ, ∀ r ≥ r₀,
      (localDensityCount p A r : ℚ) = (p : ℚ) ^ (r * (n * (n - 1) / 2)) *
        (if n % 2 = 1 then
          2 * ∏ i ∈ Finset.Icc 1 (n / 2), (1 - (p : ℚ) ^ (-(2 * (i : ℤ))))
         else
          2 * (1 - (legendreSym p ((-1) ^ (n / 2) * A.det) : ℚ) * (p : ℚ) ^ (-((n / 2 : ℕ) : ℤ))) *
            ∏ i ∈ Finset.Icc 1 (n / 2 - 1), (1 - (p : ℚ) ^ (-(2 * (i : ℤ))))) :=
  sorry

end Layer7

section ArchimedeanVolume

namespace Archimedean

open Bundle Manifold
open scoped Manifold

noncomputable section

/-- The total area `2π^{j/2}/Γ(j/2)` of the round `(j−1)`-sphere, for `j ≥ 1`. -/
def sphereArea (j : ℕ) : ℝ :=
  2 * Real.pi ^ ((j : ℝ) / 2) / Real.Gamma ((j : ℝ) / 2)

/-- The Euclidean volume `∏_{j=2}^{n} vol(S^{j−1})` of `SO(n)` in the metric `−tr(XY)/2`, with
empty products at `n = 0` and `n = 1`. -/
def orthogonalSkewBasisVolume (n : ℕ) : ℝ :=
  ∏ j ∈ Finset.Icc 2 n, sphereArea j

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
    [IsManifold 𝓘(ℝ, E) 1 (SO n)]
    [MeasurableSpace (SO n)] [BorelSpace (SO n)] [LindelofSpace (SO n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (soCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (soCoordinates n) g)) :
    Measure (SO n) :=
  let g := (TauCeti.inducedRiemannianMetric (n := 0) (soCoordinates n) hf hinj).toContinuousRiemannianMetric
  letI : RiemannianBundle (fun x : SO n => TangentSpace 𝓘(ℝ, E) x) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContinuousRiemannianBundle E (fun x : SO n => TangentSpace 𝓘(ℝ, E) x) :=
    inferInstance
  TauCeti.riemannianVolume 𝓘(ℝ, E) (SO n)

/-- **Layer 7E, the Euclidean volume of `SO(n)`**: in the metric `−tr(XY)/2`,
`vol(SO(n)) = ∏_{j=2}^{n} 2π^{j/2}/Γ(j/2)`, so `vol(SO(2)) = 2π` and `vol(SO(3)) = 8π²`; it is
proved from the fibration `SO(n)/SO(n−1) ≅ S^{n−1}`. -/
theorem soEuclideanMeasure_univ (n : ℕ) [ChartedSpace E (SO n)]
    [IsManifold 𝓘(ℝ, E) 1 (SO n)]
    [MeasurableSpace (SO n)] [BorelSpace (SO n)] [LindelofSpace (SO n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (soCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (soCoordinates n) g)) :
    soEuclideanMeasure n hf hinj Set.univ = ENNReal.ofReal (orthogonalSkewBasisVolume n) := by
  sorry

/-- The native Riemannian measure of the Euclidean metric induced on `O(n)` by its coordinate
embedding, for a `C¹` manifold structure in which that embedding is an immersion. -/
def oEuclideanMeasure (n : ℕ) [ChartedSpace E (O n)]
    [IsManifold 𝓘(ℝ, E) 1 (O n)]
    [MeasurableSpace (O n)] [BorelSpace (O n)] [LindelofSpace (O n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (oCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (oCoordinates n) g)) :
    Measure (O n) :=
  let g := (TauCeti.inducedRiemannianMetric (n := 0) (oCoordinates n) hf hinj).toContinuousRiemannianMetric
  letI : RiemannianBundle (fun x : O n => TangentSpace 𝓘(ℝ, E) x) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContinuousRiemannianBundle E (fun x : O n => TangentSpace 𝓘(ℝ, E) x) :=
    inferInstance
  TauCeti.riemannianVolume 𝓘(ℝ, E) (O n)

/-- **Layer 7E, the Euclidean volume of `O(n)`**: twice that of `SO(n)` in positive rank, the two
determinant components being isometric by a reflection; `O(0)` is a point of volume 1. -/
theorem oEuclideanMeasure_univ (n : ℕ) [ChartedSpace E (O n)]
    [IsManifold 𝓘(ℝ, E) 1 (O n)]
    [MeasurableSpace (O n)] [BorelSpace (O n)] [LindelofSpace (O n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (oCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (oCoordinates n) g)) :
    oEuclideanMeasure n hf hinj Set.univ =
      ENNReal.ofReal (if n = 0 then 1 else 2 * orthogonalSkewBasisVolume n) := by
  sorry

end Geometry

end

end Archimedean

end ArchimedeanVolume

/-! ## Layer 9: completeness of a list of classes from the mass -/

section Layer9

/-- **The mass of a positive definite genus, at the level of Gram matrices** (7A): the genus of
`G` has a finite complete set of pairwise non-isometric positive definite representatives whose
reciprocal automorphism orders sum to `m`. -/
def IsGenusMass {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ) (m : ℚ) : Prop :=
  ∃ S : Finset (Matrix (Fin n) (Fin n) ℤ),
    (∀ H ∈ S, H.IsSymm ∧ (Matrix.toQuadraticForm' H).PosDef ∧ GramSameGenus G H) ∧
      ((S : Set (Matrix (Fin n) (Fin n) ℤ)).Pairwise fun H H' => ¬ GramIsometric H H') ∧
        (∀ H : Matrix (Fin n) (Fin n) ℤ, H.IsSymm → (Matrix.toQuadraticForm' H).PosDef →
          GramSameGenus G H → ∃ H' ∈ S, GramIsometric H' H) ∧
          m = ∑ H ∈ S,
            (1 : ℚ) / (Nat.card {P : Matrix (Fin n) (Fin n) ℤ // P.transpose * H * P = H} : ℚ)

/-- **Layer 9B, exhaustion from mass saturation.** If the mass of the genus of `G` is `m` and a
finite set `S` of pairwise non-isometric positive definite Gram matrices in that genus has
reciprocal automorphism orders summing to `m`, then every positive definite Gram matrix in the
genus is isometric to a member of `S`: each `1/|O(H)|` is a positive isometry invariant, so a
missing class would make the sum over `S` smaller than `m`. -/
theorem isometric_mem_of_sum_eq_genusMass {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ) (m : ℚ)
    (hm : IsGenusMass G m) (S : Finset (Matrix (Fin n) (Fin n) ℤ))
    (hS : ∀ H ∈ S, H.IsSymm ∧ (Matrix.toQuadraticForm' H).PosDef ∧ GramSameGenus G H)
    (hpair : (S : Set (Matrix (Fin n) (Fin n) ℤ)).Pairwise fun H H' => ¬ GramIsometric H H')
    (hsum : m = ∑ H ∈ S,
      (1 : ℚ) / (Nat.card {P : Matrix (Fin n) (Fin n) ℤ // P.transpose * H * P = H} : ℚ))
    (H : Matrix (Fin n) (Fin n) ℤ) (hs : H.IsSymm) (hp : (Matrix.toQuadraticForm' H).PosDef)
    (hgen : GramSameGenus G H) :
    ∃ H' ∈ S, GramIsometric H' H :=
  sorry

end Layer9

end TauCetiRoadmap.IntegralLattices

import Mathlib
import TauCeti.RingTheory.FittingIdeal.Basic

/-!
# Integral Hecke actions, determinants and interpolation: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements are acceptance targets for its headline results.

Mathlib's polynomial laws support the concrete determinant and trace definitions below.
The statements cover coefficient reconstruction and trace comparison (IHG.0), Azumaya reduced
norms (IHG.0.6), semisimple and henselian reconstruction, classical Ribet lattices and
coefficient descent (IHG.1),
ghost nilpotence (IHG.2), Frobenius uniqueness and integral interpolation (IHG.4),
coefficient descent through a Hecke comparison (IHG.5), generic regularity (IHG.6.5),
and the local and global integral Ribet theorems (IHG.6.7).

The determinant coordinate-ring and Vaccarino statements need the homogeneous divided-power
algebra with its internal multiplication from DerivedModuleAlgebra §0.DP.2, absent at the pins.
Reductive pseudocharacter comparison, its representing ring, and GL reconstruction need the
scheme-invariant tensor coordinate algebras and word-substitution diagram of IHG.0.7;
the pinned Hopf and general-linear coordinate APIs do not supply these objects.
The arbitrary-field factor classification needs the finite-exponent norm laws of IHG.1.2.
Multiplicity-free GMA reconstruction, its Ext comparison, and local compression need the GMA
and its labelled residual constituents from IHG.1.3–1.4. Universal Cayley–Hamilton and generic
representation-algebra statements need the characteristic-law quotient of IHG.1.1 and IHG.1.5. Operator localization needs the derived telescope and
its homology comparison of IHG.2.3. The invariant and relation-complex theorems of IHG.6.3–6.7
need the rational cohomology, good filtrations, and Buchsbaum–Rim complexes specified there. These headline signatures are deferred until their objects exist;
none is represented by an unspecified predicate. The Hecke coefficient conversions of
IHG.3a and the residual predicates of IHG.3b are specified in `README.md`.
-/

namespace TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

noncomputable section

open TensorProduct Polynomial

universe u

namespace PolynomialLaw

variable {A : Type u} [CommRing A]

/-- The kernel of a polynomial law: the `x` with `f_S(b ⊗ x + m) = f_S(m)` for every commutative
`A`-algebra `S`, `b ∈ S` and `m ∈ S ⊗ M` ([Chenevier], §1.17, p. 16). -/
def ker {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]
    (f : M →ₚₗ[A] N) : Submodule A M where
  carrier := {x | ∀ (S : Type u) [CommRing S] [Algebra A S] (b : S) (m : S ⊗[A] M),
    f.toFun' S (b ⊗ₜ x + m) = f.toFun' S m}
  add_mem' := by
    intro x y hx hy S _ _ b m
    simp only [TensorProduct.tmul_add, add_assoc]
    rw [hx S b (b ⊗ₜ y + m), hy S b m]
  zero_mem' := by
    intro S _ _ b m
    simp
  smul_mem' := by
    intro a x hx S _ _ b m
    simpa only [TensorProduct.tmul_smul, TensorProduct.smul_tmul'] using hx S (a • b) m

end PolynomialLaw

/-- A `d`-dimensional `A`-valued determinant on an `A`-algebra `R` ([Chenevier], §1.5,
Definition, p. 9): a multiplicative polynomial law `R → A`, homogeneous of degree `d`. -/
structure Determinant (A : Type u) [CommRing A] (R : Type*) [Ring R] [Algebra A R] (d : ℕ) where
  /-- The underlying polynomial law. -/
  toLaw : R →ₚₗ[A] A
  /-- Homogeneity after every scalar extension, as supplied by DerivedModuleAlgebra §0.DP.1. -/
  isHomogeneous : ∀ (S : Type u) [CommRing S] [Algebra A S] (s : S) (x : S ⊗[A] R),
    toLaw.toFun' S (s • x) = s ^ d • toLaw.toFun' S x
  /-- Multiplicativity after every scalar extension, as supplied by DerivedModuleAlgebra §0.DP.1. -/
  isMultiplicative : ∀ (S : Type u) [CommRing S] [Algebra A S],
    toLaw.toFun' S 1 = 1 ∧ ∀ x y : S ⊗[A] R,
      toLaw.toFun' S (x * y) = toLaw.toFun' S x * toLaw.toFun' S y

namespace Determinant

variable {A : Type u} [CommRing A] {R : Type*} [Ring R] [Algebra A R] {d : ℕ}
/-- The characteristic polynomial `χ(x, X) = D_{A[X]}(X − x)` ([Chenevier], §1.10, p. 12). -/
def charpoly (D : Determinant A R d) (x : R) : A[X] :=
  Algebra.TensorProduct.rid A A A[X]
    (D.toLaw.toFun' A[X] ((X : A[X]) ⊗ₜ[A] (1 : R) - 1 ⊗ₜ[A] x))

/-- The trace `Λ₁`, minus the coefficient of `X^{d−1}` of `χ`; it is `0` in degree zero. -/
def trace (D : Determinant A R d) (x : R) : A :=
  if d = 0 then 0 else -(D.charpoly x).coeff (d - 1)

/-- A matrix representation realizes the entire determinant law, after every scalar extension. -/
def IsRealizedBy (D : Determinant A R d) (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S] (x : S ⊗[A] R),
    Algebra.TensorProduct.rid A S S (D.toLaw.toFun' S x) =
      Matrix.det ((matrixEquivTensor (Fin d) A S).symm
        (Algebra.TensorProduct.map (AlgHom.id A S) ρ x))

/-- Amitsur's formula reconstructs the entire law from characteristic polynomials of
monoid elements, without inverting a factorial (README §0.5; Chenevier Corollary 1.14, p.14). -/
theorem eq_of_charpoly_eq {G : Type*} [Monoid G] (D E : Determinant A (MonoidAlgebra A G) d)
    (h : ∀ g : G, D.charpoly (MonoidAlgebra.of A G g) = E.charpoly (MonoidAlgebra.of A G g)) :
    D = E := sorry

/-- Continuity of every characteristic coefficient on the group (Chenevier §2.30, p.37). -/
def IsContinuous {G : Type*} [Group G] [TopologicalSpace G] [TopologicalSpace A]
    (D : Determinant A (MonoidAlgebra A G) d) : Prop :=
  ∀ i, Continuous fun g : G ↦ (D.charpoly (MonoidAlgebra.of A G g)).coeff i

/-- `E` is the coefficient change of `D` along `φ`: at every group element the characteristic
polynomial of `E` is the image of that of `D`. Amitsur's formula determines the full law
from these coefficients (Chenevier, Corollary 1.14, p.14). -/
def IsCoefficientChange {G B : Type*} [Monoid G] [CommRing B]
    (D : Determinant A (MonoidAlgebra A G) d) (φ : A →+* B)
    (E : Determinant B (MonoidAlgebra B G) d) : Prop :=
  ∀ g : G, (D.charpoly (MonoidAlgebra.of A G g)).map φ = E.charpoly (MonoidAlgebra.of B G g)

end Determinant

section Pseudocharacter

variable {A : Type u} [CommRing A] {R : Type*} [Ring R] [Algebra A R]

/-- The product `x_i x_{σ i} x_{σ² i} ⋯` along the cycle of `σ` through `i`, starting at `i`. -/
def cycleProduct {n : ℕ} (σ : Equiv.Perm (Fin n)) (x : Fin n → R) (i : Fin n) : R :=
  ((List.range (Function.minimalPeriod σ i)).map fun k ↦ x ((σ ^ k) i)).prod

/-- `T^σ(x)`: one factor `T(·)` for each cycle of `σ` (taken at its least element), fixed points
included. -/
def cycleTerm {n : ℕ} (T : R → A) (σ : Equiv.Perm (Fin n)) (x : Fin n → R) : A :=
  ∏ i ∈ Finset.univ.filter (fun i ↦ ∀ j, σ.SameCycle i j → i ≤ j), T (cycleProduct σ x i)

/-- A `d`-dimensional pseudocharacter: an `A`-linear central `T` with `T(1) = d` and
`∑_{σ ∈ S_{d+1}} sgn(σ) T^σ(x₁, …, x_{d+1}) = 0` ([Chenevier], §1.10 and §1.26, pp. 12, 20; the
hypothesis `d! ∈ Aˣ` of that definition is carried by the comparison theorems instead). -/
def IsPseudocharacter (d : ℕ) (T : R →ₗ[A] A) : Prop :=
  T 1 = d ∧ (∀ x y : R, T (x * y) = T (y * x)) ∧
    ∀ x : Fin (d + 1) → R,
      ∑ σ : Equiv.Perm (Fin (d + 1)), (Equiv.Perm.sign σ : ℤ) • cycleTerm T σ x = 0

/-- The trace of an arbitrary determinant is linear and satisfies the pseudocharacter
identity, including in small characteristic (README §0.5; Chenevier Lemma 1.12(iii), pp.12–14). -/
theorem Determinant.isPseudocharacter_trace {d : ℕ} (D : Determinant A R d) :
    ∃ T : R →ₗ[A] A, D.trace = T ∧ IsPseudocharacter d T := sorry

/-- If `d!` is a unit, a determinant is determined by its trace ([Chenevier], Proposition 1.27,
p. 20). -/
theorem Determinant.injective_trace {d : ℕ} (hd : IsUnit (d.factorial : A)) :
    Function.Injective fun D : Determinant A R d ↦ D.trace := sorry

/-- Over a `ℚ`-algebra every pseudocharacter is the trace of a unique determinant ([Chenevier],
Proposition 1.27, p. 20). -/
theorem Determinant.exists_unique_trace_eq [Algebra ℚ A] {d : ℕ} (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.trace = T := sorry

/-- The same when `(2d)!` is a unit, or `d = 2` and `2` is a unit ([Chenevier], Proposition 1.29,
pp. 20–22). -/
theorem Determinant.exists_unique_trace_eq_of_isUnit {d : ℕ}
    (hd : IsUnit ((2 * d).factorial : A) ∨ (d = 2 ∧ IsUnit (2 : A))) (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.trace = T := sorry

end Pseudocharacter

/-- The unique degree-`d` determinant of a constant-rank Azumaya algebra is its reduced norm
(README §0.6; Chenevier, Example 1.7(ii) and Exercise 2.5, pp.10,26). -/
theorem Determinant.existsUnique_of_isAzumaya {A R : Type u} [CommRing A] [Ring R]
    [Algebra A R] [IsAzumaya A R] (d : ℕ) (hd : 0 < d)
    (hrank : Module.rankAtStalk (R := A) R = d * d) :
    Nonempty (Determinant A R d) ∧ Subsingleton (Determinant A R d) := sorry

/-- The vector module `Kᵈ` of a matrix representation `ρ : R → M_d(K)`, through
`M_d(K) ≃ End(Kᵈ)` and restriction of scalars. -/
def matrixModule {K R : Type u} [CommRing K] [Ring R] [Algebra K R] {d : ℕ}
    (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) : ModuleCat R :=
  letI := Module.compHom (Fin d → K) (Matrix.toLinAlgEquiv'.toAlgHom.comp ρ).toRingHom
  ModuleCat.of R (Fin d → K)

/-- A family of matrices `ρ : G → M_d(k)` over a field (the image of a representation) is
absolutely irreducible: `d > 0`, and after every extension to an algebraically closed field no
proper nonzero subspace is stable. -/
def IsAbsolutelyIrreducible {k G : Type u} [Field k] {d : ℕ}
    (ρ : G → Matrix (Fin d) (Fin d) k) : Prop :=
  0 < d ∧ ∀ (L : Type u) [Field L] [IsAlgClosed L] [Algebra k L] (W : Submodule L (Fin d → L)),
    (∀ g, ∀ x ∈ W, ((ρ g).map (algebraMap k L)).mulVec x ∈ W) → W = ⊥ ∨ W = ⊤

/-- Semisimple reconstruction over an algebraically closed field: every `d`-dimensional
determinant, `d ≥ 1`, is `det ∘ ρ` for a semisimple `ρ : R → M_d(k)` with the same kernel, unique up
to conjugation; no factorial is inverted ([Chenevier], Theorem 2.12, pp. 28–31). -/
theorem Determinant.exists_semisimple_realization {k R : Type u} [Field k] [IsAlgClosed k]
    [Ring R] [Algebra k R] (d : ℕ) (hd : 0 < d) (D : Determinant k R d) :
    ∃ ρ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
      D.IsRealizedBy ρ ∧ IsSemisimpleModule R (matrixModule ρ) ∧
      (∀ r, ρ r = 0 ↔ r ∈ PolynomialLaw.ker D.toLaw) ∧
      ∀ σ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
        D.IsRealizedBy σ → IsSemisimpleModule R (matrixModule σ) →
        ∃ P : (Matrix (Fin d) (Fin d) k)ˣ, ∀ x,
          σ x = (P : Matrix (Fin d) (Fin d) k) * ρ x * (↑P⁻¹ : Matrix (Fin d) (Fin d) k) := sorry

/-- Henselian reconstruction: over a henselian local ring, a determinant on `A[G]` whose reduction
is the determinant of an absolutely irreducible representation over the residue field is the
determinant of a representation `A[G] → M_d(A)`, unique up to conjugation ([Chenevier], Theorem
2.22(i), p. 34, applied to `A[G]/CH(D)` for existence; uniqueness by inner conjugacy of
automorphisms of `M_d(A)` over a local ring, [Allen–Newton–Thorne], proof of Theorem 2.4, p. 5). -/
theorem Determinant.exists_realization_of_henselian {A G : Type u} [CommRing A]
    [HenselianLocalRing A] [Group G] {d : ℕ} (D : Determinant A (MonoidAlgebra A G) d)
    (ρbar : MonoidAlgebra (IsLocalRing.ResidueField A) G →ₐ[IsLocalRing.ResidueField A]
      Matrix (Fin d) (Fin d) (IsLocalRing.ResidueField A))
    (hIrr : IsAbsolutelyIrreducible fun g : G ↦ ρbar (MonoidAlgebra.of _ G g))
    (hres : ∀ g : G, (D.charpoly (MonoidAlgebra.of A G g)).map (IsLocalRing.residue A) =
      (ρbar (MonoidAlgebra.of _ G g)).charpoly) :
    ∃ ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A, D.IsRealizedBy ρ ∧
      ∀ σ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A, D.IsRealizedBy σ →
        ∃ P : (Matrix (Fin d) (Fin d) A)ˣ, ∀ x,
          σ x = (P : Matrix (Fin d) (Fin d) A) * ρ x * (↑P⁻¹ : Matrix (Fin d) (Fin d) A) := sorry

/-- Absolutely irreducible coefficient descent: for complete noetherian local rings `A ⊆ B` with
the same residue field, a continuous `ρ : G → GL_d(B)` of a profinite group with absolutely
irreducible reduction and all traces in `A` is conjugate by `1 + M_d(m_B)` into `GL_d(A)` ([CHT],
Lemma 2.1.10, pp. 13–15). -/
theorem coefficient_descent {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B]
    [IsLocalRing A] [IsLocalRing B] [IsNoetherianRing A] [IsNoetherianRing B]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace B] (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    [IsTopologicalGroup G] {d : ℕ}
    (hinj : Function.Injective (algebraMap A B))
    (e : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (he : ∀ a : A, IsLocalRing.residue B (algebraMap A B a) = e (IsLocalRing.residue A a))
    (ρ : G →* (Matrix (Fin d) (Fin d) B)ˣ)
    (hρ : Continuous fun g ↦ (ρ g : Matrix (Fin d) (Fin d) B))
    (hIrr : IsAbsolutelyIrreducible fun g ↦
      (ρ g : Matrix (Fin d) (Fin d) B).map (IsLocalRing.residue B))
    (htrace : ∀ g, ∃ a : A, (ρ g : Matrix (Fin d) (Fin d) B).trace = algebraMap A B a) :
    ∃ (ρA : G →* (Matrix (Fin d) (Fin d) A)ˣ) (P : (Matrix (Fin d) (Fin d) B)ˣ),
      (∀ i j, (P : Matrix (Fin d) (Fin d) B) i j - (1 : Matrix (Fin d) (Fin d) B) i j ∈
        IsLocalRing.maximalIdeal B) ∧
      ∀ g, (ρA g : Matrix (Fin d) (Fin d) A).map (algebraMap A B) =
        (P : Matrix (Fin d) (Fin d) B) * ρ g * (↑P⁻¹ : Matrix (Fin d) (Fin d) B) := sorry

/-- Symplectic coefficient descent with prescribed multiplier: in the setting of
`coefficient_descent` with `d = 4`, residue characteristic `p > 2`, a nondegenerate alternating
form `J` over `A` and a continuous multiplier `ν : G → Aˣ` with `ρᵀ J ρ = ν J` over `B`, the
descended representation keeps the form and the multiplier, and the conjugator is a similitude
congruent to `1` modulo `m_B` ([Gee–Geraghty], Lemma 7.1.1 and proof, p. 25). -/
theorem symplectic_coefficient_descent {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B]
    [IsLocalRing A] [IsLocalRing B] [IsNoetherianRing A] [IsNoetherianRing B]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace A] [TopologicalSpace B] (hAadic : IsAdic (IsLocalRing.maximalIdeal A))
    (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    [IsTopologicalGroup G] (hinj : Function.Injective (algebraMap A B))
    (e : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (he : ∀ a : A, IsLocalRing.residue B (algebraMap A B a) = e (IsLocalRing.residue A a))
    (p : ℕ) [CharP (IsLocalRing.ResidueField A) p] (hp : 2 < p)
    (ρ : G →* (Matrix (Fin 4) (Fin 4) B)ˣ)
    (hρ : Continuous fun g ↦ (ρ g : Matrix (Fin 4) (Fin 4) B))
    (hIrr : IsAbsolutelyIrreducible fun g ↦
      (ρ g : Matrix (Fin 4) (Fin 4) B).map (IsLocalRing.residue B))
    (htrace : ∀ g, ∃ a : A, (ρ g : Matrix (Fin 4) (Fin 4) B).trace = algebraMap A B a)
    (ν : G →* Aˣ) (hν : Continuous fun g ↦ (ν g : A))
    (form : Matrix (Fin 4) (Fin 4) A) (hnondegenerate : IsUnit form)
    (halternating : ∀ x : Fin 4 → A, dotProduct x (form.mulVec x) = 0)
    (hform : ∀ g, (ρ g : Matrix (Fin 4) (Fin 4) B).transpose * form.map (algebraMap A B) *
      (ρ g : Matrix (Fin 4) (Fin 4) B) = algebraMap A B (ν g) • form.map (algebraMap A B)) :
    ∃ (ρA : G →* (Matrix (Fin 4) (Fin 4) A)ˣ) (P : (Matrix (Fin 4) (Fin 4) B)ˣ),
      Continuous (fun g ↦ (ρA g : Matrix (Fin 4) (Fin 4) A)) ∧
      (∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).transpose * form * (ρA g : Matrix (Fin 4) (Fin 4) A) =
        (ν g : A) • form) ∧
      (∀ i j, (P : Matrix (Fin 4) (Fin 4) B) i j - (1 : Matrix (Fin 4) (Fin 4) B) i j ∈
        IsLocalRing.maximalIdeal B) ∧
      (∃ μ : Bˣ, (P : Matrix (Fin 4) (Fin 4) B).transpose * form.map (algebraMap A B) *
        (P : Matrix (Fin 4) (Fin 4) B) = (μ : B) • form.map (algebraMap A B)) ∧
      ∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).map (algebraMap A B) =
        (P : Matrix (Fin 4) (Fin 4) B) * ρ g * (↑P⁻¹ : Matrix (Fin 4) (Fin 4) B) := sorry

/-- A stable full lattice whose residual representation is a nonsplit extension in the
prescribed orientation (README §1.4; Ribet, Proposition 2.1, pp.154–155). -/
theorem classical_ribet_lattice {A K G : Type u} [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] [NormedField K] [CompleteSpace K] [LocallyCompactSpace K]
    [IsUltrametricDist K] [Algebra A K] [IsFractionRing A K]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (hA : ∀ x : K, (∃ a : A, algebraMap A K a = x) ↔ ‖x‖ ≤ 1)
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (ρ : G →* (Matrix (Fin 2) (Fin 2) K)ˣ)
    (hρ : Continuous fun g ↦ (ρ g : Matrix (Fin 2) (Fin 2) K))
    (hirr : ∀ W : Submodule K (Fin 2 → K),
      (∀ g, ∀ x ∈ W, (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec x ∈ W) → W = ⊥ ∨ W = ⊤)
    (χ ψ : G →* (IsLocalRing.ResidueField A)ˣ) (hdistinct : χ ≠ ψ)
    (hchar : ∀ g, ∃ P : A[X],
      P.map (algebraMap A K) = (ρ g : Matrix (Fin 2) (Fin 2) K).charpoly ∧
      P.map (IsLocalRing.residue A) =
        (X - C (χ g : IsLocalRing.ResidueField A)) * (X - C (ψ g : IsLocalRing.ResidueField A))) :
    ∃ (L : Submodule A (Fin 2 → K)) (b : Module.Basis (Fin 2) A L)
      (ρA : G →* (Matrix (Fin 2) (Fin 2) A)ˣ),
      Submodule.span K (L : Set (Fin 2 → K)) = ⊤ ∧
      (∀ g i, (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec (b i : Fin 2 → K) =
        ∑ j, (ρA g : Matrix (Fin 2) (Fin 2) A) j i • (b j : Fin 2 → K)) ∧
      (∀ g, IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 0 0) = χ g ∧
        IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 1 1) = ψ g ∧
        IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 1 0) = 0) ∧
      ¬ ∃ v : IsLocalRing.ResidueField A, ∀ g,
        IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 0 1) =
          ((ψ g : IsLocalRing.ResidueField A) - (χ g : IsLocalRing.ResidueField A)) * v := sorry

/-! ## Layer IHG.2: integral and derived Hecke actions -/

namespace HeckeImage

open CategoryTheory

variable {A : Type u} [CommRing A]

local instance : HasDerivedCategory.{u + 1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)

/-- `C` has cohomology only in degrees `[a, b]`. -/
def Supported (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) : Prop :=
  ∀ i : ℤ, i < a ∨ b < i →
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)

/-- Every cohomology module of `C` is finitely generated. -/
def FiniteCohomology (C : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∀ i : ℤ, Module.Finite A ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)

/-- An endomorphism is a ghost if it acts by zero on every cohomology module. -/
def IsGhost {C : DerivedCategory (ModuleCat.{u} A)} (f : End C) : Prop :=
  ∀ i : ℤ, (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map f = 0

/-- Over a noetherian ring, `Hom(M, N)` is finite for bounded `M, N` with finite cohomology; no
finite projective dimension is assumed ([Boxer–Pilloni], proof of Lemma 2.4.3, p. 18). -/
theorem derived_hom_finite [IsNoetherianRing A] (M N : DerivedCategory (ModuleCat.{u} A))
    (a b c e : ℤ) (hM : Supported M a b) (hN : Supported N c e)
    (hfinM : FiniteCohomology M) (hfinN : FiniteCohomology N) : Module.Finite A (M ⟶ N) := sorry

/-- Ghost nilpotence: if `C` is supported in `[a, b]`, every ordered product of `b − a + 1` ghosts
vanishes ([ACC], proof of Lemma 2.2.4, pp. 920–921). -/
theorem ghost_nilpotence (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) (hab : a ≤ b)
    (hC : Supported C a b) (fs : Fin ((b - a).toNat + 1) → End C) (hfs : ∀ i, IsGhost (fs i)) :
    (List.ofFn fs).prod = 0 := sorry

end HeckeImage

namespace Determinant

variable {A : Type u} [CommRing A] {d : ℕ}

/-- Two continuous determinants over a Hausdorff ring with the same characteristic polynomials at
a family of elements whose conjugates are dense are equal ([Chenevier], Lemma 1.12(ii) and §2.30,
pp. 12, 37; [Scholze], Corollary 5.1.10, p. 1037). -/
theorem eq_of_charpoly_frobenius {G V : Type*} [Group G] [TopologicalSpace G] [TopologicalSpace A]
    [T2Space A] (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g = h * Frob v * h⁻¹})
    (D E : Determinant A (MonoidAlgebra A G) d) (hD : D.IsContinuous) (hE : E.IsContinuous)
    (h : ∀ v, D.charpoly (MonoidAlgebra.of A G (Frob v)) =
      E.charpoly (MonoidAlgebra.of A G (Frob v))) :
    D = E := sorry

/-- Compact gluing: for compact Hausdorff `A` and a jointly injective family of continuous maps
`φ_i : A → B_i` to Hausdorff rings, continuous determinants `D_i` whose coefficients on a dense set
lift to one element of `A` come from a unique continuous determinant over `A` ([Chenevier],
Example 2.32 and Corollary 1.14, pp. 38, 14). -/
theorem existsUnique_isCoefficientChange_of_compact {G : Type*} [Group G] [TopologicalSpace G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    (ι : Type*) (B : ι → Type u) [∀ i, CommRing (B i)] [∀ i, TopologicalSpace (B i)]
    [∀ i, T2Space (B i)] (φ : ∀ i, A →+* B i)
    (hinj : Function.Injective fun a : A ↦ fun i ↦ φ i a) (hφ : ∀ i, Continuous (φ i))
    (D : ∀ i, Determinant (B i) (MonoidAlgebra (B i) G) d) (hD : ∀ i, (D i).IsContinuous)
    (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : A, ∀ i,
      ((D i).charpoly (MonoidAlgebra.of (B i) G g)).coeff k = φ i a) :
    ∃! E : Determinant A (MonoidAlgebra A G) d,
      E.IsContinuous ∧ ∀ i, E.IsCoefficientChange (φ i) (D i) := sorry

/-- Integral interpolation: let `A` be separated and complete for a descending chain of ideals
`J_r` that form a basis of neighbourhoods of `0`, and let `D_r` be determinants over `A/J_r` with
locally constant coefficients and prescribed Frobenius polynomials `P_v mod J_r`, the conjugates
of the Frobenius elements being dense. Then a unique continuous determinant over `A` has
polynomial `P_v` at every `Frob v` ([Chenevier], Example 2.32 and Lemma 3.2, pp. 38, 41;
[Scholze], Corollary 5.1.11, p. 1038). -/
theorem existsUnique_interpolation {G V : Type*} [Group G] [TopologicalSpace G]
    [TopologicalSpace A] [IsTopologicalRing A] (J : ℕ → Ideal A) (hJ : Antitone J)
    (hbasis : (nhds (0 : A)).HasBasis (fun _ ↦ True) fun r ↦ (J r : Set A))
    (hsep : ⨅ r, J r = ⊥)
    (hcomplete : ∀ a : (r : ℕ) → A ⧸ J r,
      (∀ r s (h : r ≤ s), Ideal.Quotient.factor (hJ h) (a s) = a r) →
        ∃ x : A, ∀ r, Ideal.Quotient.mk (J r) x = a r)
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g = h * Frob v * h⁻¹}) (P : V → A[X])
    (D : ∀ r, Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) G) d)
    (hD : ∀ r i, IsLocallyConstant fun g : G ↦
      ((D r).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i)
    (hP : ∀ r v, (D r).charpoly (MonoidAlgebra.of (A ⧸ J r) G (Frob v)) =
      (P v).map (Ideal.Quotient.mk (J r))) :
    ∃! E : Determinant A (MonoidAlgebra A G) d,
      E.IsContinuous ∧ ∀ v, E.charpoly (MonoidAlgebra.of A G (Frob v)) = P v := sorry

end Determinant

/-- Descent through a Hecke comparison `φ : T → B`: for compact `G`, compact Hausdorff `T / ker φ`
with continuous injective lift to Hausdorff `B`, a continuous determinant over `B` whose
coefficients on a dense set lie in the image descends uniquely to `T / ker φ`; the nilpotence
exponent of the error ideal is quantified separately in README §5.2 ([Scholze], proof of
Theorem 5.4.1, pp. 1058–1059). -/
theorem Determinant.existsUnique_descent_kerLift {T B G : Type u} [CommRing T] [CommRing B]
    [Group G] [TopologicalSpace G] [CompactSpace G] {d : ℕ} (φ : T →+* B)
    [TopologicalSpace (T ⧸ RingHom.ker φ)] [CompactSpace (T ⧸ RingHom.ker φ)]
    [T2Space (T ⧸ RingHom.ker φ)] [TopologicalSpace B] [T2Space B]
    (hφ : Continuous (RingHom.kerLift φ))
    (D : Determinant B (MonoidAlgebra B G) d) (hD : D.IsContinuous) (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : T ⧸ RingHom.ker φ,
      (D.charpoly (MonoidAlgebra.of B G g)).coeff k = RingHom.kerLift φ a) :
    ∃! E : Determinant (T ⧸ RingHom.ker φ) (MonoidAlgebra (T ⧸ RingHom.ker φ) G) d,
      E.IsContinuous ∧ E.IsCoefficientChange (RingHom.kerLift φ) D := sorry

namespace IntegralRibet

variable {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B] [Group G]

/-- The ordered independent generic combinations of the coordinates `b` (README §6.5,
Generic combinations of an ideal containing a regular sequence). -/
def genericLinearSequence {S : Type u} [CommRing S] {h : ℕ} (b : Fin h → S) (ℓ : ℕ) :
    List (MvPolynomial (Fin ℓ × Fin h) S) :=
  List.ofFn fun i ↦ ∑ j, MvPolynomial.X (i, j) * MvPolynomial.C (b j)

/-- An ideal containing a weakly regular sequence of length at least `ℓ` supplies `ℓ`
weakly regular independent generic combinations of its given generators over any commutative
ring (Stacks tags 068P and 0663; the iterated Koszul-cohomology argument of README §6.5). -/
theorem generic_combinations_regular {S : Type u} [CommRing S] {h ℓ : ℕ}
    (b : Fin h → S) (w : List S) (hw : RingTheory.Sequence.IsWeaklyRegular S w)
    (hmem : ∀ x ∈ w, x ∈ Ideal.span (Set.range b)) (hcount : ℓ ≤ w.length) :
    RingTheory.Sequence.IsWeaklyRegular (MvPolynomial (Fin ℓ × Fin h) S)
      (genericLinearSequence b ℓ) := sorry

/-- The sum of the disjoint local two-row minor ideals. Left variables are `b′`, right
variables are `b`; the final `u` right variables are unused coordinates (DKSW Corollary 5.12,
printed p.43; README §6.5, Coordinate regularity in disjoint minor quotients). -/
def localMinorIdeal (S : Type u) [CommRing S] {n k : ℕ} (u : ℕ) (block : Fin n → Fin k) :
    Ideal (MvPolynomial (Fin n ⊕ Fin (n + u)) S) :=
  Ideal.span {p | ∃ i j : Fin n, block i = block j ∧
    p = MvPolynomial.X (Sum.inr (Fin.castAdd u i)) * MvPolynomial.X (Sum.inl j) -
      MvPolynomial.X (Sum.inr (Fin.castAdd u j)) * MvPolynomial.X (Sum.inl i)}

/-- Modulo disjoint local minors, at most `u + k` independent generic scalar equations are
weakly regular, with `u` unused coordinates and `k` nonempty blocks, over any commutative
coefficient ring. Singleton blocks contribute zero minors; moving their coordinates to the
unused list preserves the bound (README §6.5, Mixed minor and linear resolutions, extending
DKSW Proposition 5.14, printed p.46). -/
theorem mixed_scalar_regular (S : Type u) [CommRing S] {n k u ℓ : ℕ}
    (block : Fin n → Fin k) (hblocks : Function.Surjective block) (hcount : ℓ ≤ u + k) :
    let Q := MvPolynomial (Fin n ⊕ Fin (n + u)) S
    let I := (localMinorIdeal S u block).map
      (MvPolynomial.C : Q →+* MvPolynomial (Fin ℓ × Fin (n + u)) Q)
    RingTheory.Sequence.IsWeaklyRegular
      (MvPolynomial (Fin ℓ × Fin (n + u)) Q ⧸ I)
      ((genericLinearSequence (fun j : Fin (n + u) ↦
        (MvPolynomial.X (Sum.inr j) : Q)) ℓ).map (Ideal.Quotient.mk I)) := sorry

/-- `t ↦ ρ(t) − ψ(t) I₂` on `A[G]`. -/
def differenceMap (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (ψ : G →* Aˣ) :
    MonoidAlgebra A G →ₗ[A] Matrix (Fin 2) (Fin 2) B :=
  ρ.toLinearMap - (Algebra.linearMap A (Matrix (Fin 2) (Fin 2) B)).comp
    (MonoidAlgebra.lift A A _ ((Units.coeHom A).comp ψ)).toLinearMap

/-- The character difference module `Δψ`, the range of `differenceMap` ([DKSW], §2.1,
equation (14), pp. 8–9). -/
def differenceModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (ψ : G →* Aˣ) :
    Submodule A (Matrix (Fin 2) (Fin 2) B) :=
  LinearMap.range (differenceMap ρ ψ)

/-- The product `ΔχΔψ` read inside `Δψ`. -/
def productInside (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    Submodule A (differenceModule ρ ψ) :=
  (Submodule.span A {z | ∃ x ∈ differenceModule ρ χ, ∃ y ∈ differenceModule ρ ψ, z = x * y}).comap
    (differenceModule ρ ψ).subtype

/-- The initial Ribet module `M₀ = Δψ / ΔχΔψ` ([DKSW], §2.1, p. 9). -/
def initialModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    ModuleCat.{u} A :=
  ModuleCat.of A (differenceModule ρ ψ ⧸ productInside ρ χ ψ)

/-- The canonical cocycle `κ₀(g) = ψ(g)⁻¹ [ρ(g) − ψ(g)]`, for the action `χψ⁻¹` ([DKSW],
Lemma 2.3, p. 9). -/
def canonicalCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (g : G) : initialModule ρ χ ψ :=
  (↑(ψ g)⁻¹ : A) • (productInside ρ χ ψ).mkQ
    ⟨differenceMap ρ ψ (MonoidAlgebra.of A G g), LinearMap.mem_range_self _ _⟩

/-- Local data: subgroups `G_v` for `v ∈ S = Σ ⊔ P`, inertia subgroups `I_v ⊆ G_v`, and a chosen
place `v₀ ∈ Σ` when `Σ` is nonempty ([DKSW], Theorem 2.1, pp. 7–8). -/
structure LocalData (G : Type u) [Group G] where
  count : ℕ
  sigma : Finset (Fin count)
  subgroup : Fin count → Subgroup G
  inertia : Fin count → Subgroup G
  inertia_le : ∀ v, inertia v ≤ subgroup v
  distinguished : Option (Fin count)
  distinguished_mem : ∀ v, distinguished = some v → v ∈ sigma
  distinguished_exists : sigma.Nonempty → ∃ v, distinguished = some v

variable (L : LocalData G)

/-- The places of `Σ` other than `v₀`. -/
def extraPlaces : Finset (Fin L.count) := L.sigma.filter fun v ↦ L.distinguished ≠ some v

/-- `N₀ = M₀ ⊕ ⊕_{v ∈ Σ ∖ {v₀}} A y_v`. -/
def enlargedModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    ModuleCat.{u} A :=
  ModuleCat.of A (initialModule ρ χ ψ × ({v // v ∈ extraPlaces L} → A))

/-- The local relations: `κ₀(G_{v₀})`, `κ₀(g) − (α(g) − 1) y_v` on `G_v` for `v ∈ Σ ∖ {v₀}`, and
`κ₀(I_v)` for `v ∈ P`, where `α = χψ⁻¹` ([DKSW], §2.1, pp. 9–10). -/
def localRelations (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    Submodule A (enlargedModule L ρ χ ψ) :=
  Submodule.span A {z | (∃ v g, L.distinguished = some v ∧ g ∈ L.subgroup v ∧
      z = (canonicalCocycle ρ χ ψ g, 0)) ∨
    (∃ (v : {v // v ∈ extraPlaces L}) (g : G), g ∈ L.subgroup v ∧
      z = (canonicalCocycle ρ χ ψ g, -((↑(χ g) : A) * (↑(ψ g)⁻¹ : A) - 1) • Pi.single v 1)) ∨
    (∃ v g, v ∉ L.sigma ∧ g ∈ L.inertia v ∧ z = (canonicalCocycle ρ χ ψ g, 0))}

/-- The Ribet module with local conditions `N = N₀ / Q` ([DKSW], §2.1, pp. 9–10). -/
def localModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    ModuleCat.{u} A :=
  ModuleCat.of A (enlargedModule L ρ χ ψ ⧸ localRelations L ρ χ ψ)

/-- The image `κ` of `κ₀` in `N`. -/
def localCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) (g : G) :
    localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (canonicalCocycle ρ χ ψ g, 0)

/-- The adjoined vector `y_v`. -/
def localVector (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (v : {v // v ∈ extraPlaces L}) : localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (0, Pi.single v 1)

/-- Characteristic polynomials are integral and reduce modulo `I` to `(X − χ(g))(X − ψ(g))`. -/
def Congruence (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (I : Ideal A) : Prop :=
  ∀ g : G, ∃ P : A[X], P.map (algebraMap A B) = (ρ (MonoidAlgebra.of A G g)).charpoly ∧
    P.map (Ideal.Quotient.mk I) =
      (X - C (Ideal.Quotient.mk I (χ g))) * (X - C (Ideal.Quotient.mk I (ψ g)))

/-- The representation `k[G] → M₂(k)` obtained from `ρ` along `φ : B →+* k`. -/
def fieldRepresentation {k : Type u} [Field k]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (φ : B →+* k) :
    MonoidAlgebra k G →ₐ[k] Matrix (Fin 2) (Fin 2) k :=
  MonoidAlgebra.lift k _ G
    (φ.mapMatrix.toMonoidHom.comp (ρ.toMonoidHom.comp (MonoidAlgebra.of A G)))

/-- `ρ` is irreducible on every field quotient of `B` ([DKSW], Theorem 2.1, pp. 7–8). -/
def IrreducibleOnFields (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) : Prop :=
  ∀ (k : Type u) [Field k] (φ : B →+* k), Function.Surjective φ →
    IsSimpleModule (MonoidAlgebra k G) (matrixModule (fieldRepresentation ρ φ))

/-- The local triangular input: on each `G_v` a basis in which `ρ` is lower triangular with
diagonal characters `η_v, ξ_v` valued in `T̃ˣ`, `ξ_v ≡ ψ` on `G_v` for `v ∈ Σ` and `ξ_v ≡ χ` on
`I_v` for `v ∈ P`, modulo `Ĩ` ([DKSW], Theorem 2.1, conditions (9)–(11), pp. 7–8). -/
structure LocalInput {Tilde : Type u} [CommRing Tilde] [Algebra A Tilde] [Algebra Tilde B]
    [IsScalarTower A Tilde B] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (Itilde : Ideal Tilde) where
  eta : ∀ v, L.subgroup v →* Tildeˣ
  xi : ∀ v, L.subgroup v →* Tildeˣ
  basis : Fin L.count → (Matrix (Fin 2) (Fin 2) B)ˣ
  triangular : ∀ v (g : L.subgroup v),
    (basis v)⁻¹ * ρ (MonoidAlgebra.of A G g) * basis v =
      Matrix.of ![![algebraMap Tilde B (eta v g), 0],
        ![((basis v)⁻¹ * ρ (MonoidAlgebra.of A G g) * basis v : Matrix (Fin 2) (Fin 2) B) 1 0,
          algebraMap Tilde B (xi v g)]]
  sigma_congruence : ∀ v, v ∈ L.sigma → ∀ g : L.subgroup v,
    (↑(xi v g) : Tilde) - algebraMap A Tilde (ψ g) ∈ Itilde
  inertia_congruence : ∀ v, v ∉ L.sigma → ∀ g : G, (hg : g ∈ L.inertia v) →
    (↑(xi v ⟨g, L.inertia_le v hg⟩) : Tilde) - algebraMap A Tilde (χ g) ∈ Itilde

/-- The canonical local Ribet module is finite and carries all the prescribed local
conditions and the weighted Fitting bound (README §6.7; DKSW Theorem 2.1, pp.7–8). -/
theorem local_ribet {Tilde : Type u} [CommRing Tilde] [Algebra A Tilde] [Algebra Tilde B]
    [IsScalarTower A Tilde B] [IsArtinianRing B] [IsPrincipalIdealRing B]
    [IsLocalization (nonZeroDivisors Tilde) B] [IsLocalRing A] [IsNoetherianRing A]
    [IsNoetherianRing Tilde] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) Tilde]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A)) (hAB : Topology.IsEmbedding (algebraMap A B))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous fun g : G ↦ ρ (MonoidAlgebra.of A G g))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ) (Itilde : Ideal Tilde)
    (hproper : Itilde ≠ ⊤) (hnonzero : Itilde ≠ ⊥)
    (hinj : Function.Injective (algebraMap A Tilde)) (hIrr : IrreducibleOnFields ρ)
    (hres : ∀ g, (↑(χ g) : A) - (↑(ψ g) : A) ∈ IsLocalRing.maximalIdeal A)
    (hchar : Congruence ρ χ ψ (Itilde.comap (algebraMap A Tilde)))
    (loc : LocalInput L ρ χ ψ Itilde) (σ : ∀ v, L.subgroup v)
    (Λ : Submodule A (Matrix (Fin 2) (Fin 2) B)) [Module.Finite A Λ]
    (hχΛ : differenceModule ρ χ ≤ Λ) (hψΛ : differenceModule ρ ψ ≤ Λ)
    (hΛtop : (IsLocalRing.maximalIdeal A).adicModuleTopology Λ =
      TopologicalSpace.induced (fun x : Λ ↦ (x : Matrix (Fin 2) (Fin 2) B)) inferInstance) :
    ∃ hfin : Module.Finite A (localModule L ρ χ ψ),
      letI := hfin
      letI : TopologicalSpace (localModule L ρ χ ψ) :=
        (IsLocalRing.maximalIdeal A).adicModuleTopology (localModule L ρ χ ψ)
      Continuous (localCocycle L ρ χ ψ) ∧
        (∀ g h, localCocycle L ρ χ ψ (g * h) = localCocycle L ρ χ ψ g +
          ((χ g : A) * (↑(ψ g)⁻¹ : A)) • localCocycle L ρ χ ψ h) ∧
        (∀ v, L.distinguished = some v → ∀ g ∈ L.subgroup v,
          localCocycle L ρ χ ψ g = 0) ∧
        (∀ (v : {v // v ∈ extraPlaces L}) (g : G), g ∈ L.subgroup v →
          localCocycle L ρ χ ψ g =
            ((χ g : A) * (↑(ψ g)⁻¹ : A) - 1) • localVector L ρ χ ψ v) ∧
        (∀ v, v ∉ L.sigma → ∀ g ∈ L.inertia v, localCocycle L ρ χ ψ g = 0) ∧
        Submodule.span A (Set.range (localCocycle L ρ χ ψ) ∪ Set.range (localVector L ρ χ ψ)) = ⊤ ∧
        (Ideal.span {∏ v ∈ Finset.univ.filter (fun v ↦ v ∉ L.sigma),
          ((↑(loc.xi v (σ v)) : Tilde) - algebraMap A Tilde (χ (σ v)))} : Ideal Tilde) *
          (TauCeti.fittingIdeal A (localModule L ρ χ ψ) 0).map (algebraMap A Tilde) ≤ Itilde :=
  sorry

/-- The integral Ribet theorem: for `T` complete reduced noetherian local, `K = Frac(T)`, compact
`G`, continuous `ρ : G → GL₂(K)` irreducible on every field factor, and characteristic polynomials
integral and congruent to `(X − χ)(X − ψ)` modulo an ideal `I`, there are a finite `T`-module `M`
and a continuous cocycle `κ` for `χψ⁻¹` all of whose cohomologous translates generate `M`, with
`Fitt₀(M) ⊆ I`; `χ ≡ ψ` and residue characteristic two are allowed ([DKSW], Theorem 1.1,
pp. 2–3). -/
theorem global_ribet [IsLocalization (nonZeroDivisors A) B] [IsLocalRing A] [IsNoetherianRing A]
    [IsReduced A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous fun g : G ↦ ρ (MonoidAlgebra.of A G g))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ)
    (hAB : Topology.IsEmbedding (algebraMap A B)) (hIrr : IrreducibleOnFields ρ)
    (I : Ideal A) (hchar : Congruence ρ χ ψ I) :
    ∃ (M : ModuleCat.{u} A) (hfin : Module.Finite A M),
      letI := hfin
      letI : TopologicalSpace M := (IsLocalRing.maximalIdeal A).adicModuleTopology M
      ∃ κ : G → M, Continuous κ ∧
        (∀ g h, κ (g * h) = κ g + ((↑(χ g) : A) * (↑(ψ g)⁻¹ : A)) • κ h) ∧
        (∀ x : M, Submodule.span A
          (Set.range fun g ↦ κ g + ((↑(χ g) : A) * (↑(ψ g)⁻¹ : A) - 1) • x) = ⊤) ∧
        TauCeti.fittingIdeal A M 0 ≤ I := sorry

end IntegralRibet

end

end TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

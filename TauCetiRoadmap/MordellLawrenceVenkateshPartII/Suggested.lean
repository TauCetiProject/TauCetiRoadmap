import Mathlib

/-!
# The Mordell conjecture after Lawrence and Venkatesh, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with
`sorry`, together with the few elementary definitions their statements need.

Stated here:

* `integralHypersurfaces_not_zariskiDense` (README §9.3; Lawrence–Venkatesh, Theorem 10.1 with
  Proposition 10.2): for ambient dimension `n ≥ n₀` and degree `d ≥ D₀(n)`, the degree-`d`
  forms in `n + 1` variables with integer coefficients whose hypersurfaces have good reduction
  outside a finite set `S` of primes lie on a nonzero homogeneous hypersurface of the projective
  space of coefficients. This is the non-density of the integral points of the parameter space
  of smooth degree-`d` hypersurfaces in `ℙⁿ`.
* `eulerian_central_mass_le_half` (README §8.4; Lawrence–Sawin, Lemmas A.4–A.6): for `n ≥ 2`
  the central mass `β₀ = Σ_q (A(n, q)/n!)²` of the Eulerian difference law is at most `1/2`.

Headline theorems that are not statable at the pins:

* The coefficient non-density theorem (README §6.1; Lawrence–Sawin, Theorem 8.17) and every
  statement about Hodge–Deligne systems (README Layers 0–7): Mathlib and Tau Ceti have no
  Betti, étale or crystalline cohomology of a family of varieties, no variation of Hodge
  structure, no filtered F-isocrystal on a residue tube and no comparison isomorphisms between
  them, so neither the systems nor their monodromy groups can be formed.
* The higher-dimensional Lawrence–Venkatesh theorem for an arbitrary smooth projective family
  (README §7.6) and its finiteness clause (README §7.7): they need primitive middle cohomology of
  a family, its geometric monodromy group and its Hodge numbers, none of which exist at the pins.
* Shafarevich finiteness for smooth ample hypersurfaces in abelian varieties (README §§10.6,
  10.9, 10.10; Lawrence–Sawin, Theorem 9.2, Corollary 9.3, Theorems 9.4–9.6). Tau Ceti has
  abelian varieties over a field (`TauCeti.AlgebraicGeometry.AbelianVariety`), ample
  line-bundle classes (`TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`), Cartier divisors on
  an integral scheme with their effectivity (`TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`,
  `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.IsEffective`) and intersection numbers of a
  line-bundle class with a curve (`TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber`);
  Mathlib has smooth morphisms and scheme-theoretic images. What is missing is the arithmetic
  model: neither library has abelian schemes over a base other than a field, so neither the
  good reduction of `A` outside `S` (an abelian scheme over `O_K[S⁻¹]` with generic fibre `A`)
  nor the smoothness of the closure of a divisor in that model can be formed. Numerical
  equivalence classes of divisors and the top self-intersection `φⁿ`, which fixes the class and
  the exceptional degrees in dimension 3, are not at the pins either.
* The Frobenius-centralizer point-count bound (README §7.8; Lawrence–Venkatesh, Lemma 12.1,
  corrected): it needs Frobenius eigenvalues on primitive middle étale cohomology.
* The Hodge numbers and monodromy of projective hypersurfaces: the Jacobian-ring formula for the
  primitive Hodge numbers and its Eulerian asymptotics (README §§8.6–8.7), the large-dimension,
  large-degree Lawrence–Venkatesh inequalities for the universal hypersurface (README §8.9;
  Lawrence–Venkatesh, Proposition 10.2) and big monodromy of the universal family (README §9.2;
  Beauville, Théorèmes 2 and 4). Tau Ceti's Hodge structures are abstract linear algebra: neither
  library attaches a Hodge structure, a primitive part or a monodromy representation to the
  cohomology of a complex projective hypersurface or of a family of them. Writing the Hodge numbers
  through the coefficient formula of README §8.6 would replace them by a theorem of this roadmap.
-/

namespace TauCetiRoadmap.MordellLawrenceVenkateshPartII

open MvPolynomial

/-! ## Layer 8: Eulerian profiles and numerical criteria -/

/-- The Eulerian number `A(n, q)`: the number of permutations `σ` of `Fin n` with exactly `q`
descents, a descent being a position `i` with `i + 1 < n` and `σ (i + 1) < σ i`. This is the
object of ClassicalArithmeticCompletion §2.18, restated so that the Layer 8 headline can be
stated without importing another roadmap; Lawrence–Sawin's `A(n, q)` (counted by ascents) is
the same number. -/
def eulerian (n q : ℕ) : ℕ :=
  (Finset.univ.filter fun σ : Equiv.Perm (Fin n) =>
    (Finset.univ.filter fun i : Fin n =>
      ∃ h : i.val + 1 < n, σ ⟨i.val + 1, h⟩ < σ i).card = q).card

/-- **The central Eulerian convolution mass is at most one half** (Lawrence–Sawin, Lemmas
A.4–A.6, with the corrected tail comparison). For `n ≥ 2`,
`β₀ = Σ_q (A(n, q)/n!)² ≤ 1/2`, written without denominators as
`2 · Σ_{q<n} A(n, q)² ≤ (n!)²`. Equality holds for `n = 2` and `n = 3`; the statement fails
for `n = 1`. -/
theorem eulerian_central_mass_le_half (n : ℕ) (hn : 2 ≤ n) :
    2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2 := by
  sorry

/-! ## Layer 9: Projective hypersurface application -/

/-- The degree-`d` monomials in `n + 1` variables. They index the coordinates of the projective
space `ℙ(H⁰(ℙⁿ, O(d)))` of degree-`d` hypersurfaces in `ℙⁿ`, of dimension
`binomial(n + d, d) − 1`. -/
abbrev HypersurfaceMonomial (n d : ℕ) : Type :=
  {m : Fin (n + 1) →₀ ℕ // m.degree = d}

/-- A form `F` in `n + 1` variables over a field `k` defines a smooth hypersurface of `ℙⁿ_k`
(Jacobian criterion): `F` and its partial derivatives have no common nonzero zero over an
algebraic closure of `k`. The zero form is never smooth. -/
def IsSmoothHypersurface {k : Type*} [Field k] {n : ℕ}
    (F : MvPolynomial (Fin (n + 1)) k) : Prop :=
  ∀ x : Fin (n + 1) → AlgebraicClosure k, x ≠ 0 → aeval x F = 0 →
    ∃ i, aeval x (pderiv i F) ≠ 0

/-- An integral form has good reduction outside the finite set `S` of primes: for every prime
`p ∉ S` its reduction modulo `p` defines a smooth hypersurface over `𝔽_p`. For a form homogeneous
of degree `d` this holds exactly when its coefficients generate the unit ideal of `ℤ[S⁻¹]` and it
is a coordinate vector of a `ℤ[S⁻¹]`-point of the parameter space of smooth degree-`d`
hypersurfaces; every such point has an integral coordinate vector with this property, unique up
to a unit of `ℤ[S⁻¹]`. A multiple of such a form by a prime outside `S` defines the same
rational point but fails the predicate, being zero modulo that prime. -/
def HasGoodReductionOutside {n : ℕ} (S : Finset ℕ)
    (F : MvPolynomial (Fin (n + 1)) ℤ) : Prop :=
  ∀ p : ℕ, (hp : p.Prime) → p ∉ S →
    haveI : Fact p.Prime := ⟨hp⟩
    IsSmoothHypersurface (map (Int.castRingHom (ZMod p)) F)

/-- **Non-density of integral hypersurface parameters** (Lawrence–Venkatesh, Theorem 10.1 and
Proposition 10.2, with the parameter dimension corrected to `binomial(n + d, d) − 1`). There is
`n₀` such that for every ambient dimension `n ≥ n₀` there is `D₀(n)` such that for every degree
`d ≥ D₀(n)` and every finite set `S` of primes, the degree-`d` integral forms in `n + 1`
variables with good reduction outside `S` all lie on one nonzero homogeneous hypersurface `G = 0`
of the projective space of coefficients: the `ℤ[S⁻¹]`-points of the parameter space of smooth
degree-`d` hypersurfaces in `ℙⁿ` are not Zariski dense. -/
theorem integralHypersurfaces_not_zariskiDense :
    ∃ n₀ : ℕ, ∀ n ≥ n₀, ∃ D₀ : ℕ, ∀ d ≥ D₀, ∀ S : Finset ℕ,
      ∃ G : MvPolynomial (HypersurfaceMonomial n d) ℚ, G ≠ 0 ∧ (∃ e, G.IsHomogeneous e) ∧
        ∀ F : MvPolynomial (Fin (n + 1)) ℤ, F.IsHomogeneous d → HasGoodReductionOutside S F →
          eval (fun m => (F.coeff m.1 : ℚ)) G = 0 := by
  sorry

end TauCetiRoadmap.MordellLawrenceVenkateshPartII

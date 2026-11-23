import Mathlib

/-!
# Bernoulli bounds for class group eigenspaces: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. One of them,
the bound for the torsion in the homology of `GL_N(𝒪_L)` (9.4), is statable and is stated
below; the others are not statable at the pins, so nothing is stated in their place.

The other headlines are statements about the Galois cohomology of number fields with
Tate-twisted `ℓ`-adic coefficients, about the étale cohomology of rings of `S`-integers, about
Quillen's K-groups, and about the Galois representations attached to newforms. Mathlib has the
continuous cohomology of a topological group with coefficients in a topological representation,
its Tate–Shafarevich subgroups for restriction to field extensions
(`ContinuousCohomology.tateShafarevich`), the absolute Galois group `Field.absoluteGaloisGroup`,
group homology `groupHomology`, the Bernoulli numbers `bernoulli` and Dirichlet characters; Tau
Ceti has the generalized Bernoulli numbers `DirichletCharacter.generalizedBernoulli` and
cyclotomic characters of absolute Galois groups. Neither has the discrete Galois modules
`ℚ_ℓ/ℤ_ℓ(−e)` and `(Φ/O)(ψ⁻¹χ_ℓ^{−e})` on which `Ш¹(F, ℓ, e)` and `Ш_{ψ,e}(S)` are defined
(6.17, 6.18), the inertia and decomposition subgroups of the absolute Galois group of a number
field at its places with the unramified condition they impose, the Galois group `G_{L,S}` of the
maximal extension unramified outside a finite set of places, the groups
`H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))`, Quillen's K-groups `K_m(R) = π_m(BGL(R)^+)`, or the `ℓ`-adic Galois
representation `V_λ(f)` of a newform with its Bloch–Kato group.

* The Bernoulli bound for minus parts (10.1): for an abelian CM field `E` of conductor `N` and
  degree `n`, an odd prime `ℓ ∤ n`, `e ≥ 1` and a character `ψ` of `Gal(E/ℚ)` with
  `ψ(−1) = (−1)^(e+1)`, the normalized length of `Ш_{ψ,e}(S)` with `S = {ℓ} ∪ {p : p ∣ f_ψ}` is
  at most `v_O(N·P_{e+2}·B_{e+1,ψ})`, and
  `Σ_{ℓ odd, ℓ∤n} log ℓ · length Ш⁻(E, ℓ, e) ≤ n log(16 N^{e+2} (e + 1)!)`. It lacks the module
  `(Φ/O)(ψ⁻¹χ_ℓ^{−e})` as a discrete `G_ℚ`-module, the unramified and decomposition-group
  conditions that cut out `Ш_{ψ,e}(S)` and `Ш¹(E, ℓ, e)`, the action of complex conjugation on
  `Ш¹(E, ℓ, e)` that defines `Ш⁻(E, ℓ, e)`, and `O`-lengths of these groups. The Bernoulli side,
  `DirichletCharacter.generalizedBernoulli` of the primitive character, exists.
* The étale bound (9.7): there is an absolute `C_K ≥ 1` such that for every prime `ℓ`, every
  totally complex number field `L ⊇ μ_ℓ` (`μ₄` if `ℓ = 2`) and every `E ≥ 1`,
  `H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))` is finite and its order `h` satisfies
  `log h ≤ (2|d_L|)^{(2E[L:ℚ])^{C_K}}`. It lacks `G_{L,S}` for `S` the places above `ℓ` and
  infinity, the `G_{L,S}`-module `ℤ_ℓ(E+1)`, and its continuous cohomology.
* The bounds for K-groups (9.8): an integer `R_m` depending only on `m` kills the kernel of the
  Hurewicz map `K_m(R) → H_m(GL(R); ℤ)` for every ring `R`, and for an absolute `C`, every
  number field `L` of degree `n` and `m ≥ 2`, the part of `K_m(𝒪_L)_tors` prime to `R_m` has order
  at most `exp((2|d_L|)^{(mn)^C})`. It lacks Quillen's K-groups of a ring (the plus construction
  `BGL(R)^+` and its homotopy groups) and the Hurewicz map.
* The vanishing of Bloch–Kato groups (14.1), with the splitting at reducible places (13.1): for a
  newform `f` of weight `k ≥ 2`, an abelian field `K`, a place `λ` with `(f, λ)` admissible over
  `K` and `1 ≤ r ≤ k − 1`, `r ≠ k/2`, `H¹_f(K, V_λ(f)(r)) = 0`; admissibility holds for `f`
  without complex multiplication when `V_λ(f)` is reducible on the decomposition group at `p`.
  It lacks the Galois representation `V_λ(f)` of a newform, admissible pairs, Momose's
  quaternion algebra, and the Bloch–Kato local conditions with the group `H¹_f`.

The class groups of cyclotomic fields and their eigenspaces are statable against Mathlib
(`ClassGroup`, `IsCyclotomicExtension`, `bernoulli`, Dirichlet characters), but Stickelberger
annihilation and the Herbrand–Ribet theorem belong to CyclotomicClassGroupsAndStickelberger, and
no headline of this roadmap is a statement about a class group. Two steps of Layer 9 are statable
in Mathlib and are not stated, because they are steps of the route to 9.4 and not headlines: the
bound `#(ℤ^ι/⟨Λ₀⟩)_tors ≤ b^{#ι}` for relations of `ℓ¹`-norm at most `b` (9.1), and the bound
`#H_j(S; ℤ) ≤ #S^{#S^j}` for a finite group `S` (9.2). The consequence
`log #H_m(GL_N(𝒪_L); ℤ)_tors ≤ (2|d_L|)^{(nN(m+1))^{c₃}}` of 9.4 is not stated separately.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.BernoulliBoundsForClassGroupEigenspaces

open NumberField

/-! ## Layer 9: Explicit torsion bounds for K-groups -/

/-- **Torsion bound for the homology of `GL_N(𝒪_L)`** (9.4). There is an absolute
constant `c₂` such that for every number field `L` of degree `n = [L : ℚ]` and discriminant
`d_L`, every `N ≥ 1` and every `m ≥ 0`, the integral homology `H_m(GL_N(𝒪_L); ℤ)` (group homology
with trivial coefficients `ℤ`) is a finitely generated abelian group, and its torsion subgroup
satisfies `log log #H_m(GL_N(𝒪_L); ℤ)_tors ≤ c₂ (m + 1) (n N)³ N log(2 |d_L| n N)`.

All primes are included. The route is that of README 9.2–9.4, by the method of C. Soulé, *Perfect
forms and the Vandiver conjecture* (1999), §2, whose Theorem 1 bounds the torsion of
`H_k(SL_N(ℤ); ℤ)` only modulo the primes `≤ N + 1`. -/
theorem log_log_card_torsion_groupHomology_GL_le :
    ∃ c₂ : ℝ, ∀ (L : Type) [Field L] [NumberField L] (N m : ℕ), 1 ≤ N →
      Module.Finite ℤ (groupHomology (Rep.trivial ℤ (GL (Fin N) (𝓞 L)) ℤ) m) ∧
      Real.log (Real.log (Nat.card
          (AddCommGroup.torsion (groupHomology (Rep.trivial ℤ (GL (Fin N) (𝓞 L)) ℤ) m)))) ≤
        c₂ * (m + 1) * (Module.finrank ℚ L * N) ^ 3 * N *
          Real.log (2 * |(discr L : ℝ)| * Module.finrank ℚ L * N) := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.BernoulliBoundsForClassGroupEigenspaces

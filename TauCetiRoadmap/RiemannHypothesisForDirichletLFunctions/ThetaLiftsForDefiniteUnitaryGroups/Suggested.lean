import Mathlib

/-!
# Theta lifts for definite unitary groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about the dual pair `(U(V), U(W))` formed by the unitary groups of a
Hermitian space `V` and a skew-Hermitian space `W` over a CM extension `E/F` of number fields: the
groups `U(V)(𝔸_F)`, `U(W)(𝔸_F)` of adelic points of these group schemes over `F`
(HermitianFormsAndLattices §0.1), the automorphic forms on them, which for totally definite spaces
are algebraic modular forms on finite class sets (AutomorphicFormsOnReductiveGroups §7.4), and the
Weil representation of `U(V)(𝔸_F) × U(W)(𝔸_F)` on Schwartz–Bruhat functions with its theta kernel
(MetaplecticAutomorphicForms §§3.3, 5.1; ThetaKernelsForUnitaryDualPairs §4.4a). Neither Mathlib
nor Tau Ceti has these carriers at the pins. Mathlib has the predicate `NumberField.IsCMField`, the
adele rings `NumberField.AdeleRing` and `IsDedekindDomain.FiniteAdeleRing`, and the unitary group
`Matrix.unitaryGroup` of square matrices over a ring with involution; this gives the points of
`U(n)` in one coefficient ring, not the group scheme of a Hermitian space over `F`, its adelic
points with their topology and Haar measures, its lattices and class sets, or the automorphic
forms on it. Tau Ceti has Hecke characters `TauCeti.GlobalNumberFields.HeckeCharacter` and the
theta series `ZLattice.thetaSeries` of a lattice in a real inner-product space on the upper
half-plane, which are neither Weil representations of unitary dual pairs nor theta kernels on
adelic unitary groups.

* The lift is a class-set operator, and its kernel is a theta function (1.2, 1.4, 1.6–1.8): for
  totally definite `V` of dimension `n` and `W` of dimension `d`, a test vector `φ` and a form `f`
  of level `K`, `θ_φ(f)(h) = vol(K_∞K) · Σ_c |Γ_c|⁻¹ ∫_{K_∞} θ(k t_c, h; φ) f(k t_c) dk` over
  representatives `t_c` of the class set with finite stabilisers `Γ_c`; at finite adelic points the
  theta kernel is the Fock-space pairing of the archimedean polynomial with an entire function
  which, when `nd > 0` and the finite test vector is a lattice vector, is the theta function, of
  `L²` norm that of the vector, of a principally polarised abelian variety of dimension
  `nd[F : ℚ]` with multiplication by an order of `E`; the adjoint of the lift is the lift with the
  conjugate kernel; and if the kernel divided by a scalar `Ω` preserves given lattices, then
  `D_K · Ω⁻¹` times the lift maps integral forms to integral forms, `D_K = lcm_c |Γ_c|` dividing
  Minkowski's number for the finite subgroups of `GL_{2n[F:ℚ]}(ℚ)`. It lacks, besides the carriers
  above, the Fock model of the Weil representation at a real place with its Bargmann transform, the
  self-dual lattices of the finite adelic symplectic space with their lifts to the Heisenberg group
  and their lattice vectors, and the line bundles of a polarised complex torus with their sections.
* Weights and Satake parameters (2.1, 2.2, 2.4, 2.5): at each real place the weight of a lifted
  form is given by the `(GL_n, GL_d)`-duality on polynomials in `n × d` matrices in one of two
  mirror forms, according to the sign `ε_v = −sgn(V_v)·sgn(W^♭_v)`; for `n ≤ d`, at a place `w`
  split in `E` where the splitting characters `χ_V`, `χ_W` are unramified, a Hecke eigenform with
  Satake parameter `(α_1, …, α_n)` whose lift is nonzero lifts to an eigenform with parameter
  `(cα_1⁻¹, …, cα_n⁻¹)` together with the segment `χ_V(ϖ_w)q_w^{(d−n−1)/2 − i}`, `0 ≤ i < d − n`,
  `c` the ratio of the two splitting characters at `ϖ_w`; and every constituent of the lift of a
  representation `π` with a weak base change `BC(π)` has the weak base change
  `BC(π)^∨ ⊗ (χ_V/χ_W) ⊞ (segment)`. It lacks, besides these carriers, the `K_∞`-types of
  automorphic forms, the spherical Hecke algebras of `GL_n(E_w)` with their Satake parameters, and
  weak base change from `U(V)` to `GL_n(𝔸_E)`.
* Nonvanishing through the Rallis inner product formula (3.3, 4.2, 4.3). The formula itself is
  imported from ThetaKernelsForUnitaryDualPairs §6.13a (i), of which 3.2 states the definite
  instance: for factorizable `f₁`, `f₂` in an irreducible automorphic representation `π` of `U(V)`
  and a factorizable test vector `φ`, `⟨θ_φ f₁, θ_φ f₂⟩` is the value at `s₀ = (d − n)/2` of
  `C · L^S(s + ½, π × χ_W)/d^S(s) · ∏_{v ∈ S} Z_v(s)`, with `C = 2` for `d > n` and `C = 1` for
  `d ≤ n`, for every `d ≥ 1`. The headlines are its consequences: for `d ≥ 2n + 1` the `L`-value
  is an absolutely convergent nonzero Euler product, `θ_φ^* θ_φ` acts on the `π`-isotypic forms of
  level `K = ∏_v K_v` (`K_v` the stabiliser of the lattice at the finite `v ∉ S`) as
  `C · L^S(s₀ + ½, π × χ_W)/d^S(s₀)` times `⊗_{v ∈ S} π_v(Z_v)`, and the lift of `π` is nonzero
  exactly when the weight of `π` occurs at every real place (proved by the roadmap's own routes;
  the formal proof gives only the direction from the weights to a nonzero lift, for standard
  spaces and `d` at least an unspecified `d₀`, 4.2–4.3). It lacks, besides these
  carriers, the standard `L`-function `L^S(s, π × χ_W)` of an
  automorphic representation of `U(V)`, the local doubling zeta integrals `Z_v` with their
  normalising factors `d_v`, and the Petersson inner product on `U(W)(F)\U(W)(𝔸_F)`.
* The trivial representation and complementary spaces (5.2, 5.4, 6.11, 6.12): the squared norm
  of the lift of the constant functions is `∏_{i=0}^{n−1} L_E(d/2 − i, χ_W)` times normalised local
  factors; the genus average of the Hermitian theta series of a totally positive definite lattice
  is the mean over `U(V)` of the theta kernel of its lattice vector on `U(k, k)` and a Siegel
  Eisenstein series divided by `1` or `2`; and for Hermitian `V`, `V′` of dimensions `a > a′` with
  `a ≡ a′ (mod 2)` and skew-Hermitian `W` with `δ⁻¹W ≅ V ⊕ V′(−1)`, of signatures `(a − p, p)`,
  `(q, a′ − q)` at every real place with `2(p + q) + 1 < (a − a′)/2` and `2(p + q) + 1 < a′`,
  splitting characters `β`, `α` of `V`, `V′` whose infinity types differ by `κ_v < −(a + a′)` at
  every real place, and the place conditions of 6.1, the theta integrals of the trivial
  representations of `U(V)` and `U(V′)` on `U(W)` are nonzero and agree on matched test vectors up
  to a nonzero constant, which changes along the tower by an explicit partial Hecke `L`-value, a
  value of `α/β` on an ideal and, at the split places where `α/β` is ramified, Gauss sums of `α/β`
  times explicit factors. It lacks, besides
  these carriers, Hermitian theta series on `U(k, k)`, Siegel Eisenstein series, the theta
  integrals of unitary groups that are not compact at infinity with their invariant extension, and
  the local theta quotients with their matching data.

The rank-one cases worked in the Checks (`n = d = 1`, where the lift of a character of `E¹` is a
theta value times a Hecke character) are weaker statements than the headlines, and the
divisibility of the orders of the finite stabilisers by Minkowski's number is a step of the route
to the integrality statement of the first headline, not a headline; neither is stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ThetaLiftsForDefiniteUnitaryGroups

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ThetaLiftsForDefiniteUnitaryGroups

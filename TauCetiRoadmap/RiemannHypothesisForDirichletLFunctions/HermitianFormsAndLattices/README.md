# Roadmap: Hermitian forms and lattices

**Summary.** Let `E/F` be a quadratic étale algebra with its nontrivial involution `x ↦ x̄`: a
separable quadratic field extension, or `F × F` with the swap. A Hermitian space is a finite free
`E`-module `V` with a nondegenerate form `h`, conjugate-linear in the first variable, linear in the
second, with `h(y, x) = h(x, y)‾`; a skew-Hermitian space has `h(y, x) = −h(x, y)‾`. This roadmap
develops the arithmetic of these forms and of their lattices, the Hermitian counterpart of what Tau
Ceti has for quadratic forms: Witt theory and Jacobson's reduction to quadratic trace forms; the
unitary groups `U(V)` and `SU(V)` as group schemes; the classification of Hermitian spaces over
local fields and over number fields; Hermitian lattices over the integers of a number field, with
their duals, volumes, Jordan splittings, unimodular and maximal lattices, genera and class sets;
Tamagawa numbers, masses and local densities; Siegel's main theorem; theta series of definite
Hermitian lattices; and the dimension of spaces of algebraic modular forms on a definite unitary
group.

The headline theorems are these.

- *Landherr's theorem.* Let `E/F` be a quadratic extension of number fields. Two Hermitian spaces
  over `E` are isometric if and only if they are isometric at every place of `F`. Given, for some
  `n ≥ 1`, a Hermitian space `V_v` of dimension `n` over `E_v` at every place `v`, almost all of
  them with trivial determinant class, there is a Hermitian space over `E` with these
  localizations if and only if `∏_v η_v(det V_v) = 1`, where `η_v` is the quadratic character of
  `F_v^×` with kernel the norms from `E_v`.
- *The Tamagawa number.* For a quadratic extension of number fields `E/F` and every Hermitian
  space `V` of dimension `n ≥ 1`, `τ(U(V)) = 2`. The proof is Weil's: `τ(G_m) = 1`, the exact
  sequence `1 → G_m → Res_{E/F} G_m → U(1) → 1` gives `τ(U(1)) = 2`, and a rank-one mean-value
  theorem for theta functions shows that `U(V)` and the stabilizer of a vector have the same
  Tamagawa number, which reduces every dimension to dimension one.
- *The mass formula.* Let `F` be totally real of degree `d`, `E/F` a CM extension, `V` a totally
  definite Hermitian space of dimension `n ≥ 1`, and `L ⊂ V` an `O_E`-lattice. The mass
  `mass(L) = Σ 1/|U(M)|`, summed over the classes `M` of the genus of `L`, is
  `2·|d_F|^{n²/2}·N(𝔡_{E/F})^{n(n+1)/4}·N(𝔳(L))^n·∏_{k=1}^{n} ((k−1)!/(2π)^k)^d·∏_{k=1}^{n} L(k, η^k)·∏_{v∈S(L)} β_v^⋆/β_v(L)`,
  where `𝔳(L)` is the volume ideal of `L`, `S(L)` is the finite set of finite places at which
  `E/F` ramifies or `L_v` is not unimodular, and `β_v(L)` is the local density of `L_v`. For
  maximal lattices, in either of the two standard senses and with no ramified place above `2`,
  every factor is explicit; for `E = ℚ(√−3)` and `L = O_E^n` with the standard form the mass is
  `1/(6^n n!)` for `n ≤ 5`.
- *Siegel's main theorem.* In the same setting with `V` totally positive definite, for
  `1 ≤ k ≤ n − 1` and every totally positive definite Hermitian `k × k` matrix `T`, the
  mass-weighted average over the genus of `L` of the number of `X ∈ M^k` with Gram matrix `T` is
  `α_∞(L, T)·∏_v α_v(L, T)`, a product of local densities; equivalently, the genus average of the
  degree-`k` Hermitian theta series of `L` has these Fourier coefficients. The same holds for
  primitive representations with primitive local densities, which counts primitive sublattices of
  a given genus. In Weil's form the theorem holds for every nondegenerate space: the mean over
  `U(V)(F)\U(V)(𝔸)` of the sum of a Schwartz–Bruhat function over the rational points of
  `{X : T_X = T}` is its integral over the adelic points of `{X : T_X = T}` for the restricted
  product of the local fibre measures, which is the product of the local orbital integrals when the
  function is a product of local factors (the archimedean places taken together).

These headline theorems are classical and are stated here in their published generality. The formal proof that the
family follows uses Landherr's Hasse principle for CM fields (3.1), the mass formula for CM extensions unramified at
every finite place, totally positive definite spaces and integral lattices, up to the mass of the lattices of rank one
(6.3), and Siegel's main theorem in Weil's form for CM extensions and `2k < n` (6.5(a)); the targets concerned state
these forms under the label *The form of the formal proof*. The value `1/(6^n n!)` over `ℚ(√−3)` is at a ramified
extension, outside that setting.

The roadmap builds on
[GeometryOfNumbersAndQuadraticArithmetic](../../GeometryOfNumbersAndQuadraticArithmetic/README.md), which owns the Hermitian spaces over
a field with involution, Witt's and Jacobson's theorems, the classification of Hermitian spaces over local fields and
over number fields, the local theory of Hermitian lattices, special genera, neighbours and local densities, of which
many sections here are corollaries, the carrier of integral Hermitian lattices, the Hermitian counts over
finite fields, the local densities over unramified extensions, and the quadratic rank-one Weil
operators and fibre distributions through which the Tamagawa number is computed; on
[GlobalQuadraticForms](../../GlobalQuadraticForms/README.md), through which the classification over number
fields passes by the trace form; on [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md) (adelic
points, lattice stabilizers, Tamagawa measures and the Tamagawa numbers of tori, class numbers, the mass of a level,
strong approximation) and on [OrbitMeasuresOnAdelicGroups](../OrbitMeasuresOnAdelicGroups/README.md)
(`τ(G_m) = 1`, the Tamagawa numbers of quotients by central induced tori and of groups with a unipotent
radical, and the quotient of Tamagawa measures on a homogeneous space); and on
[AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md) (algebraic modular
forms for groups compact at infinity) and [DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md) (the mass of a level and the dimension
formula). In the family
[RiemannHypothesisForDirichletLFunctions](../README.md) it supplies class sets, masses, Landherr's
theorem, Siegel's main theorem, the lattice lemmas of Layer 4 and the gluing of lattices along
discriminant forms to [ThetaLiftsForDefiniteUnitaryGroups](../ThetaLiftsForDefiniteUnitaryGroups/README.md),
to [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) and to the roadmaps on
chains of theta lifts built on them.

Layer 0 constructs the unitary groups and the section of the determinant, and proves their
reductive structure. Layer 1 is the algebra of Hermitian forms over a quadratic étale algebra.
Layer 2 classifies Hermitian spaces over local fields and decides when local unitary groups are
compact; Layer 3 classifies them over number fields. Layer 4 is the local and global theory of
Hermitian lattices, beginning with lattices over a Dedekind domain: gluing from local data,
duality under orthogonal projection and intersection,
and the index of two lattices over a discrete valuation ring with its uniformity on subspaces; it
ends with the discriminant forms of integral lattices, the gluing of unimodular lattices along them,
the number of sublattices of given index, the integral lattices meeting two orthogonal
subspaces, and bounds for short vectors of duals over CM fields and for short generators of lattices
over number fields. Layer 5 defines genera, class sets and masses and proves the finiteness, stabilizer,
neighbour and dimension statements. Layer 6 computes the Tamagawa numbers of the norm-one torus and
of unitary groups (through Weil's rank-one identity) and local densities, expressed for integral
lattices through their discriminant forms where the trace is onto, proves the mass formula, counts
the unimodular lattices meeting a subspace in a given lattice, bounds the total mass of the integral
lattices of given discriminant and a weighted count of subspaces, and proves Siegel's main theorem,
with the volumes of stabilisers.
Layer 7 treats Hermitian theta series of definite lattices.

## Conventions

**Coefficients.** `F` is a field and `E` a commutative `F`-algebra, free of rank two and étale
(Mathlib `Algebra.IsQuadraticExtension F E` with `Algebra.Etale F E`): a separable quadratic field
extension of `F`, or `F × F`. Its involution `σ`, written `x ↦ x̄`, is its unique nontrivial
`F`-algebra automorphism; every statement carries it as an explicit ring homomorphism
`σ : E →+* E` with `σ ∘ σ = id`, fixing `F` and different from the identity. It is never a global
`StarRing` instance: for `E = F × F` it is the swap `(a, b) ↦ (b, a)`, whereas Mathlib's star on a
product is componentwise. When `E` is a field with a star whose star is this involution,
`σ = starRingEnd E`. `N = N_{E/F}`, `Tr = Tr_{E/F}`, `E^1 = ker N`. Layer 1 holds over every `F`,
of any characteristic, except where a target says otherwise. The local statements of Layers 2 and 4
and of 6.1, 6.1a and 6.1d are over `ℝ`, `ℂ`, or a nonarchimedean local field of characteristic
different from `2` (every residue characteristic), except that 2.1 and 2.4 hold in every
characteristic; 4.0(f), (g), 4.0a, 4.0b, 4.8 and 4.9 are stated over a Dedekind domain (with an
involution) or a discrete valuation ring, and their clauses at a place are over such a local field.
The global statements are over a number field. For a place `v` of a number field `F` write
`E_v = E ⊗_F F_v`; at a finite `v`, `O_v`, `ϖ_v`, `k_v` and `q_v = |k_v|` are the ring of integers,
a uniformizer, the residue field and its size; `v` is split, inert or ramified according to `E_v`,
and dyadic if `q_v` is even. At a nonsplit finite `v`, `𝔓` is the prime of `E_v` and `Π` a
uniformizer of `E_v`, chosen with `Π̄ = −Π` when `E_v/F_v` is ramified and `v` is nondyadic.

**Spaces.** A Hermitian space is a finite free `E`-module `V` of rank `n ≥ 0` (for `E = F × F`,
equivalently a finitely generated projective module of constant rank) with a `σ`-sesquilinear form
`h : V →ₛₗ[σ] V →ₗ[E] E` such that `LinearMap.IsSymm h` and `LinearMap.Nondegenerate h`; a
skew-Hermitian space has `σ(h(x, y)) = −h(y, x)` in place of `LinearMap.IsSymm h`. Every target is
stated for such unbundled forms with these hypotheses. For a field `E` these are
GeometryOfNumbersAndQuadraticArithmetic's `SignedHermitianSpace E V 1` and
`SignedHermitianSpace E V (−1)` (GeometryOfNumbersAndQuadraticArithmetic §2.9). A *subspace* is an `E`-submodule that is free (automatic for
a field; for `E = F × F` it means that its two components have the same dimension). A vector `x` is
*isotropic* if `h(x, x) = 0` and `Ex` is free of rank one (for a field, `x ≠ 0`; for `E = F × F`,
both components of `x` are nonzero); `V` is *anisotropic* if it has no isotropic vector. For
`X = (x_1, …, x_k) ∈ V^k`, its Gram matrix is `T_X = (h(x_i, x_j))_{i,j}`; in coordinates `V = E^n`
with Gram matrix `H`, `T_X = X^* H X`, `X^* = σ(X)^T`.

**Sesquilinearity.** Forms are conjugate-linear in the first variable and linear in the second:
`h(ax, by) = ā b h(x, y)`. This is Mathlib's convention for sesquilinear forms over a star ring
(`V →ₗ⋆[E] V →ₗ[E] E`), for `Matrix.IsHermitian` and for `star x ⬝ᵥ A *ᵥ y`, and that of
GeometryOfNumbersAndQuadraticArithmetic §§2.7 and 2.9. The literature on unitary Shimura varieties
uses forms linear in the first variable; 1.0 compares the two.

**Invariants of a space.** `det V ∈ F^×/N(E^×)` is the class of the determinant of a Gram matrix.
At a place `v`, `η_v : F_v^× → {±1}` is the character with kernel `N(E_v^×)` (trivial when `v`
splits; the sign at a real place inert in `E`), and `η = ∏_v η_v` is trivial on `F^×`. At a real
place `v` inert in `E`, `V_v` has a signature `(p_v, q_v)`, and `η_v(det V_v) = (−1)^{q_v}`. The
normalized sign of a local space of dimension `n` is `ε(V_v) = η_v((−1)^{n(n−1)/2} det V_v)`.

**Definiteness.** `V` is *definite at* a real place `v` inert in `E` if `h(x, x)` has a constant
sign on `V_v ∖ 0`, positive or negative (`p_v q_v = 0`). `V` is *totally definite* if `F` is totally
real, `E` is totally imaginary (so `E/F` is a CM extension) and `V` is definite at every real place
of `F`, the sign depending on the place; it is *totally positive definite* if moreover `V_v` is
positive definite at every real place. A totally definite space becomes totally positive definite
after multiplying `h` by a suitable `c ∈ F^×`, which changes neither the unitary group nor the
lattices, genera, classes, stabilizers and masses (2.5(e), 5.6(b)).

**Skew-Hermitian spaces.** Fix a trace-zero `δ ∈ E^×`. A skew-Hermitian `W` has the Hermitian
companion `δ^{−1}W` (1.6), and the determinant class, signatures and sign `ε` of `W` are by
definition those of `δ^{−1}W`. At a real place `v` inert in `E` and an embedding `τ : E → ℂ` above
`v`, the Hermitian form `i·τ(w(x, y))` on `W ⊗_{E,τ} ℂ` has the signature of `δ^{−1}W` at `v` when
`Im τ(δ) < 0`, and the reversed signature when `Im τ(δ) > 0`. The lattice notions of `W` (dual,
scale, unimodularity, primitivity) are defined directly by `w`, with the formulas below for `h`
replaced by `w`, not through `δ^{−1}W`: a lattice unimodular for `w` is `δ^{−1}O_E`-modular for
`δ^{−1}w`.

**Lattices.** Over a number field or a nonarchimedean local field, a lattice in `V` is an
`O_E`-submodule `L ⊆ V` with `Submodule.IsLattice E L` (finitely generated, spanning `V`), where `O_E`
is the integral closure of `O_F` in `E`; no integrality is assumed. Its dual is
`L^∨ = {x : h(x, L) ⊆ O_E}`; its scale `s(L)` is the `O_E`-span of `h(L, L)`; its norm `n(L)` is the
`O_F`-span of the `h(x, x)`, `x ∈ L`; its volume `𝔳(L)` is the fractional `O_F`-ideal generated by the
Gram determinants `det T_X`, `X ∈ L^n` (at a finite place, the ideal of the Gram determinant of an
`O_{E_v}`-basis of `L_v`; if `L = ⊕ 𝔞_i x_i` with Gram matrix `H`, then
`𝔳(L) = N_{E/F}(∏ 𝔞_i)·det H`). `L` is integral if `s(L) ⊆ O_E`, `𝔄`-modular (for a fractional ideal
`𝔄 = 𝔄̄`) if `L^∨ = 𝔄^{−1}L`, unimodular if `L^∨ = L`. A vector `x ∈ L` is *primitive* in `L` if
`O_E x` is free of rank one and `L/O_E x` is torsion-free; at a nonsplit finite place this is
`x ∉ 𝔓L_v`, and at a split place, where `L_v = (Λ, Λ′)` (2.3), it is `x_1 ∉ ϖ_vΛ` and `x_2 ∉ ϖ_vΛ′`. A
sublattice `N ⊆ L` is primitive if `L/N` is torsion-free. The two notions of maximal lattice,
*scale-maximal* and *norm-maximal*, are those of 4.4. `U(L)` is the stabilizer of `L` in `U(V)(F)`,
`U(L_v)` that of `L_v` in `U(V)(F_v)`, `K_L = ∏_{v<∞} U(L_v) ⊂ U(V)(𝔸_f)`, and `𝒰_{L_v}` is the
integral model of 4.6. An integral `L` has the discriminant module `A_L = L^∨/L` with its discriminant
form `b_L` and isometry group `O(A_L)` (4.8); at a finite place `t(L_v)` is the minimal number of
generators of `A_{L_v}`, the invariant `t` of GeometryOfNumbersAndQuadraticArithmetic 2.7.3 when `E_v`
is a field: the sum of the ranks (not the number) of the Jordan constituents of positive scale, and the
corank of the reduction modulo `𝔓` of a Gram matrix of `L_v` (4.8(b)); it is always written with its
argument.

**Genus, class, mass.** Lattices are compared inside one fixed space `V`. `M` is in the genus of `L`
if `M_v = g_v L_v` with `g_v ∈ U(V)(F_v)` at every finite `v`, and in the class of `L` if `M = gL`
with `g ∈ U(V)(F)`. By 2.5(f), `M` is in the genus of `L` if and only if, at every finite `v`, `M_v = (gL)_v` for
some `g ∈ U(V)(F)` depending on `v`. For totally definite `V` and a compact open `K ⊂ U(V)(𝔸_f)`, `mass(K)` is the
mass `Σ_{g ∈ U(V)(F)\U(V)(𝔸_f)/K} 1/|U(V)(F) ∩ gKg^{−1}|` of the level `K` for the group
`U(V)` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a), and `mass(L) = mass(K_L)`. Mass is never defined
before the class set is proved finite.

**Measures and densities.** At a finite place, Haar measures on `End_{E_v}(V_v)` and on the
`F_v`-space `Herm(V_v)` of Hermitian forms on `V_v` are normalized to give volume one to
`End(L_v)` and to `Herm(L_v) = {S : S(L_v, L_v) ⊆ O_{E_v}}`. At the archimedean places the Haar
measures on `End(V) ⊗_F F_∞` and `Herm(V) ⊗_F F_∞` give covolume one to `End(L)` and `Herm(L)`.
The local densities `β_v(L)` and `α_v(L, T)` are the stabilized normalized counts of 6.1(a), defined by
congruences for integral `L_v` and extended to every lattice by rescaling the form; `β_v(L)` is the
volume of `U(L_v)` for a Haar measure `μ_L` of `U(V)(F_v)` defined by these counts, in every
characteristic different from `2` and every residue characteristic, the dyadic completions of a number
field included (6.1(g)); in characteristic zero `β_v(L)` and `α_v(L, T)` are the volumes of `U(L_v)`
and of `{X ∈ L_v^k : T_X = T}` for the residue (fibre)
measures of `X ↦ h(X·, X·)` and `X ↦ T_X` (6.1(f)); at the archimedean places `β_∞(L)` is the volume
of `U(V)(F_∞)` for the fibre measure on `F_∞` as a whole (6.1(f)). The Haar measures on `V^k` are
normalized in the same way by `L^k`. The products over all places of these lattice-normalized Haar
measures on `End(V)_𝔸`, `Herm(V)_𝔸` and `(V^k)_𝔸` give the rational points covolume one: they are
the Tamagawa measures of these vector groups. The Tamagawa measure of an algebraic group is that of
AdelicAlgebraicGroups §2.4 (for a group with a unipotent radical, OrbitMeasuresOnAdelicGroups §2.6
*tamagawa-measure-unipotent-radical*); the measure `|ω|` of a top form on a smooth variety and the
quotient of Tamagawa measures on a homogeneous space are those of OrbitMeasuresOnAdelicGroups §2.6
*top-form-measure* and *homogeneous-gauge-measure*. For `U(V)` with `n ≥ 1` the convergence factors are `L_v(1, η_v)` and
the leading coefficient is `L(1, η)`, the character module being `ℤ` with the nontrivial element of
`Gal(E/F)` acting by `−1` (ReductiveGroups §9D.1). For `n = 0`, `U(V)` is the trivial group, its character module is
`0`, no convergence factors enter, and its Tamagawa number is `1`.
*Compact-dual measure.* For a CM extension `E/F` and `V` with the same signature `(p, q)` at every real place, `μ^c`
on `U(V)(F_∞)` is the product over the real places of the Haar measure `μ^c_{p,q}` of `U(p, q)` determined by:
`μ^c_{n,0}` is the probability measure of `U(n)`, and `μ^c_{p,q}` and `μ^c_{n,0}` have the same density at the identity
with respect to the Haar measures `λ` of the Lie algebras `𝔲(p, q)`, `𝔲(n) ⊂ M_n(ℂ)` for which `(a, b) ↦ a + ib`
carries `λ ⊗ λ` to Lebesgue measure of `M_n(ℂ)`. This is the archimedean normalisation of the formal proof (6.2(c)).
`μ^c` and the archimedean fibre measure normalized by a lattice `L` are Haar measures of `U(V)(F_∞)`, and the second
is `β_∞(L)·μ^c`, with `β_∞(L)` the value of the formula of 6.1b, for every `(p, q)` (route of 6.2(c)).

**L-values.** `ζ_K` is Mathlib's `NumberField.dedekindZeta K` and `κ_K` its residue at `s = 1`,
Mathlib's `NumberField.dedekindZeta_residue K`. `L(s, η) = ζ_E(s)/ζ_F(s)` for `Re s > 1`, and
`L(1, η) = κ_E/κ_F` (AnalyticNumberTheoryPartI §2.17a identifies it with the Hecke value).
`L(k, η^k)` is `ζ_F(k)` for even `k` and `L(k, η)` for odd `k`. Locally
`L_v(s, η_v^k) = (1 − q_v^{−s})^{−1}` for even `k`, and for odd `k` it is `(1 − q_v^{−s})^{−1}`,
`(1 + q_v^{−s})^{−1}` or `1` at split, inert and ramified `v`. `β_v^⋆(m) = ∏_{k=1}^{m} L_v(k, η_v^k)^{−1}`
and `β_v^⋆ = β_v^⋆(n)`.

**CM types and theta series.** For a CM extension `E/F`, a CM type `Φ` is a choice of one embedding
`τ_v : E → ℂ` above each real place `v` of `F`. `e(z) = exp(2πiz)`.
`ℋ_k = {Z ∈ M_k(ℂ) : (Z − Z^*)/2i positive definite}` is the Hermitian half-space,
`ℋ_k^Φ = ∏_{τ ∈ Φ} ℋ_k`, and `τ(T)` applies `τ` entrywise.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is not in [FormalProof]: its `*Origin:*` label says where it comes
from, and the route written here proves it, beside the deduction from the theorem that its `*Corollary of:*` line
names, if it has one. A declaration named may be the proposition stating the form (a definition of type `Prop`), not its
proof; one quantified over the proof's own datum, a CM field with auxiliary choices (6.2–6.4), states the form only for
the CM extensions such a datum carries, all unramified at every finite place.

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The definitions of 0.1, 1.0 and 1.7 carry the first label
only. The statements of 1.3, 1.5, 3.3, 4.3, 4.6 and 6.1b are not statements of [FormalProof]: 1.3, 1.5 and 4.3 state
published theorems in the form used here and cite the home section that states each; 3.3 (in characteristic `≠ 2`) is
a published theorem, cited with it; 4.6 adapts published theorems on integral models, its first two statements being
cited from its home; 6.1b adapts published archimedean densities to the normalisations of this roadmap. The parts
of 0.2 that ReductiveGroups §9D.1 does not state, the statements of 4.10, 5.8, 6.4a and 7.2, and the parts that each
label names are this roadmap's own formulations.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not
cover the whole section. The general theorem is proved in the roadmap that states it, and what the line covers is
deduced from it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only that case, not the general
theorem in full: the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of
the statement when that proof has a narrower one. Where the route given with the section is not the deduction, it is
a second proof, [FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists what that route
needs, and the deduction needs the section that the `*Corollary of:*` line names. Most `*Corollary of:*` lines of
this roadmap cover some clauses of their section only, and name them.

## Layer 0: unitary groups

### 0.1 The group schemes `U(V)`, `SU(V)` and `U(1)`

*Origin:* definitions and conventions.

For a Hermitian or skew-Hermitian space `(V, h)` over `E/F`, define the unitary group scheme `U(V)`,
the closed subgroup scheme of the Weil restriction `Res_{E/F} GL_E(V)` whose points over an
`F`-algebra `R` are the `E ⊗_F R`-linear automorphisms `g` of `V ⊗_F R` with
`h_R(gx, gy) = h_R(x, y)`; the norm-one torus `U(1)_{E/F} = ker(N : Res_{E/F} G_m → G_m)`; the
determinant `det : U(V) → U(1)_{E/F}`; and the special unitary group scheme `SU(V)`, its kernel.
API: `U(V)(F)` is the subgroup of `V ≃ₗ[E] V` of automorphisms preserving
`h`; isometries `V ≃ V'` induce isomorphisms of group schemes; a skew-Hermitian form `w` and the
Hermitian form `δ^{−1}w` (`δ ∈ E^×` of trace zero) have the same unitary group; for `V = E^n` with the standard form and
`σ = starRingEnd E`, `U(V)(F)` is Mathlib's `Matrix.unitaryGroup (Fin n) E` and `SU(V)(F)` is
`Matrix.specialUnitaryGroup (Fin n) E`. For `E = F × F` with idempotents `e_1, e_2`,
`V = V_1 ⊕ V_2` with `V_i = e_i V`, each `V_i` is totally isotropic, `h` restricts to a perfect
`F`-bilinear pairing `V_1 × V_2 → F`, and `g ↦ g|_{V_1}` is an isomorphism
`U(V) ≅ GL(V_1)` of group schemes over `F`. In characteristic `≠ 2` the decomposition `V ≅ A ⊕ A^∨`
and the group of isometries `GL(A)`, acting by `(g, (g^{−1})^∨)`, are MetaplecticAutomorphicForms
§3.2a; 0.1 adds characteristic two and the isomorphism of group schemes.

Route: Weil restriction of `GL_E(V)` (ReductiveGroupsPartII RG2.0a *weil-restriction-group-scheme*)
and the closed condition `g^* h g = h`; the norm-one torus is RG2.0a *norm-torus*. In the split
case `h(e_1x, e_1y) = σ(e_1)e_1 h(x, y) = e_2e_1 h(x, y) = 0`, and an `E`-linear `g` preserves both
`V_i`, its action on `V_2` being the inverse transpose of its action on `V_1` for the pairing.

*Needs:* ReductiveGroupsPartII RG2.0a; MetaplecticAutomorphicForms §3.2a (the split case in
characteristic `≠ 2`); Mathlib `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `LinearMap.IsSymm`,
`LinearMap.Nondegenerate`.

**Checks.**

- For `E = ℚ(i)`, `n = 1` and the standard form, `U(V)(ℚ) = {a ∈ ℚ(i) : aā = 1}`, which contains
  `(3 + 4i)/5`; the stabilizer of `ℤ[i]` is `{±1, ±i}`.
- For `E = F × F` with the swap and `n = 1`, `U(V)(F) = {(a, a^{−1})} ≅ F^×`, the antidiagonal of
  `E^× = (F^×)²` (a proper subgroup unless `F = 𝔽_2`). With Mathlib's componentwise star on `F × F`
  in place of the swap, the condition `star(z)·z = 1` defines `{(±1, ±1)} = μ_2 × μ_2` when the star
  of `F` is trivial (`TrivialStar F`, as for `ℚ` and `ℝ`), and `S¹ × S¹` for `F = ℂ` with complex
  conjugation (it contains `(i, 1)`); for `F ≠ 𝔽_2`, in either case `Matrix.unitaryGroup (Fin 1) (F × F)`
  is not the group `U(V)(F)` of the split algebra. For `F = 𝔽_2` both groups of `F`-points are
  `{(1, 1)}`, but the two involutions of `𝔽_2 × 𝔽_2` (the swap and the identity) differ, and so do the
  group schemes: over `𝔽_4` the first has the three points `(a, a^{−1})`, the second only `(1, 1)` (in
  characteristic two `a² = 1` forces `a = 1`). The involution must be the swap.

### 0.2 Reductive structure

*Origin:* published for a field `E` of characteristic `≠ 2`: Platonov and Rapinchuk (1994), second edition with
I. Rapinchuk (2023), §2.3.3 and Proposition 2.35 (3), the clauses of the structure of `U(V)` and `SU(V)` that
ReductiveGroups §9D.1 states (named in the `*Corollary of:*` line). This roadmap's own formulation: the other clauses
of the structure (the word outer, absolute almost simplicity for `n ≥ 2`), the whole structure for `E = F × F` and in
characteristic two, the homomorphic section `s_x` of `det` attached to a vector with `h(x, x) ≠ 0`, the existence of
such a vector (an elementary lemma), and the centre of `U(V)`.

*Method of the formal proof:* on groups of points, over number fields, their completions and their adeles: the
quasi-reflection `y ↦ y + (u − 1)h(x, x)^{−1}h(x, y)x` is checked directly to be unitary for `uū = 1`, multiplicative
in `u` and of determinant `u`, and a vector `x` with `h(x, x) ≠ 0` is found by polarisation, using `2 ≠ 0`. On these
groups of points the formal proof also writes every unitary matrix as a product of quasi-reflections and shows that a
character depends only on the determinant; for the groups of local and adelic points it shows that a central element
is a scalar: it commutes with the Cayley transforms of all skew-adjoint matrices, hence with all matrices. The route
written here finds the vector `x` through the nondegeneracy of the trace form of `E`, in every characteristic, and
reads the centre off `GL_E(V)` after base change.

*Corollary of:* ReductiveGroups §9D.1 (for a separable quadratic field extension in characteristic `≠ 2` and a
nondegenerate Hermitian or skew-Hermitian space of dimension `n ≥ 1`: `U(V)` is connected reductive and a form of
`GL_n` split by `E`, `SU(V)` is a simply connected semisimple form of `SL_n`, `det` is smooth and surjective with
kernel `SU(V)`, and `X^*(U(V)) = X^*(U(1)) ≅ ℤ` with the nontrivial element of `Gal(E/F)` acting by `−1`), for these
clauses when `E` is a field of characteristic `≠ 2`.

Let `n ≥ 1`. Prove that `U(V)` is connected reductive, with centre `U(1)` embedded
as scalars; for a field `E`
it is an outer form of `GL_n` split by `E` (`U(V) ⊗_F E ≅ GL_E(V)`), and for `E = F × F` it is
`GL_n` (0.1).
`SU(V)` is semisimple and simply connected, absolutely almost simple for `n ≥ 2`, a form of `SL_n`.
`det : U(V) → U(1)` is a smooth surjective homomorphism with kernel `SU(V)`, so
`U(V)/SU(V) ≅ U(1)` and `X^*(U(V)) = X^*(U(1)) ≅ ℤ`. For a field `E` the Galois action on this
character module factors through `Gal(E/F)`, whose nontrivial element acts by `−1`, so `U(V)` has no
nontrivial `F`-rational character; for `E = F × F`, `U(1) = {(a, a^{−1})} ≅ G_m` with trivial Galois
action, and `det : U(V) ≅ GL(V_1) → G_m` is a nontrivial `F`-rational character. For every `x ∈ V`
with `h(x, x) ≠ 0`, `V = Ex ⊕ x^⊥`, and the map
`s_x : U(1) → U(V)`, multiplication by `a` on `Ex` and the identity on `x^⊥`, is a homomorphic
section of `det`; hence `U(V) = SU(V) ⋊ U(1)` and `det` is surjective on `R`-points for every
`F`-algebra `R`, as soon as such an `x` exists; it exists whenever `n ≥ 1`.

*The form of the formal proof.* Over a number field with its involution, its completions and its adeles, for `x` with
`h(x, x) ≠ 0` and `u` with `uū = 1`: the quasi-reflection `y ↦ y + (u − 1)h(x, x)^{−1}h(x, y)x` is unitary, acts by
`u` on `Ex` and trivially on `x^⊥`, is multiplicative in `u` and has determinant `u`; and a nonzero Hermitian form has
a vector `x` with `h(x, x) ≠ 0` when `2 ≠ 0`.

Route: for `h(x, x) ≠ 0` (a nonzero element of `F`, hence a unit of
`E`) the projection `y ↦ h(x, x)^{−1}h(x, y)x` splits `V = Ex ⊕ x^⊥`, and `s_x(a)` preserves `h`
exactly when `aā = 1`. Existence for a Hermitian `h` and `n ≥ 1`: if `h(x, x) = 0` for all `x`, then
`Tr h(x, y) = h(x + y, x + y) − h(x, x) − h(y, y) = 0`, hence `Tr(λ h(x, y)) = 0` for all `λ ∈ E`,
and `h = 0` because the trace form of the étale `E` is nondegenerate; for a skew-Hermitian `w` apply
this to `δ^{−1}w`, which has the same unitary group (0.1). The centre: `U(V)_E ≅ GL_E(V)` by the split case of 0.1
(for `E = F × F`, `U(V) ≅ GL(V_1)` over `F`), whose centre is the group of scalars, and the scalars of `U(V)` are
`U(1)`.

The structure: base change along
`E ⊗_F E ≅ E × E` makes `V ⊗_F E` a space over a split algebra, so
`U(V)_E ≅ GL_E(V)` by the split case of 0.1, under which `det` becomes the determinant; reductivity,
connectedness, simple connectedness and surjectivity of `det` are geometric and are read off `GL_n`
and `SL_n` (ReductiveGroups Layer 6). The derived group is `SU(V)`, so the characters of `U(V)` are
those of `U(1)`. For a field `E`, `U(1)_E = {(z_1, z_1^{−1})} ≅ G_m` inside `E ⊗_F E ≅ E × E`, and the
nontrivial element of `Gal(E/F)` exchanges the two factors, hence maps the character
`(z_1, z_1^{−1}) ↦ z_1` to its inverse: it acts on `X^*(U(1)) = ℤ` by `−1`, and the `F`-rational
characters, the Galois-fixed ones, are `0`. For `E = F × F` no base change is needed:
`U(1) = {(a, a^{−1})}` is split over `F`.

*Needs:* 0.1; ReductiveGroups Layer 6; ReductiveGroups §9D.1 (the clauses of the `*Corollary of:*` line).

**Checks.**

- `n = 1`: `SU(V)` is trivial, `U(V) = U(1)` and `s_x` is the identity of `U(1)`; absolute almost simplicity is
  asserted only for `n ≥ 2`. `n = 0`: `U(V)` is the trivial group, `det` is not onto `U(1)` and `U(V)/SU(V)` is not
  `U(1)`, which is why the target assumes `n ≥ 1`.
- For a field `E` the Galois action on the character module is by `−1`: a rational character of
  `U(V)` over `F` is trivial, although `det` is a character over `E`. For `E = F × F` this fails:
  `U(V) ≅ GL(V_1)` (0.1), and `det` is a nontrivial character defined over `F`.

### Examples

For `E = ℚ(i)`, `n = 1` and the standard form, `U(V)(ℚ) = {a ∈ ℚ(i) : aā = 1}` contains `(3 + 4i)/5`, and the stabilizer of `ℤ[i]` is `{±1, ±i}`; for `E = F × F` with the swap and `n = 1`, `U(V)(F) = {(a, a^{−1})} ≅ F^×` (0.1). For `n = 1`, `SU(V)` is trivial and `U(V) = U(1)` (0.2).

### Dependencies

ReductiveGroupsPartII RG2.0a and MetaplecticAutomorphicForms §3.2a (0.1); ReductiveGroups Layer 6 and §9D.1 (0.2); Mathlib's unitary matrix groups and sesquilinear forms.

## Layer 1: Hermitian forms over a quadratic étale algebra

### 1.0 The two sesquilinearity conventions

*Origin:* definitions and conventions.

For a `σ`-sesquilinear `h : V →ₛₗ[σ] V →ₗ[E] E`, Mathlib's `LinearMap.flip h`,
`(flip h)(x, y) = h(y, x)`, is linear in the first variable and conjugate-linear in the second.
Prove that `flip` is a bijection from Hermitian forms conjugate-linear
in the first variable to Hermitian forms linear in the first variable, and the same for
skew-Hermitian forms; it preserves isometries, orthogonal complements, unitary groups, Gram
determinants, determinant classes and signatures; the Gram matrix of `flip h` in a basis is the
transpose `H^T` of the Gram matrix `H` of `h`, which is `σ(H)` for Hermitian `h` and `−σ(H)` for
skew-Hermitian `h`.

Route: `flip h (y, x) = h(x, y) = σ(h(y, x)) = σ(flip h (x, y))` for Hermitian `h`, and the same with a
sign for skew-Hermitian `h`; isometries and orthogonality are symmetric conditions; `det(H^T) = det H`,
which lies in `F` for Hermitian `h`; for skew-Hermitian `w` the determinant class and the signatures
are those of `δ^{−1}w` (Conventions), and `flip(δ^{−1}w) = δ^{−1}flip(w)`.

*Needs:* Mathlib `LinearMap.flip`, `LinearMap.IsSymm`.

**Checks.**

- On `ℂ` with `h(x, y) = x̄y`, `h(i, 1) = −i` and `flip h (i, 1) = i`; the two conventions give
  complex-conjugate Gram entries and the same real signature.
- The flip of a skew-Hermitian form is skew-Hermitian, not Hermitian. For `w(x, y) = i x̄y` on `ℂ` the
  Gram matrix is `[i]`; its transpose is `[i] = −σ([i])`, not the conjugate `[−i]`.

### 1.1 Orthogonal bases, Witt extension and cancellation

*Origin:* adapted from Scharlau (1985), Chapter 7, Witt's theorems for trace-valued ε-Hermitian forms over a field
with involution, and Kirschmer (2016), Theorem 2.1.4, the orthogonal basis: here over a quadratic étale algebra,
the split algebra `F × F` included.

*Method of the formal proof:* over a field with involution and `2 ≠ 0`: a nonzero form has a vector `x` with
`h(x, x) ≠ 0`, found by polarisation, which is split off by induction; isometries between subspaces are extended by
quasi-reflections `z ↦ z − a^{−1}h(v, z)v` with `a + ā = h(v, v)`, a degenerate subspace being first enlarged by
hyperbolic partners of its radical; cancellation follows from extension. The route written here covers every
quadratic étale algebra and every characteristic: it finds `x` through the nondegeneracy of the trace form; for a field
`E` it extends isometries one vector at a time by unitary reflections and transvections, which is the formal proof's
second argument for (b), and for `E = F × F` by linear algebra on `GL(V_1)`.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.9.3a (Witt's theorems over a field with a nontrivial
involution, in every characteristic: orthogonal bases, Witt extension, Witt cancellation), for a field `E`.

Prove: (a) every Hermitian space has an orthogonal basis
`x_1, …, x_n` with `h(x_i, x_i) ∈ F^×`, and every skew-Hermitian space `(W, w)` has an orthogonal
basis with `w(x_i, x_i) ∈ δF^×` for a trace-zero `δ ∈ E^×` (the values `w(x, x)` lie in
`ker Tr = δF`); (b) Witt extension: every isometry between subspaces of a
Hermitian space `V` extends to an element of `U(V)(F)`; (c) Witt cancellation:
`U ⊥ V ≅ U ⊥ V'` implies `V ≅ V'`; (b) and (c) hold for skew-Hermitian spaces as stated. No
hypothesis on the characteristic of `F` beyond étaleness of `E`.

Route: (a) a nondegenerate `h` on a space of positive rank has some `x` with `h(x, x) ≠ 0`, a unit
of `E` (0.2); split off `Ex` (0.2) and induct. For a skew-Hermitian `w`, `δ^{−1}w` is Hermitian
(`σ(δ^{−1}w(x, y)) = (−δ)^{−1}(−w(y, x)) = δ^{−1}w(y, x)`, as `δ̄ = −δ`) with the same orthogonal bases,
isometries and unitary group (0.1); an orthogonal basis for `δ^{−1}w` with values in `F^×` has
`w(x_i, x_i) ∈ δF^×`, and (b), (c) for `w` are (b), (c) for `δ^{−1}w`. (b), (c) for a field `E`: every
Hermitian form over a separable `E/F` is trace-valued (`h(x, x) ∈ F = Tr(E)`), and Witt's theorem for trace-valued
ε-Hermitian forms holds in every characteristic ([Scharlau], Chapter 7): induction on the dimension
of the subspace, moving one vector at a time by elements of `U(V)(F)` fixing a hyperplane pointwise,
the unitary reflections `y ↦ y + (λ − 1)h(x, x)^{−1}h(x, y)x`, `λ ∈ E^1`, for `h(x, x) ≠ 0`, and the
unitary transvections `y ↦ y + μ h(u, y)u` with `u` isotropic and `μ + μ̄ = 0` (these preserve `h`
because the cross terms are `(μ + μ̄)h(y, u)h(u, z) = 0`); (c) follows from (b). For `E = F × F`,
`U(V)(F) = GL(V_1)` (0.1); an isometry of subspaces is a pair of injections `W_1 → V_1`,
`W_2 → V_2 = V_1^*` compatible with the pairing, and it extends to an element of `GL(V_1)` by linear
algebra; every space of dimension `n` is isometric to the standard one (dual bases for the pairing
`V_1 × V_2 → F`), which gives (c).

*Needs:* 0.1, 0.2; GeometryOfNumbersAndQuadraticArithmetic §2.9 (`SignedHermitianSpace`,
`signedHermitianAdjoint`); Mathlib `LinearMap.IsOrthoᵢ`, `Algebra.trace`.

**Checks.**

- Over `𝔽_4/𝔽_2` (characteristic two) the form `h(x, y) = x̄_1 y_1 + x̄_2 y_2` has the orthogonal basis
  `e_1, e_2`; the isotropic vector `(1, 1)` satisfies `h = 1 + 1 = 0` and is not part of one.
- The nontrivial involution is essential to (a): for the trivial involution on `E = F` the
  alternating form `x_1 y_2 − x_2 y_1` is nondegenerate, every vector is isotropic, and there is no
  orthogonal basis.
- Over `ℂ/ℝ` the skew-Hermitian line `w(x, y) = i x̄y` has `w(x, x) = i|x|² ∈ iℝ^×` for `x ≠ 0`: no
  basis has diagonal values in `ℝ^×`; with `δ = i` they lie in `δℝ^×`, and `δ^{−1}w = x̄y`.
- Over `ℚ(i)/ℚ`, `⟨1⟩ ⊥ ⟨2⟩ ≅ ⟨1⟩ ⊥ ⟨1⟩` (because `2 = N(1 + i)`), and cancellation gives
  `⟨2⟩ ≅ ⟨1⟩`: the map `x ↦ (1 + i)^{−1}x` is an isometry from `⟨1⟩` onto `⟨2⟩`, and `x ↦ (1 + i)x`
  is its inverse, an isometry from `⟨2⟩` onto `⟨1⟩`.

### 1.2 Hyperbolic planes, Witt decomposition and Witt index

*Origin:* adapted from Scharlau (1985), Chapter 7, and Knus (1991), the Witt decomposition of a Hermitian space over a
field with involution: here over a quadratic étale algebra, isotropic vectors spanning free lines.

*Method of the formal proof:* over a field of characteristic zero: nondegeneracy gives vectors `g_a` dual to an
isotropic frame `e_a` and orthogonal to a nondegenerate complement, and `f_a = g_a − Σ_c ½h(g_c, g_a)e_c` makes them
isotropic, so that the space is the complement plus the hyperbolic planes spanned by `e_a`, `f_a`. The route written
here corrects the partner `y` of an isotropic `x` by `μx` with `μ + μ̄ = −h(y, y)`, which exists over every quadratic
étale algebra because the trace is onto `F`, where the formal proof takes `μ = −½h(y, y)`.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.9.3b (the Witt decomposition `ℍ^r ⊥ V_an` of a Hermitian
space over a field with a nontrivial involution, with `r` and `V_an` unique), for a field `E`.

The hyperbolic plane `H` is `E²` with Gram matrix `[[0, 1], [1, 0]]`. Prove that every isotropic
vector lies in a subspace isometric to `H`, which is an orthogonal summand; every Hermitian space
decomposes as `H^r ⊥ V_an` with `V_an` anisotropic, where `r` (the Witt index) and the isometry class
of `V_an` are unique. A space is hyperbolic if it is `H^r`; `det H = −1`.

Route: for `x` isotropic, `Ex` is a free direct summand, and nondegeneracy (the map
`y ↦ h(·, y)` from `V` to the `σ`-semilinear functionals is bijective) gives `y` with
`h(x, y) = 1`; choose `μ ∈ E` with `μ + μ̄ = −h(y, y)` (possible because `Tr` is onto `F` for
étale `E`); then `h(y + μx, y + μx) = h(y, y) + μ + μ̄ = 0`, and `x, y + μx` is a hyperbolic basis
of a nondegenerate plane, which splits off. Uniqueness of `r` and `V_an` by 1.1(c).

*Needs:* 1.1.

**Checks.**

- `⟨1, −1⟩` has the isotropic vector `(1, 1)` and is isometric to `H` over every `E/F`.
- Over `ℂ/ℝ`, `H` has signature `(1, 1)`. Over `ℚ(i)/ℚ`, `⟨1, 1⟩` is anisotropic (`N(x) + N(y) = 0`
  forces `x = y = 0`) while `⟨1, −1⟩ ≅ H`; `N(i) = 1`, and `−1` is not a norm from `ℚ(i)` (nor from
  `ℚ_2(i)`, as `(−1, −1)_2 = −1`).
- Over `E = F × F`, the vector `x = (1, 0)` of `⟨1⟩ = E` (form `x̄y`) has `h(x, x) = 0` but `Ex` is
  not free, and `x` lies in no hyperbolic plane; with the definition of the Conventions `⟨1⟩` is
  anisotropic, while the naive notion "`x ≠ 0` and `h(x, x) = 0`" would make the statement false.

### 1.3 Jacobson's theorem

*Origin:* published: Jacobson (1940), §2, the Theorem and formula (7), p. 267: a Hermitian space over a separable
quadratic extension in characteristic `≠ 2` is determined by its quadratic trace form.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For a separable quadratic field extension `E/F` with `char F ≠ 2`, to a Hermitian space `(V, h)`
attach the quadratic form `q_h(x) = h(x, x)` on the `2n`-dimensional `F`-space `V`. Prove that `h ≅ h'` if and only if `q_h ≅ q_{h'}`; and for
`E = F(√d)` and an orthogonal basis with `h(x_i, x_i) = a_i`, `q_h ≅ ⟨1, −d⟩ ⊗ ⟨a_1, …, a_n⟩`
([Jacobson], §2, the Theorem and formula (7), p. 267). In
particular `h` is isotropic if and only if `q_h` is.

This is GeometryOfNumbersAndQuadraticArithmetic §2.9.3c, read for the extension `E/F` in the place of `F/F₀`.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.9.3c.

**Checks.**

- `E = ℂ`, `F = ℝ`: `h = ⟨1, −1⟩` gives `q_h = ⟨1, 1, −1, −1⟩`, of signature `(2, 2)`, twice that
  of `h`.
- `⟨a⟩ ≅ ⟨b⟩` as Hermitian forms exactly when `a/b ∈ N(E^×)`. Over `ℚ(i)/ℚ` (`d = −1`), `⟨1⟩` and
  `⟨2⟩` are isometric (`2 = N(1 + i)`) and so are their trace forms `x² + y²` and `2x² + 2y²`;
  `⟨1⟩` and `⟨3⟩` are not, and neither are `x² + y²` and `3x² + 3y²` (the first does not represent
  `3` over `ℚ`).

### 1.4 The determinant class; the split case

*Origin:* adapted from Kirschmer (2016), Definition 2.1.3 (5), and Scharlau (1985), the determinant class of a
Hermitian space modulo norms over a field: here over a quadratic étale algebra, with the split algebra `F × F`, where
every Hermitian space is standard.

*Method of the formal proof:* for the change of basis: for a Gram matrix `G` and `G′ = P^T G σ(P)` with `P`
invertible, the determinant is multiplied by the norm `det P·σ(det P)`, by the multiplicativity of the determinant.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.9.2 (the determinant class of a nondegenerate Hermitian
space over a field with a nontrivial involution: well defined modulo norms, changing by `N(det g)`, multiplicative on
orthogonal sums), for the determinant class over a field `E`.

Prove that the determinant class `det V ∈ F^×/N(E^×)` does not depend on the basis, is
multiplicative under orthogonal sums, and changes by `N(det g)` under a change of basis `g`. For
`E = F × F`, `N(E^×) = F^×`, every Hermitian space of dimension `n` is isometric to the standard
one, its Witt index is `⌊n/2⌋`, and its anisotropic kernel is `0` for even `n` and `⟨1⟩` for odd `n`.
In characteristic `≠ 2` the isometry of every split space with the standard one is the case `ε = 1` of
MetaplecticAutomorphicForms §3.2a (every such space is `A ⊕ A^∨`); 1.4 holds in every characteristic.

Route: `det(g^* H g) = N(det g) det H`. In the split case `N(a, b) = ab`, so `⟨c⟩ ≅ ⟨1⟩` for every
`c ∈ F^×`; dual bases for the pairing `V_1 × V_2 → F` of 0.1 give the standard form; `⟨1, −1⟩ ≅ H`
(1.2) gives the Witt decomposition, and `⟨1⟩` is anisotropic because `h(x, x) = (ab, ab)` for
`x = (a, b)` vanishes only when `Ex` is not free.

*Needs:* 0.1, 1.1, 1.2; GeometryOfNumbersAndQuadraticArithmetic 2.9.2.

**Checks.**

- `det H = −1`; `det(H^r ⊥ ⟨a⟩) = (−1)^r a`.
- For split `E` and `n = 3`, `V ≅ H ⊥ ⟨1⟩` has Witt index `1`, not `0` and not `3/2`.

### 1.5 Finite fields

*Origin:* published: the uniqueness of nondegenerate Hermitian forms over a finite field and the order of the finite
unitary group, as stated, with their sources, in PotentialAutomorphyDworkMotivesPartII §0.7 and
GeometryOfNumbersAndQuadraticArithmetic 3.1.3.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Over `𝔽_{q²}/𝔽_q`, prove that every nondegenerate Hermitian space of dimension `n` is isometric to
the standard one, and `|U_n(𝔽_q)| = q^{n(n−1)/2} ∏_{j=1}^{n} (q^j − (−1)^j)`.

The first statement is PotentialAutomorphyDworkMotivesPartII §0.7, and the order is the embedding count of
GeometryOfNumbersAndQuadraticArithmetic 3.1.3 with `m = n` and radical zero.

*Needs:* PotentialAutomorphyDworkMotivesPartII §0.7; GeometryOfNumbersAndQuadraticArithmetic 3.1.3.

**Checks.**

- `|U_1(𝔽_q)| = q + 1` and `|U_2(𝔽_2)| = 18`, against `|GL_1(𝔽_q)| = q − 1` and `|GL_2(𝔽_2)| = 6`.
- Substituting `−q` in the polynomial `P_n(q) = |GL_n(𝔽_q)| = q^{n(n−1)/2}∏_{j=1}^{n}(q^j − 1)` gives
  `|U_n(𝔽_q)| = (−1)^n·P_n(−q)`; `n = 2`: `P_2(−q) = (q² − 1)(q² + q) = |U_2(𝔽_q)|`.

### 1.6 Skew-Hermitian forms and trace forms

*Origin:* published for a field `E`, with the sources cited in GeometryOfNumbersAndQuadraticArithmetic §§2.9.3 and
2.9.6: the twist of a skew-Hermitian form by a trace-zero scalar into a Hermitian one, and the transfer of an
ε-Hermitian form along the trace; for the split algebra `F × F` in characteristic `≠ 2` the trace form of (b) is the
trace-symplectic tensor of MetaplecticAutomorphicForms §3.2a; (a) for the split algebra, and both clauses in
characteristic two, are this roadmap's own formulation.

*Method of the formal proof:* for a skew-Hermitian form `w` (in the proof, the tensor product of a Hermitian and a
skew-Hermitian form), `σ(w(x, x)) = −w(x, x)` and the invariance of the trace under `σ` give `2·Tr w(x, x) = 0`, so
`Tr ∘ w` is alternating in characteristic zero. The label covers the alternating property in (b). The route written
here gets `Tr w(x, x) = w(x, x) + σ(w(x, x)) = 0` directly, in every characteristic and for the split algebra.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.9.3 (twisting a perfect Hermitian or skew-Hermitian form by
an invertible endomorphism equal to plus or minus its adjoint gives a perfect form of the product sign) and §2.9.6 (the
transfer `λ ∘ h` of a perfect ε-Hermitian form along a nonzero equivariant `λ` is perfect), for a field `E`: (a) with
the endomorphism `δ^{−1}`, and the nondegeneracy in (b) with `λ = Tr`.

(a) For a trace-zero `δ ∈ E^×`, prove that `w ↦ δ^{−1}w` is a bijection from skew-Hermitian to
Hermitian forms on `V`, compatible with isometries, orthogonal sums and unitary groups; changing `δ`
to `aδ`, `a ∈ F^×`, multiplies the Hermitian form by `a^{−1}`. The local and global classifications
of Layers 2–3 therefore apply to skew-Hermitian spaces, with the invariants of the Conventions.
(b) For a skew-Hermitian `W` (resp. Hermitian `V` and trace-zero `δ`), `Tr ∘ w` (resp. `Tr(δ h)`)
is a nondegenerate alternating `F`-bilinear form on the underlying `F`-space, and
`U(W) ⊂ Sp(Tr ∘ w)`. Over a CM field and integrally, for forms linear in the first variable (1.0), PELModuli M0.22
(`HermitianSpace.traceSkewHermitian`) is the same construction `Tr(δh)`.

Route: `σ(δ^{−1}w(x, y)) = δ̄^{−1}σ(w(x, y)) = (−δ)^{−1}(−w(y, x)) = δ^{−1}w(y, x)` because
`δ̄ = −δ`, so `δ^{−1}w` is Hermitian; the inverse is `h ↦ δh`, and isometries, orthogonal sums and
unitary groups are defined by the same equations for `w` and `δ^{−1}w`. (b) directly, for every quadratic
étale `E` and every characteristic: `Tr ∘ w` is `F`-bilinear because `w(cx, y) = c̄w(x, y) = cw(x, y)` for
`c ∈ F`. It is alternating, not merely skew-symmetric: `σ(w(x, x)) = −w(x, x)` gives
`Tr w(x, x) = w(x, x) + σ(w(x, x)) = 0` for every `x` (in characteristic two this is the stronger
condition). It is nondegenerate: if `Tr w(x, y) = 0` for every `y`, then `Tr(a·w(x, y)) = Tr w(x, ay) = 0`
for every `a ∈ E` and every `y`, so `w(x, y) = 0` for every `y` by the nondegeneracy of the trace form
`(a, b) ↦ Tr(ab)` of the étale `E` (Mathlib `traceForm_nondegenerate` for a field `E`;
`Tr((a, b)(c, d)) = ac + bd` for `E = F × F`), and `x = 0` by the nondegeneracy of `w`. An element of
`U(W)` preserves `w`, hence `Tr ∘ w`. For a Hermitian `h` and a trace-zero `δ`, `δh` is skew-Hermitian
(`σ(δh(x, y)) = −δh(y, x)`), and `Tr(δh)` is the case `w = δh`. For a field `E` (and the local fields of
GeometryOfNumbersAndQuadraticArithmetic §2.9) this is the transfer 2.9.6 (`signedHermitianTransfer`) with
`λ = Tr`, compared, not used.

*Needs:* 1.1; Mathlib `traceForm_nondegenerate`.

**Checks.**

- On `ℂ`, `w(x, y) = i x̄y` is skew-Hermitian; with `δ = i`, `δ^{−1}w = x̄y` is positive definite,
  and with `δ = −i` it is negative definite: the signature of a skew-Hermitian space depends on
  `δ`, which the Conventions fix.
- `Tr(i x̄y)` on `ℂ = ℝ²` is `−2(x_1 y_2 − x_2 y_1)`, alternating and nondegenerate.
- The split algebra in characteristic two: `E = 𝔽_2 × 𝔽_2`, `W = E` with `w(x, y) = x̄y` (skew-Hermitian,
  as `−1 = 1`). For `x = (a, b)`, `y = (c, d)`, `Tr w(x, y) = bc + ad`, the hyperbolic plane over `𝔽_2`:
  `Tr w(x, x) = 2ab = 0`, alternating and nondegenerate. Enumerating all nondegenerate skew-Hermitian
  forms of rank `1` and `2` over `𝔽_4/𝔽_2`, `(𝔽_2 × 𝔽_2)/𝔽_2`, `𝔽_9/𝔽_3` and `(𝔽_3 × 𝔽_3)/𝔽_3` confirms (b) in
  each case.

### 1.7 Base change

*Origin:* definitions and conventions.

For a field extension `F'/F` put `E' = E ⊗_F F'`, a quadratic étale `F'`-algebra (split even when
`E` is a field, if `F'` splits `E`) with involution `σ ⊗ 1`, and `V' = V ⊗_F F' = V ⊗_E E'` with the
form `h_{F'}` extending `h`. Prove that `h_{F'}` is Hermitian (resp.
skew-Hermitian) and nondegenerate, with the same Gram matrices as `h` in a basis of `V`; base change
commutes with orthogonal sums, isometries, the flip of 1.0 and `δ^{−1}` of 1.6, and is transitive
along `F ⊂ F' ⊂ F''`; `det V'` is the image of `det V` under `F^×/N(E^×) → F'^×/N(E'^×)`; and
`U(V) ⊗_F F' ≅ U(V')` as group schemes over `F'`, compatibly with `det`. In particular, for a place
`v` of a number field, `V_v = V ⊗_F F_v` is a Hermitian space over `E_v`.

Route: `σ ⊗ 1` is the nontrivial `F'`-automorphism of `E'`. The form `h_{F'}` is defined on pure
tensors by `h_{F'}(x ⊗ a, y ⊗ b) = h(x, y) ⊗ ab` and extended `(σ ⊗ 1)`-sesquilinearly through the
universal property of `V ⊗_F F'` (`TensorProduct.lift`, applied once in each variable, the first
time twisted by `σ ⊗ 1`); Mathlib's `LinearMap.baseChange` covers linear maps only, so this
construction and its API are part of the target. Nondegeneracy because the Gram determinant stays a
unit; the statement on group schemes from their functors of points (0.1).

*Needs:* 0.1, 1.4; Mathlib `TensorProduct.lift`, `LinearMap.baseChange`, `Algebra.TensorProduct`.

**Checks.**

- `ℚ(i) ⊗_ℚ ℚ_5 ≅ ℚ_5 × ℚ_5` because `5 = (2 + i)(2 − i)` splits; `⟨1⟩` over `ℚ(i)` becomes the split
  line, with unitary group `ℚ_5^×`.
- `⟨3⟩` over `ℚ(i)` has nontrivial determinant class, which stays nontrivial in
  `ℚ_3^×/N(ℚ_3(i)^×)` (`3` is inert, of odd valuation) and becomes trivial in
  `ℚ_5^×/N((ℚ_5 × ℚ_5)^×) = 1`.

### Examples

Over `ℚ(i)/ℚ`, `⟨1⟩ ⊥ ⟨2⟩ ≅ ⟨1⟩ ⊥ ⟨1⟩`, and `x ↦ (1 + i)^{−1}x` is an isometry from `⟨1⟩` onto `⟨2⟩` (1.1); `⟨1, −1⟩ ≅ H` over every `E/F`, while `⟨1, 1⟩` is anisotropic over `ℚ(i)/ℚ` (1.2); the trace forms of `⟨1⟩` and `⟨2⟩` over `ℚ(i)` are `x² + y²` and `2x² + 2y²` (1.3); `|U_1(𝔽_q)| = q + 1` and `|U_2(𝔽_2)| = 18` (1.5); `ℚ(i) ⊗_ℚ ℚ_5 ≅ ℚ_5 × ℚ_5` (1.7).

### Dependencies

Layer 0; GeometryOfNumbersAndQuadraticArithmetic §2.9, 2.9.2, 2.9.3c (1.3), 3.1.3; PotentialAutomorphyDworkMotivesPartII §0.7 (1.5); Mathlib's sesquilinear forms, trace forms and tensor products.

## Layer 2: local classification

### 2.1 Nonarchimedean places

*Origin:* published in characteristic zero: Kirschmer (2016), Theorem 3.2.3 and Corollary 3.2.4, and Jacobowitz
(1962), the classification of Hermitian spaces over a nonarchimedean local field by dimension and determinant class,
with isotropy in dimension at least three; in positive characteristic this roadmap's own formulation.

*Method of the formal proof:* only (a), as a criterion for the congruence of two Hermitian matrices, with `2 ≠ 0` in
`F`: a diagonal form `⟨a_1, …, a_n⟩` of rank at least two represents every `c ∈ F^×`, because, for `E = F(√d)`, the
quadratic form `Σ_i a_i(x_i² − d y_i²) − c t²` in at least five variables is isotropic, and induction on the rank splits
off one diagonal entry at a time. The isotropy of quadratic forms in five variables over a nonarchimedean local field is
proved directly, in every residue characteristic, from a basis that minimises `∏_i |q(e_i)|/|det|²` for an anisotropic
`q`. The route written here derives the classification from the index two of the norm group, by local reciprocity, and
from the fact that the norms together with `0` are not closed under addition.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.9.4a (the classification of Hermitian spaces over a
nonarchimedean local field of characteristic zero, in every residue characteristic, by dimension and determinant class,
both classes occurring in every dimension, with isotropy in dimension at least three), for `F` of characteristic zero.

Let `F` be a nonarchimedean local field (any characteristic, any residue characteristic) and `E/F`
a separable quadratic field extension. Prove:
(a) two Hermitian spaces are isometric if and only if they have the same dimension and the same
determinant class; (b) for every `n ≥ 1` both classes of `F^×/N(E^×) ≅ {±1}` occur as determinants;
(c) every Hermitian space of dimension `≥ 3` is isotropic, and one of dimension `2` is isotropic if
and only if `η(−det V) = 1`; every binary space represents every `c ∈ F^×`. In characteristic zero
these are [Kirschmer], Theorem 3.2.3 and Corollary 3.2.4, pp. 29–30.

Route: `[F^× : N(E^×)] = 2` by local reciprocity (ClassFieldTheory §6.1, `localArtinEquiv`, for every nonarchimedean
local field). The set `N(E^×) ∪ {0}` is not closed under addition. Suppose it were. Being closed in
`F`, stable under multiplication and containing `1`, it would contain every `m·1` with `m ∈ ℕ` and
hence, being closed, `−1 = lim_k (p^k − 1)·1` (`p` the residue characteristic); it would then be a
subfield, open because `N(E^×)` is open, hence equal to `F`, contradicting the index two. So there are
norms `a, b` with `a + b ∉ N(E^×) ∪ {0}`, and `⟨1, 1⟩` represents both classes; every binary
`⟨a, b⟩` does (directly if `a/b ∉ N(E^×)`, and as `a⟨1, 1⟩` otherwise), hence represents every
`c ∈ F^×`. (c): `⟨a, b, c, …⟩` is isotropic because
`⟨a, b⟩` represents `−c`, and `⟨a, b⟩` is isotropic iff `−b/a ∈ N(E^×)`. (a): split off hyperbolic
planes (1.2) until the dimension is at most two; a binary space represents `1` and is therefore
`⟨1, det⟩`, and a line is `⟨det⟩`; so `V ≅ H^r ⊥ ⟨(−1)^r det V⟩` for `n = 2r + 1`, and `V ≅ H^r` or
`H^{r−1} ⊥ ⟨1, (−1)^{r−1} det V⟩` for `n = 2r`, according to `η((−1)^r det V)`. (b): `⟨1, …, 1, a⟩`
with `a` in either class.

*Needs:* 1.1, 1.2; ClassFieldTheory §6.1 (`localArtinEquiv`).

**Checks.**

- For `ℚ_3(i)/ℚ_3` (inert), the unit `−1` is a norm and `3` is not; `⟨1, 1⟩` is hyperbolic and
  `⟨1, 3⟩` is anisotropic.
- Over the dyadic `ℚ_2(i)/ℚ_2`, `3` is not a norm (`x² + y² = 3` has no solution in `ℚ_2`), and `⟨1⟩`,
  `⟨3⟩` are the two classes in dimension one; the classification has no odd-residue hypothesis,
  unlike GeometryOfNumbersAndQuadraticArithmetic 2.9.1.

### 2.2 Archimedean places

*Origin:* published: Sylvester's law of inertia, for Hermitian forms at a real place inert in `E`; at a complex place
or a real place split in `E` the classification is that of the split algebra (1.4).

*Method of the formal proof:* the positive index of a Hermitian matrix is the largest dimension of a positive definite
subspace; it is invariant under congruence and equals the number of positive entries of a diagonal form (a positive
definite subspace injects into the positive coordinates), and an orthogonal basis rescaled by square roots gives the
normal form, so nondegenerate forms with the same index are congruent.

Prove the classification by the signature: at a real place inert in `E` (`E_v ≅ ℂ`),
Hermitian spaces are classified by their signature `(p, q)`, every signature with `p + q = n`
occurs, `det V_v` has sign `(−1)^q`, and the Witt index is `min(p, q)`. At a complex place, or a real
place split in `E`, there is one Hermitian space of each dimension, of Witt index `⌊n/2⌋`.

Route: Sylvester's law of inertia for Hermitian matrices: an orthogonal basis (1.1) rescaled by
`|z|²` gives `⟨1⟩^p ⊥ ⟨−1⟩^q`, and `p` is the largest dimension of a positive definite subspace. At a
complex place, or a real place split in `E`, `E_v ≅ F_v × F_v` and 1.4 applies.

*Needs:* 1.1, 1.4; Mathlib `Matrix.IsHermitian`, `Matrix.PosDef`.

**Checks.**

- `⟨1, −1⟩` and `H` have signature `(1, 1)` and are isometric; `⟨1, 1⟩` is not isometric to them.
- Replacing `δ` by `−δ` changes the signature `(p, q)` of a skew-Hermitian space (Conventions) to
  `(q, p)`.

### 2.3 Split places

*Origin:* published for a field of characteristic `≠ 2`, with the sources cited in MetaplecticAutomorphicForms §3.2a:
every Hermitian space over `F_v × F_v` is `A ⊕ A^∨`, with isometry group `GL(A)`; the description of the lattices as
pairs is this roadmap's own formulation, a componentwise check.

*Method of the formal proof:* for the unitary group: over `F_v × F_v` with the swap, the unitary condition on a matrix
splits into two transposed equations, so a unitary matrix is determined by its first component `A`, the second being
the inverse transpose of `A` conjugated by the Gram matrix, and every invertible `A` occurs.

*Corollary of:* MetaplecticAutomorphicForms §3.2a (over `F × F` with the exchange involution, `F` a field of
characteristic `≠ 2`, every Hermitian or skew-Hermitian space is `A ⊕ A^∨` for an `F`-space `A` with dual `A^∨`, with
isometry group `GL(A)`), for the standard form and `U(V)(F_v) ≅ GL_n(F_v)`.

Let `E_v = F_v × F_v`. Prove that
every Hermitian space of dimension `n` is standard, of Witt index
`⌊n/2⌋` with anisotropic kernel `0` or `⟨1⟩` (1.4); that `U(V)(F_v) ≅ GL_n(F_v)` (0.1), which is not
compact for `n ≥ 1`; and that a lattice `L_v` is a pair `(Λ, Λ')` of `O_v`-lattices in `V_1` and `V_2`,
unimodular exactly when `Λ'` is the dual of `Λ` for the pairing `V_1 × V_2 → F_v`.

Route: 1.4 and 0.1; `O_{E_v} = O_v × O_v`.

*Needs:* 0.1, 1.4.

**Checks.**

- For `n = 3` the Witt index is `1` and the anisotropic kernel `⟨1⟩` is nonzero, while
  `U(V)(F_v) = GL_3(F_v)` is not compact.
- `⟨1, 1⟩ ≅ ⟨1, −1⟩ ≅ H` at a split place, because `−1 = N((1, −1))`.

### 2.4 Witt index and the normalized sign

*Origin:* published in characteristic zero: Kirschmer (2016), Theorem 3.2.3 and Corollary 3.2.4, and Jacobowitz
(1962), the Witt index of a Hermitian space over a nonarchimedean local field, with the normalized sign of Harris,
Kudla and Sweet (1996); the global product formula is Hilbert's reciprocity law (O'Meara (1963)) applied to
`(−1)^{n(n−1)/2} det V`. In positive characteristic the local clauses are this roadmap's own formulation.

*Method of the formal proof:* the formal proof has the product formula `∏_v η_v(t) = 1` for `t ∈ F^×`, over every
quadratic extension of number fields, and the Witt index `⌊n/2⌋` at an inert place for a space with a self-dual
lattice. The product formula is proved by counting with `S`-units: for `S` large, the `S`-units times the elements
that are local norms at the places of `S` form a subgroup of index exactly two, which makes the number of places with
symbol `−1` even, and an inequality for subgroups isotropic for a pairing excludes a single exceptional place. At an
inert place a unit Hermitian Gram matrix `B` is written `B = k^*k` with `k` a polynomial in `B` (Hensel's lemma),
which yields an integral basis with antidiagonal Gram matrix. The route written here reads the local clauses off the
classification 2.1 and takes the product formula from the Hilbert product formula of GlobalQuadraticForms 4.1.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.9.4b (the Witt index formula over a nonarchimedean local
field of characteristic zero, with the normalized sign `sgn(V)`, which is `ε(V_v)`), for the local clauses in
characteristic zero, and §2a.3 (a collection of local Hermitian spaces is coherent exactly when `∏_v sgn(V_v) = 1`),
for the global product formula.

Let `v` be finite and nonsplit, `V_v` of dimension `n`, in any characteristic. Prove that the anisotropic kernel has dimension `0`, `1` or `2`; the Witt index is
`⌊n/2⌋` unless `n` is even and `ε(V_v) = −1`, in which case it is `n/2 − 1`; for odd `n` the two
classes have Witt index `(n − 1)/2` and are distinguished by `ε(V_v)`. For a global space `V`,
`∏_v ε(V_v) = 1`, the product over all places, with `ε` at a real place inert in `E` equal to
`(−1)^{n(n−1)/2 + q_v}` and `ε = 1` at split places.

Route: 2.1 and `det(H^r) = (−1)^r`; the global product is `η((−1)^{n(n−1)/2} det V) = 1`
(GlobalQuadraticForms 4.1, `hilbertSymbol_productFormula`, with `η_v(a) = (a, d)_v` for
`E = F(√d)`).

*Needs:* 2.1, 2.2, 2.3; GlobalQuadraticForms 4.1.

**Checks.**

- `n = 2`: `ε(V_v) = η_v(−det V_v)`, which is `1` exactly for the hyperbolic plane (2.1(c)).
- The sign of `H^r` is `+1` for every `r` and every nonsplit `v`: `(−1)^{r(2r−1)}(−1)^r = 1`.

### 2.5 Compactness, strong approximation and rescaling

*Origin:* published: Rapinchuk (2012), Theorem 2.3, strong approximation for a simply connected absolutely almost
simple group and any nonempty finite set of places (the theorem of Kneser and Platonov), for (d). (f) is adapted from
weak approximation, Platonov and Rapinchuk (1994), Chapter 7: here for `U(V)`. The compactness criteria (a)–(c), the
rescaling (e) and the consequence of (f) for lattices are this roadmap's own formulation.

*Method of the formal proof:* (d) is proved for a CM extension, for every admissible `S` at once, by reduction to rank
one: adelic points supported at finitely many places are dense, rational points are dense at those places, every
element of `SU(V)(F)` is a product of elements each fixing the orthogonal complement of a nondegenerate plane that is
isotropic at a place of `S`, and the special unitary group of such a plane is the norm-one group of a quaternion
algebra split at that place, for which strong approximation is proved by approximating reduced traces by rational ones
and by the compactness of the adelic points of a division algebra modulo the rational points and the centre. (f) is
proved with the Cayley transform, in the form of the formal proof recorded below. The label covers (d) and (f). The
route written here takes (d) from AdelicAlgebraicGroups §4.2 when `S` contains the archimedean places and cites
[Rapinchuk] for the other `S`.

*Corollary of:* AdelicAlgebraicGroups §4.2a (strong approximation for a connected, absolutely almost simple, simply
connected group over a number field with respect to any nonempty finite set `S` of places with `G_S` noncompact), for
(d), applied to `SU(V)`.

Prove, for `n ≥ 1`: (a) at a finite place
`v`, `U(V)(F_v)` is compact if and only if `v` is nonsplit and `V_v` is anisotropic, which forces
`n ≤ 2` (2.4); (b) at an archimedean place, `U(V)(F_v)` is compact if and only if `v` is real,
inert in `E`, and `V_v` is definite; (c) `U(V)(F ⊗ ℝ)` is compact if and only if `V` is totally
definite (Conventions; the sign may depend on the place); (d) for `n ≥ 2` and a nonempty finite set `S`
of places of `F`, archimedean or not (`S` need not contain the archimedean places), `SU(V)` has strong
approximation with respect to `S`, that is, `SU(V)(F)·SU(V)(F_S)` is dense in `SU(V)(𝔸_F)`, the full adele
group, whenever `SU(V)(F_v)` is noncompact for some `v ∈ S`, that is, whenever some `v ∈ S` is split in
`E`, complex, or has `V_v` isotropic; in particular for `S = {v}` with `v` a finite place split in `E`;
(e) for `c ∈ F^×`, `(V, ch)` has the same unitary group and
the same subspaces as `(V, h)`; if `V` is totally definite there is `c ∈ F^×` whose sign at every
real place is that of `V_v`, and `(V, ch)` is then totally positive definite; (f) *weak approximation*
(classical): for a finite set `T` of finite places of `F`, `U(V)(F)` is dense in `∏_{v ∈ T} U(V)(F_v)`.
Consequently, for lattices `L, M ⊂ V` and a finite place `v`, `M_v = g_vL_v` for some `g_v ∈ U(V)(F_v)` if and
only if `(gL)_v = M_v` for some `g ∈ U(V)(F)`; and the same holds for the isometries of `V` fixing a nondegenerate
subspace `W` pointwise (the group `U(W^⊥)`). *The form of the formal proof:* for a lattice `L`, an adelic point `g`
of `U(V)` and integers `N, D ≥ 1` there is `γ ∈ U(V)(F)` with `γg` congruent to the identity on `L` at the primes
dividing `N`, to the precision `D`.

Route: (a) an isotropic vector gives a hyperbolic plane (1.2) and the noncompact torus
`diag(ϖ, ϖ^{−1})`; at a split place `U(V)(F_v) = GL_n(F_v)` (2.3); if `V_v` is anisotropic,
`x ↦ h(x, x)` is an anisotropic quadratic form on the `F_v`-space `V_v`, so `{x : |h(x, x)| ≤ 1}`
is compact, spans `V_v` and is preserved by `U(V)(F_v)`. (b) Sylvester (2.2): `U(p, q)` is compact
exactly when `pq = 0`, and complex or split real places give `GL_n(ℂ)` or `GL_n(ℝ)`. (c) from (a),
(b). (d) for `S` containing the archimedean places is AdelicAlgebraicGroups §4.2 *strong-approximation-sufficiency*
applied to `SU(V)`, a simply connected form of `SL_n`, hence absolutely almost simple for `n ≥ 2` (ReductiveGroups
§9D.1); for the other `S`, `S = {v}` among them, it is the classical theorem in this generality
(Kneser, Platonov), stated for a simply connected absolutely almost simple group and any finite set of places in
[Rapinchuk], Theorem 2.3, p. 12, and applied to `SU(V)`, a simply connected form of `SL_n`, hence absolutely almost
simple for `n ≥ 2` (ReductiveGroups §9D.1); its proof is not given here.
(e) `h` and `ch` have the same isometries; the signs by weak approximation
(`TauCeti.GlobalNumberFields.weakApproximation_denseRange`). (f) The Cayley transform `c(X) = (1 − X)(1 + X)^{−1}`, over
`F` and over every `F_v`, maps the `X ∈ End_E(V)` with `h(Xx, y) = −h(x, Xy)` and `1 + X` invertible bijectively onto
the `g ∈ U(V)` with `1 + g` invertible, with inverse `g ↦ (1 − g)(1 + g)^{−1}`
(`h((1 − X)u, (1 − X)w) = h(u, w) + h(Xu, Xw) = h((1 + X)u, (1 + X)w)`). These `X` form an open subset of a
finite-dimensional `F`-vector space, where weak approximation holds coordinatewise (`weakApproximation_denseRange`),
and these `g` are dense in `U(V)(F_v)`: for `g ∈ U(V)(F_v)`, `1 + ζg` is invertible for every `ζ ∈ E_v^1` close to `1`
outside a finite set. The consequence: `U(L_v) = U(V)(F_v) ∩ GL(L_v)` is open, so `g_vU(L_v)` contains some
`g ∈ U(V)(F)`; for `W`, the same with `U(W^⊥)`. The form of the formal proof is the density at the places dividing
`N`, the condition on `γ` being open and satisfied by `g_v^{−1}` there.

*Needs:* 0.2, 1.2, 2.1, 2.2, 2.3, 2.4; AdelicAlgebraicGroups §4.2; ReductiveGroups §9D.1; GlobalNumberFields Layer 1.

**Checks.**

- The anisotropic plane over an inert `F_v` has compact `U(V)(F_v)`; the hyperbolic plane contains
  `diag(ϖ, ϖ^{−1})` in a hyperbolic basis and is not compact.
- `V = ⟨−1⟩` over `ℚ(i)/ℚ` is totally definite but not totally positive definite, and
  `U(V)(ℝ) = S¹` is compact; over `F = ℚ(√2)`, `E = F(i)`, the line `⟨√2⟩` is positive at one real
  place and negative at the other, and `c = √2` rescales it to the totally positive `⟨2⟩` with the
  same unitary group.
- For a totally definite `V` and `n ≥ 2`, (d) needs a finite place in `S`: `SU(V)(F_∞)` is compact,
  so `SU(V)(F)` meets every compact open subgroup of `SU(V)(𝔸_f)` in a finite group and is discrete
  there; it cannot be dense in the infinite, nondiscrete group `SU(V)(𝔸_f)`, as strong approximation
  for `S = {∞}` would require.

### Examples

Over `ℚ_3(i)/ℚ_3`, `⟨1, 1⟩` is hyperbolic and `⟨1, 3⟩` is anisotropic; over `ℚ_2(i)/ℚ_2`, `⟨1⟩` and `⟨3⟩` are the two classes in dimension one (2.1). `⟨1, −1⟩` and `H` have signature `(1, 1)` (2.2); at a split place `⟨1, 1⟩ ≅ ⟨1, −1⟩ ≅ H` (2.3). `V = ⟨−1⟩` over `ℚ(i)/ℚ` is totally definite, with `U(V)(ℝ) = S¹` compact (2.5).

### Dependencies

Layers 0 and 1; ClassFieldTheory §6.1; GlobalQuadraticForms 4.1 (2.4); AdelicAlgebraicGroups §4.2, ReductiveGroups §9D.1 and GlobalNumberFields Layer 1 (2.5); Mathlib's Hermitian and positive definite matrices.

## Layer 3: global classification

### 3.1 Landherr's theorem: the Hasse principle

*Origin:* published: Landherr (1936), the Hasse principle for Hermitian forms over a quadratic extension of number
fields, as stated in Kirschmer (2016), Theorem 2.4.1, with the proof of Scharlau (1985), Chapter 10.

*Method of the formal proof:* the formal proof has the Hasse principle for Hermitian matrices over a quadratic
extension of number fields, and the CM form recorded below. Hermitian forms are classified by rank, determinant modulo
norms and signatures, by induction on the rank: a diagonal form `⟨a_1, …, a_r⟩` of rank `r ≥ 2` represents every
`c ∈ F^×` with the right signs, because the quadratic form `Σ_i a_i(x_i² − d y_i²) − c w²` (`E = F(√d)`) in
`2r + 1 ≥ 5` variables is indefinite at every real place and hence isotropic; the represented vector is split off and
the complements are compared; local isometry everywhere gives equal invariants, by the Hasse norm theorem for the
determinants. The route written here goes through Jacobson's theorem (1.3) and the Hasse–Minkowski theorem for
isometry (GlobalQuadraticForms 6.3).

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2a.1 (Landherr's theorem: Hermitian spaces over a quadratic
extension of number fields are isometric exactly when they are isometric at every place, equivalently when they have
the same dimension, determinant class and signatures).

Let `E/F` be a quadratic extension of number fields. Prove that Hermitian spaces
`V, V'` over `E` are isometric if and only if `V_v ≅ V'_v` at every place `v` of `F`; equivalently,
they have the same dimension and determinant class, and the same signature at every real place
inert in `E`. In Gram matrices (by 1.7, `V_v` has the Gram matrices of `V`) this is
`hermitian_congr_iff_forall_place`: for `H, H′ ∈ GL_n(E)` with `σ(H)^T = H` and `σ(H′)^T = H′`, there
is `P ∈ GL_n(E)` with `σ(P)^T H P = H′` if and only if, at every place `v` of `F`, there is such a `P`
in `GL_n(E ⊗_F F_v)` for the involution `σ ⊗ 1`. The first statement is Landherr's theorem
[Landherr]; [Kirschmer], Theorem 2.4.1, p. 20, states it and refers to [Scharlau], Chapter 10, for a
proof.

*The form of the formal proof.* Let `E` be a CM field with maximal real subfield `F` and conjugation `σ`, and
`H, H′ ∈ GL_n(E)` with `σ(H)^T = H`, `σ(H′)^T = H′`. If, for every embedding `τ : E → ℂ`, `τ(H)` and `τ(H′)` are
congruent over `ℂ` (`τ(H′) = Q^*τ(H)Q` with `Q ∈ GL_n(ℂ)`), and `det H′/det H` is a norm from `E ⊗_F F_v` at every
finite place `v` of `F` (equivalently, by the Hasse norm theorem, a norm from `E`), then `H′ = σ(P)^T H P` for some
`P ∈ GL_n(E)`. This is the equivalent form above (dimension, determinant class and signatures) for CM extensions, and
follows from the statement above. `hermitian_congr_iff_forall_place_of_cm` is not this form: it is the Gram-matrix
equivalence above restricted to CM extensions, a corollary of `hermitian_congr_iff_forall_place`. The formal proof also
has the Gram-matrix equivalence above for every quadratic extension of number fields.

Route: an isometry `V_v ≅ V'_v` of Hermitian spaces over `E_v` is in particular an `F_v`-linear isometry
of the quadratic forms `q_{h,v}(x) = h(x, x)` and `q_{h',v}`, at every place, split places included
(forgetting the `E_v`-structure; `q_{h,v}` is the base change of `q_h` by 1.7), so `q_{h,v} ≅ q_{h',v}`;
the Hasse–Minkowski theorem for isometry (GlobalQuadraticForms 6.3) gives `q_h ≅ q_{h'}`; 1.3 over `F`
(a quadratic field extension of a number field) gives `h ≅ h'`.
The equivalent form: by 2.1–2.3 the local classes are determined by these invariants, and a class
in `F^×/N(E^×)` trivial at every place is trivial (`cyclicHasseNorm`).

*Needs:* 1.3, 1.7, 2.1, 2.2, 2.3; GlobalQuadraticForms 6.3; ClassFieldTheory §13.1
(`cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`).

**Checks.**

- Over `ℚ(i)/ℚ`, `⟨1, 1⟩ ≅ ⟨1, 2⟩` (determinant classes equal since `2 = N(1 + i)`, signature `(2, 0)`
  for both), while `⟨1, 1⟩` and `⟨1, 3⟩` differ at `3`.
- Over `ℚ(√−3)/ℚ`, `⟨1, 1⟩` and `⟨1, 2⟩` are both positive definite but not isometric: `2` is not a
  norm from `ℚ_2(√−3)` (inert, odd valuation) nor from `ℚ_3(√−3)` (`(2, −3)_3 = −1`).

### 3.2 Landherr's theorem: existence with prescribed local invariants

*Origin:* published: Landherr (1936), the existence of a Hermitian space with prescribed local invariants exactly
under the product formula, in the form of Kirschmer (2016), Remark 3.4.2 (3), and Scharlau (1985), Chapter 10.

*Method of the formal proof:* the case `n = 1` in full, for every quadratic extension of number fields: an element of
`F^×` with prescribed symbols `η_v` on an even set of places is produced inside the subgroup of index two formed by the
`S`-units times the local norms at `S`, as a product of elements each a non-norm at one place and a square at the
others. For general `n` only totally positive definite forms over a CM field unramified at every finite place that are
preserved by a fixed elliptic element `γ_0`: they are written `H_0·m(γ_0)` for one such form `H_0` and `m` in the
commutant of `γ_0`, and the rank-one statement is applied on each field of the commutant. The route written here builds
the space for every `n` and every signature as a diagonal form `⟨a_1, …, a_n⟩`, from an element with prescribed Hilbert
symbols (GlobalQuadraticForms 4.1) and weak approximation.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2a.2 (Landherr's existence theorem: local determinant classes,
almost all trivial, and signatures are those of a Hermitian space of dimension `n` over `E` exactly when
`∏_v η_v(d_v) = 1`, with the Gram-matrix form).

Let `E/F` be a quadratic extension of number fields and `n ≥ 1`. Suppose given, at every finite
place `v` nonsplit in `E`, a class `d_v ∈ F_v^×/N(E_v^×)`, trivial for almost all `v`, and at every
real place `v` inert in `E` a signature `(p_v, q_v)` with `p_v + q_v = n`. Put
`η_v(d_v) = (−1)^{q_v}` at those real places. Prove that there is a
Hermitian space `V` of dimension `n` over `E` with `det V_v = d_v` and the prescribed signatures if
and only if `∏_v η_v(d_v) = 1`; it is unique up to isometry (3.1). Equivalently: a family of local
Hermitian spaces of dimension `n`, almost all of trivial determinant class, is the family of
localizations of a global space exactly when the product formula holds. In Gram matrices this is
`exists_hermitian_localizations_iff`: matrices `H_v ∈ GL_n(E ⊗_F F_v)` with `(σ ⊗ 1)(H_v)^T = H_v`, one
at every place `v` of `F`, with `det H_v ∈ N((E ⊗_F F_v)^×)` for almost all finite `v`, are the
localizations of some `H ∈ GL_n(E)` with `σ(H)^T = H` (up to `H_v ↦ (σ ⊗ 1)(P)^T H_v P`) if and only
if the number of places `v` with `det H_v ∉ N((E ⊗_F F_v)^×)` is even. This is the existence half of
Landherr's theorem [Landherr]; [Kirschmer], Remark 3.4.2 (3), p. 40, describes the determinant class by
the even set of nonsplit places at which it is not a local norm and constructs the space from that set
and the signatures.

Route: necessity is 2.4's product formula. Sufficiency: with `E = F(√d)`, the sign prescription
with a prescribed second argument (GlobalQuadraticForms 4.1,
`TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`, O'Meara 71:19a) gives `a ∈ F^×`
with `(a, d)_v = η_v(d_v)` at every place; its hypotheses (each exceptional place nonsplit, an even
number of them) are the product formula. Choose `a_1, …, a_{n−1} ∈ F^×` by weak approximation with
`q_v − 1` negative entries at each real place with `q_v ≥ 1` and none where `q_v = 0`, and put
`a_n = a(a_1 ⋯ a_{n−1})^{−1}`. Then `V = ⟨a_1, …, a_n⟩` has `det V = a`, the right signatures, and
the right local classes by 2.1–2.3.

*Needs:* 2.1, 2.2, 2.3, 2.4, 3.1; GlobalQuadraticForms 4.1; GlobalNumberFields Layer 1
(`TauCeti.GlobalNumberFields.weakApproximation_denseRange`).

**Checks.**

- `F = ℚ`, `E = ℚ(√−3)`, `n = 2`: prescribing `d_2` nontrivial (`2` is inert and not a norm) and all
  other classes trivial with signature `(2, 0)` violates the product formula; `⟨1, 2⟩` realizes `d_2`
  nontrivial together with `d_3 = 2 ∈ ℚ_3^×/N`, nontrivial as well (`(2, −3)_3 = −1`), and the product is
  `1`.
- `n = 1` is the statement that an element of `F^×` with prescribed local norm classes exists exactly
  under the product formula.

### 3.3 Cohomological form

*Origin:* published in characteristic `≠ 2`: Platonov and Rapinchuk (1994), second edition with I. Rapinchuk (2023),
Proposition 2.36, the isometry classes of Hermitian spaces of dimension `n` as the torsor classes of `U(V)`; over a
number field the injectivity and the image of localization are Landherr's theorem (3.1, 3.2) in cohomological
language. In characteristic two this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For a Hermitian space `V` of dimension `n` over `E/F` (any field `F`), prove that `V' ↦ Isom(V, V')` is a bijection from isometry classes of
Hermitian spaces of dimension `n` to the torsor classes of `U(V)` (AdelicAlgebraicGroups §4.1), and
the twist of `U(V)` by the torsor `Isom(V, V')` is `U(V')`. For number fields, 3.1 says that the
localization map on torsor classes is injective, and 3.2 that its image is the set of families
`(V'_v)_v`, almost all with `det V'_v = det V_v`, with `∏_v η_v(det V'_v/det V_v) = 1`; in
particular every class trivial at every place is trivial.

Route: `Isom(V, V')` is a `U(V)`-torsor because `V ⊗ F^{sep} ≅ V' ⊗ F^{sep}` (1.7 and the split case of
1.4); conversely a torsor `P` twists `(V, h)` to `P ×^{U(V)} V`, an `E`-module that descends (Hilbert
90 for `GL_n` over `E`) with a descended form, and `U(V)` acts on the twist through inner
automorphisms, which identifies the twisted group with `U(V')`. Then 3.1, 3.2.

*Needs:* 1.4, 1.7, 3.1, 3.2; AdelicAlgebraicGroups §4.1 (torsors and their classes).

**Checks.**

- For `n = 1`, the torsor classes of `U(1)` are `F^×/N(E^×)`, and injectivity of localization is the
  Hasse norm theorem for `E/F`.

### 3.4 Coherent and incoherent collections

*Origin:* published: Landherr (1936), through the existence theorem 3.2, with the terms coherent and incoherent of
Kudla (1997), there for quadratic spaces; the criterion for every `n`, with the effect of changing a collection at one
or two places, is stated in GeometryOfNumbersAndQuadraticArithmetic §2a.3.

*Method of the formal proof:* the criterion in dimension one, as an exact sequence: a family of local classes comes
from a global element exactly when the product of the signs `η_v` is `1` (the product formula, and conversely an
`S`-unit with prescribed symbols found in a subgroup of index two), and a family of product `−1` is obtained from one
place nonsplit in `E` and a local non-norm there. In higher dimension the formal proof has only collections preserved
by a fixed elliptic element, reduced to dimension one on the commutant. The route written here obtains the criterion
from the existence theorem 3.2 and the product formula of 2.4.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2a.3 (a collection of local Hermitian spaces of dimension
`n ≥ 1`, almost all of trivial determinant class, is coherent exactly when `∏_v sgn(V_v) = 1`; changing an incoherent
collection at one nonsplit place makes it coherent, at two places keeps it incoherent).

A collection `𝒞 = (V_v)_v` of local Hermitian spaces of dimension `n`, one at every place, almost all
with trivial determinant class, is *coherent* if it is the localization of a global space and
*incoherent* otherwise. Prove, for `n = 1`, that `𝒞` is coherent iff `∏_v ε(V_v) = 1`, and that incoherent
collections of dimension one exist.

For every `n` the criterion is GeometryOfNumbersAndQuadraticArithmetic §2a.3, which adds: for an incoherent `𝒞` and
every place `w` nonsplit in `E`, replacing `V_w` by a
local space of dimension `n` with `η_w(det)` changed (at a finite `w` the other determinant class; at
a real `w` a signature with `q_w` changed by one) gives a coherent collection, and changing an
incoherent collection in this way at two places keeps it incoherent.
For Hermitian collections the necessary direction is MetaplecticAutomorphicForms §6.7
(`thetaSectionCollection_incoherent`), which leaves the converse to a separate statement.

Route: 3.2 and 2.4; an incoherent collection of dimension one is obtained from the localizations of a global line by
passing to the other local class at one place nonsplit in `E` (2.1, 2.2).

*Needs:* 2.1, 2.2, 2.4, 3.2.

**Checks.**

- Over `ℚ(i)/ℚ`, replacing the localization of `⟨1⟩` at `3` by `⟨3⟩` (`3` is inert, of odd valuation, hence not a
  norm from `ℚ_3(i)`) gives an incoherent collection of lines; replacing also the localization at `∞` by `⟨−1⟩` gives
  the localizations of `⟨−3⟩` (`−3` is negative, a non-norm from `ℚ_3(i)` and a norm from `ℚ_2(i)`, being `≡ 1` mod
  `4`), a coherent collection.

### 3.5 Representations and isotropy

*Origin:* published: Landherr (1936), the representation of numbers and of zero by Hermitian forms over a number
field, and Scharlau (1985), Chapter 10, the local-global principle for Hermitian forms.

*Method of the formal proof:* a quaternary form `x² − αy² − βz² + γt²` that is isotropic everywhere locally is
isotropic because, over `F(√(αβγ))`, `β` is a norm from the extension by `√α` (Hasse norm theorem) and the coordinates
of the solution descend; more variables follow by induction, and a diagonal Hermitian form of rank at least two over a
CM field represents every `c` that it represents at every place by applying this to the quadratic form
`⟨−c⟩ ⊥ ⟨a_i⟩ ⊥ ⟨−d a_i⟩` over the totally real subfield (`E = F(√d)`, `V ≅ ⟨a_1, …, a_n⟩`). The route written here
deduces 3.5 from the Hasse principle 3.1 and the existence theorem 3.2, through the local orthogonal complements,
where the formal proof proves the isotropy and the representations first and deduces the Hasse principle from them.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2a.4 (an isometric embedding `Y ↪ V` of Hermitian spaces over
a quadratic extension of number fields exists exactly when one exists at every place, and `V` is isotropic exactly
when it is isotropic at every place).

Let `U`, `V` be Hermitian spaces over a quadratic extension of number fields, `dim U ≤ dim V`. Prove: (a) there is an isometric embedding `U ↪ V` if and only if there
is one at every place; (b) `V` is isotropic if and only if `V_v` is isotropic at every place; in
particular a space of dimension `≥ 3` that is indefinite at every real place inert in `E` is
isotropic, and a binary space `V` represents `c ∈ F^×` if and only if `c` has the sign of `V_v` at
every real place `v` inert in `E` at which `V_v` is definite.

Route: (a) for `dim U = dim V` this is 3.1. Otherwise the local orthogonal complements `W_v` (unique
by 1.1(c)) have `det W_v = det V/det U`, a global class, so the product formula holds; 3.2 gives a
global `W` with these localizations and 3.1 gives `U ⊥ W ≅ V`. (b) is (a) with `U = H` (1.2): at
finite nonsplit places a space of dimension `≥ 3` is isotropic (2.1(c)), at split and complex places
every space of dimension `≥ 2` is (2.2, 2.3), and at a real place inert in `E` isotropy is
indefiniteness (2.2); the last clause is (a) with `U = ⟨c⟩`: a binary space represents every element
at finite nonsplit places (2.1(c)), at split and complex places (2.3, 2.2) and at indefinite real
places inert in `E` (2.2), and at a definite real place exactly the elements of its sign.

*Needs:* 1.1, 1.2, 2.1, 2.2, 2.3, 3.1, 3.2.

**Checks.**

- Over `ℚ(i)/ℚ`, `⟨1, 1⟩` represents every positive rational (`x x̄ + y ȳ` is a sum of four squares),
  while `⟨1⟩` represents only the norms, the sums of two squares: `3` is not one.
- Over `ℚ(i)/ℚ`, `⟨1, 1, −1⟩` is isotropic and `⟨1, 1, 1⟩` is not, being positive definite.

### Examples

Over `ℚ(i)/ℚ`, `⟨1, 1⟩ ≅ ⟨1, 2⟩`, while `⟨1, 1⟩` and `⟨1, 3⟩` differ at `3`; over `ℚ(√−3)/ℚ`, `⟨1, 1⟩` and `⟨1, 2⟩` are positive definite and not isometric (3.1), and `⟨1, 2⟩` realizes nontrivial local classes at `2` and at `3`, whose product is `1` (3.2). Over `ℚ(i)/ℚ`, `⟨1, 1, −1⟩` is isotropic and `⟨1, 1, 1⟩` is not (3.5).

### Dependencies

Layers 1 and 2; GlobalQuadraticForms 4.1, 6.3; ClassFieldTheory §13.1; GlobalNumberFields Layer 1; AdelicAlgebraicGroups §4.1.

## Layer 4: Hermitian lattices

### 4.0 Invariants of a lattice

*Origin:* adapted from O'Meara (1963), §§81–82, lattices over a Dedekind domain and the dual, scale, norm and volume
of a quadratic lattice, and Kirschmer (2016), Definition 2.3.3, the same invariants of a Hermitian lattice: here with
the localization and the gluing of lattices in module form, over a Dedekind domain with an algebra of operators.

*Method of the formal proof:* the dual and its double are handled through projective coordinates of the lattice; a
lattice is the intersection of its localizations because the ideal of denominators of a vector lying in every
localization is contained in no maximal ideal; and the glued lattice `⋂ M_𝔭` is squeezed between two multiples of a
reference lattice, its localization at `𝔭` being recovered with an element outside `𝔭` that lies in the other prime
factors of a denominator.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.2.6 (full lattices over a Dedekind domain glue from local
data, localizations or completions, stability under an algebra of operators included), for (g), and §2.7.4 (the dual,
scale, norm and volume of a Hermitian lattice over a number field or a nonarchimedean local field of characteristic
zero: `L^∨` is a lattice, the scale, norm and volume are fractional ideals, the volume of `⊕ 𝔞_i x_i`, the comparison
with GeometryOfNumbersAndQuadraticArithmetic 2.7.1, 2.7.2, and the compatibility of localization and completion with
these invariants), for those clauses of (a)–(c), (e) and (f) in characteristic zero.

Over a number field or a nonarchimedean local field of characteristic `≠ 2`, for lattices `L, M` in a
Hermitian space `V` of dimension `n` (`Submodule O_E V` with `Submodule.IsLattice E`; no integrality
assumed), define the dual `L^∨`, the scale `s(L)`, the norm `n(L)` and the volume `𝔳(L)`
(Conventions) and prove:
(a) `L^∨` is a lattice, `(L^∨)^∨ = L`, `(L ⊥ M)^∨ = L^∨ ⊥ M^∨`, and `(𝔅L)^∨ = 𝔅̄^{−1}L^∨` for a
fractional ideal `𝔅` of `E`;
(b) `s(L)` is a fractional `O_E`-ideal stable under conjugation, and `n(L) ⊆ s(L) ∩ F`, with
equality except possibly at the dyadic places that ramify in `E`;
(c) `𝔳(L)` is well defined, `𝔳(𝔅L) = N_{E/F}(𝔅)^n 𝔳(L)` and `𝔳(L^∨) = 𝔳(L)^{−1}`; for integral `L` the
`O_E`-index ideal `[L^∨ : L]` is `𝔳(L) O_E`, and `L` is unimodular iff it is integral with
`𝔳(L) = O_F`;
(d) for `𝔄 = 𝔄̄`, `L` is `𝔄`-modular iff `s(L) ⊆ 𝔄` and `𝔳(L)·O_E = 𝔄^n`;
(e) when `E` is a field and `L` is integral, `L^∨` is the dual of
GeometryOfNumbersAndQuadraticArithmetic 2.7.2, and `(L, h|_L)` is an `IntegralHermitianLattice`
(2.7.1);
(f) (*module form*) let `R` be a Dedekind domain with fraction field `K` and `V` a
finite-dimensional `K`-space, a lattice being a finitely generated `R`-submodule spanning `V`; then
localization at a maximal ideal `𝔭` commutes with sums and intersections of lattices, and a lattice
is the intersection of its localizations `L_(𝔭)`; for `O_E`-lattices in a Hermitian space over a
number field (`R = O_F`) localization and completion at a finite place commute moreover with duals,
scales, norms and volumes;
(g) (*module form: gluing*) in the setting of (f), let `𝒪 ⊆ End_K(V)` be an `R`-subalgebra (for
instance `O_E` or a conjugation-stable `O_F`-order of `E`, acting on an `E`-space), `L` an
`𝒪`-stable lattice and, for every maximal ideal `𝔭`, `M_𝔭 ⊆ V` an `𝒪`-stable `R_(𝔭)`-lattice with
`M_𝔭 = L_(𝔭)` for almost all `𝔭`; then `M = ⋂_𝔭 M_𝔭` is the unique lattice with `M_(𝔭) = M_𝔭` for
every `𝔭`, and it is `𝒪`-stable; the same holds with completions `M̂_𝔭 ⊆ V ⊗_K K_𝔭` in place of
localizations. In particular, over a number field, for a lattice `L` and lattices `M_v ⊂ V_v` with
`M_v = L_v` for almost all finite `v`, there is a unique lattice `M` with completions `M_v`; for
`g ∈ U(V)(𝔸_f)`, `g·L` denotes the lattice with completions `g_v L_v`.

Route: (a) that `L^∨` is a lattice with `(L^∨)^∨ = L` is the duality statement 4.0a(a), which uses
nothing of 4.0: for `E` a field with `R = O_E` (or `O_{E_v}`), `c = σ`, `ε = 1`; at a split place,
where `L = (Λ, Λ′)` and `L^∨ = (Λ′^*, Λ^*)` for the pairing `V_1 × V_2 → F_v` (2.3), with `R = O_v`,
`c = id` and the symmetric form `Tr_{E/F} ∘ h`, whose duals of such products are the same. The rest
is elementary, place by place. `h(x + y, x + y) = h(x, x) + h(y, y) + Tr h(x, y)` gives
`n(L) ⊇ Tr(s(L))`, and `Tr(𝔓^a) = 𝔓^a ∩ F` except at dyadic ramified places (`Tr(O_E) = O_F` when `2`
is a unit or `E/F` is unramified). (d): `s(L) ⊆ 𝔄` means `𝔄^{−1}h(L, L) ⊆ O_E`, that is `L ⊆ 𝔄L^∨`;
`𝔳(𝔄L^∨) = N(𝔄)^n 𝔳(L)^{−1}`, so the two lattices have the same volume, hence coincide, exactly when
`𝔳(L)² = N(𝔄)^n`, that is `(𝔳(L)O_E)² = 𝔄^{2n}` (as `N(𝔄)O_E = 𝔄𝔄̄ = 𝔄²`), that is
`𝔳(L)O_E = 𝔄^n`. (f): GeometryOfNumbersAndQuadraticArithmetic 2.2.3–2.2.4 are statements about
lattices in a `K`-space and use no form; the compatibility with duals, scales, norms and volumes is
checked on local bases. (g): let `S` be the finite set of `𝔭` with `M_𝔭 ≠ L_(𝔭)` and choose
`d ∈ R ∖ 0` with `dL_(𝔭) ⊆ M_𝔭 ⊆ d^{−1}L_(𝔭)` for `𝔭 ∈ S`; then `dL ⊆ M ⊆ d^{−1}L`, so `M` is
finitely generated (`R` is noetherian) and spans `V`. An `x ∈ M_𝔭` lies in `M_𝔮` for all but finitely
many `𝔮` (it lies in `c^{−1}L` for some `c ∈ R ∖ 0`), and the Chinese remainder theorem gives
`s ∈ R ∖ 𝔭` in a high power of each of the others, so `sx ∈ M` and `M_(𝔭) = M_𝔭`; uniqueness is 2.2.4; `𝒪`-stability passes to
intersections. The completed form follows at each `𝔭` from 2.2.5.

*Needs:* 2.3, 4.0a(a); GeometryOfNumbersAndQuadraticArithmetic 2.2.3–2.2.5, 2.7.1, 2.7.2; Mathlib
`Submodule.IsLattice`, `IsLocalization`, `IsDedekindDomain.HeightOneSpectrum`.

**Checks.**

- Over `ℚ_2(i)/ℚ_2` (ramified, dyadic), the hyperbolic plane `O e ⊕ O f` has scale `O_E` and norm
  `Tr(O_E) = 2ℤ_2`, strictly smaller than `s(L) ∩ ℚ_2 = ℤ_2`; over the unramified
  `ℚ_2(√−3)/ℚ_2` the norm is `ℤ_2`.
- For the rank-one lattice `O_E e` with `h(e, e) = ϖ` at an inert place, `L^∨ = ϖ^{−1}L`,
  `𝔳(L) = ϖO_F`, `𝔳(L)O_E = ϖO_E`, and `L` is `ϖ`-modular, not unimodular. A criterion with
  `N_{E/F}(𝔄)^n` in place of `𝔄^n` would declare it not `ϖ`-modular, since `N(ϖO_E) = ϖ²O_F`.
- At a ramified nondyadic place, the plane `O e ⊕ O f` with `h(e, e) = h(f, f) = 0`, `h(e, f) = Π`
  has `L^∨ = 𝔓^{−1}L` and `𝔳(L)O_E = 𝔓² = 𝔓^n`: it is `𝔓`-modular.

### 4.0a Duality under projection and intersection

*Origin:* adapted from O'Meara (1963), §82, double duality of lattices over a Dedekind domain for a quadratic form:
here for a nondegenerate ε-Hermitian form over a Dedekind domain with an involution, with the duality of projection
and intersection, in this roadmap's own formulation; the bound for the signed index of a projected lattice recorded
below is particular to this proof, and its form (c) with the colength is this roadmap's own formulation.

*Method of the formal proof:* double duality comes from projective coordinates `y = Σ_k f_k(y)g_k` of the lattice,
each functional `f_k` being represented by a vector of the dual; the duality of projection and intersection is the
definition of the dual applied to a pair of adjoint maps, followed by double duality; the index bound adds the signed
indices along `PM ⊇ M ∩ Z ⊇ 𝔞(M ∩ Z)`, the last step costing `dim_K Z·v_𝔭(𝔞)`.

Let `R` be a Dedekind domain with fraction field `K`, `c` an automorphism of the field `K` with
`c(R) = R` and `c² = id` (`c = id` allowed), `V` a finite-dimensional `K`-space and `H : V × V → K` a
nondegenerate form, `c`-semilinear in the first variable and `K`-linear in the second, with
`H(y, x) = ε·c(H(x, y))` for a fixed `ε = ±1`. Lattices are finitely generated `R`-submodules spanning `V` (or a subspace), and
`L^∨ = {x ∈ V : H(x, L) ⊆ R}`. For a subspace `Z` on which `H` is nondegenerate, `V = Z ⊕ Z^⊥` and
`P : V → Z` is the projection along `Z^⊥`; duals of lattices of `Z` are taken in `Z` for `H|_Z`.
Prove:
(a) `L^∨` is a lattice, `(L^∨)^∨ = L`, `(L + M)^∨ = L^∨ ∩ M^∨`, `(L ∩ M)^∨ = L^∨ + M^∨`, and
`L ⊆ M` implies `M^∨ ⊆ L^∨`;
(b) *projection and intersection are dual*: for every `R`-submodule `M` of `V`,
`(P M)^∨ = M^∨ ∩ Z`; this identity uses neither that `R` is a Dedekind domain nor that `M` is a
lattice, and holds for every subring `R ⊆ K` with `c(R) = R`. If `M` is a lattice, `P(M)` and `M ∩ Z`
are lattices in `Z` and `(M ∩ Z)^∨ = P(M^∨)`. Equivalently, for a surjective `K`-linear `p : V → Z′`
with nondegenerate kernel and the form on `Z′` for which `p` restricts to an isometry
`(ker p)^⊥ ≅ Z′` (in coordinates, the form with Gram matrix `(pH^{−1}p^*)^{−1}`),
`(pM)^∨ = p(M^∨ ∩ (ker p)^⊥)`;
(c) *dual index of a projected lattice*: let `𝔭` be a maximal ideal of `R`, lengths being taken over
the discrete valuation ring `R_(𝔭)`; if `𝔞 ⊆ R` is a nonzero ideal with `𝔞(M ∩ Z) ⊆ M^∨` after
localization at `𝔭`, then
`length_𝔭(PM/(PM ∩ (PM)^∨)) ≤ length_𝔭(PM/(M ∩ Z)) + dim_K Z·v_𝔭(𝔞)`;
in particular, if `M′` is a lattice with `𝔡M′ ⊆ M^∨` for a nonzero ideal `𝔡 ⊆ R`, and
`𝔭^J(M ∩ Z) ⊆ M′` after localization at `𝔭` for an integer `J ≥ 0`, the bound holds with
`dim_K Z·(J + v_𝔭(𝔡))`.

*The form of the formal proof* of (c): for `R = O_K`, `K` a number field with an involution `c`, `ε = 1`, and
`𝔡 = DR` for a positive integer `D`, it bounds the signed index `idx_𝔭(PM, (PM)^∨)` of 4.0b (over `R_(𝔭)`):
`idx_𝔭(PM, (PM)^∨) ≤ length_𝔭(PM/(M ∩ Z)) + dim_K Z·(J + v_𝔭(D))`. The left side of (c) is the colength of
`PM ∩ (PM)^∨` in `PM`; it is at least `idx_𝔭(PM, (PM)^∨)`, so (c) implies this form.

For `R = O_E`, `E` a quadratic extension of number fields or of local fields with `c = σ` and
`ε = ±1`, these are statements on the Hermitian and skew-Hermitian lattices of 4.0; for `c = id` they
are the symmetric (`ε = 1`) and skew-symmetric (`ε = −1`) cases, the alternating forms being among the
skew-symmetric ones; in characteristic two skew-symmetric means symmetric and need not mean alternating
(Checks), and the statements hold for every such `H`. Existing declarations cover parts of (a) and (b): for
`c = id`, `L^∨` is Mathlib's `LinearMap.BilinForm.dualSubmodule` of `H`, and double duality for a
lattice with an `R`-basis is `LinearMap.BilinForm.dualSubmodule_dualSubmodule_of_basis` (symmetric
`H`) and `LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip_of_basis` (in general; for `ε = −1`
the flip `−H` has the same duals); for `c ≠ id`, `ε = 1` and an integral lattice (`H(L, L) ⊆ R`),
(a) is GeometryOfNumbersAndQuadraticArithmetic 2.7.2 (`IntegralHermitianLattice.dual`). Statement
(a) extends these to lattices that are neither free nor integral and to `ε = −1`; the first two
clauses of 4.0(a) are its case `R = O_E`, `c = σ`, `ε = 1`. GeometryOfNumbersAndQuadraticArithmetic
0.2.5 is the first identity of (b) for `ℤ`-submodules of a real inner-product space.

Route: (a) `x ↦ H(x, ·)` is a `c`-semilinear bijection from `V` onto the `K`-linear functionals, and
it carries `L^∨` onto the functionals mapping `L` into `R`, that is onto `Hom_R(L, R)`, a lattice of
the dual space; `(L^∨)^∨ = {y : f(y) ∈ R for all f ∈ Hom_R(L, R)}` (using `H(y, x) = εc(H(x, y))`),
which is `L` because the projective module `L` is reflexive; the sum and intersection rules follow
from the definition and double duality. (b) for `z ∈ Z` and `m ∈ M`, `H(z, Pm) = H(z, m)` because
`m − Pm ∈ Z^⊥`, so `(PM)^∨ = {z ∈ Z : H(z, M) ⊆ R} = M^∨ ∩ Z` for every `R`-submodule `M` (only the
definition of the dual is used); for a lattice `M`, `P(M)` is finitely generated and
spans `Z`, and `dP(M) ⊆ M ∩ Z ⊆ P(M)` for some `d ∈ R ∖ 0`, so both are lattices of `Z`; applying
the first identity to `M^∨` and dualizing in `Z` by (a) gives `(M ∩ Z)^∨ = P(M^∨)`. For `p`, the
subspace `Z = (ker p)^⊥` is nondegenerate with `Z^⊥ = ker p`, `p = p|_Z ∘ P`, and `p|_Z` is an
isometry onto `Z′`. (c) `M ∩ Z ⊆ PM`, and by (b) `𝔞(M ∩ Z) ⊆ M^∨ ∩ Z = (PM)^∨` at `𝔭`, so
`𝔞(M ∩ Z) ⊆ PM ∩ (PM)^∨` there and the colength of `PM ∩ (PM)^∨` in `PM` is at most that of
`𝔞(M ∩ Z)`, which is `length_𝔭(PM/(M ∩ Z)) + dim_K Z·v_𝔭(𝔞)` because `(M ∩ Z)_(𝔭)` is free of rank
`dim_K Z`; for the particular case take `𝔞 = 𝔡𝔭^J`.

*Needs:* Mathlib `IsDedekindDomain`, `Module.Projective`, `Module.length`.

**Checks.**

- `E = ℚ(√−3)` (`2` inert), `M = O_E²` with the standard form (unimodular), `Z = E(1, 1)`:
  `PM = O_E(1, 1)/2`, `M ∩ Z = O_E(1, 1)`, `(PM)^∨ = O_E(1, 1) = M^∨ ∩ Z` and
  `(M ∩ Z)^∨ = O_E(1, 1)/2 = P(M^∨)`. At `𝔭 = 2O_E`, `length(PM/(PM ∩ (PM)^∨)) = 1`, and (c) with
  `𝔞 = O_E` gives `1 + 0`: the bound is attained. At the other primes both sides vanish.
- Nondegeneracy of `Z` is needed: for `⟨1, −1⟩` and the isotropic line `Z = E(1, 1)`, `Z ⊆ Z^⊥` and
  there is no projection along `Z^⊥`.
- `c = id`, `ε = −1` in characteristic two: over `R = 𝔽_2[[t]]` the form `H(x, y) = xy` on `V = K`
  satisfies `H(y, x) = −H(x, y)` and is nondegenerate, but `H(1, 1) = 1`, so it is not alternating. The
  statements above apply to it as to every skew-symmetric form (for instance `R^∨ = R` for the lattice
  `R ⊂ K`).
- `c(R) = R` is needed for duals to be `R`-modules: for `K = ℚ(i)`, `R = ℤ[i]_{(2+i)}` and `c` the
  conjugation (`c(R) = ℤ[i]_{(2−i)} ≠ R`), `H(x, y) = x̄y` and `L = R`, `L^∨ = c(R)` contains `1` but not
  `(2 − i)^{−1}·1`, although `(2 − i)^{−1} ∈ R`.

### 4.0b Indices and lengths of lattices over a discrete valuation ring

*Origin:* adapted from The Stacks Project, §10.121, Definition 10.121.5 and Lemmas 10.121.6 and 10.121.7, the index of
two lattices over a discrete valuation ring, its additivity and `idx(A, gA) = v(det g)`: the uniform index on
subspaces (a), as the equivalence of the bound on every subspace with `length(A/(A ∩ ϖ^{−d}B)) ≤ r`, and the descent
lemma are particular to this proof; the second expression `length((ϖ^dA + B)/B)` as an equality, the colength
identity (b)(i), the duality and the base change (c) for a flat local homomorphism are this roadmap's own formulation.

*Method of the formal proof:* the index is computed with a common sublattice `A ∩ B ∩ C` and the additivity of length;
(a) is proved as an equivalence: `(A ∩ W)/(B ∩ W)` is split through `A ∩ ϖ^{−d}B ∩ W`, and the extremal subspace is
spanned by the vectors of a Smith basis of `B` in `A` whose elementary divisor does not divide `ϖ^d`. The descent lemma
is a chain of triangle inequalities `length(A/(A ∩ C)) ≤ length(A/(A ∩ B)) + length(B/(B ∩ C))`, and the base change
of the index is read off the formula `idx(L, gL) = v(det g)`. The route written here proves the descent lemma from the
colength identity (b)(i), and the base change by flatness.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.5.7 (the index of two lattices over a discrete valuation
ring: independence of the auxiliary lattice, `idx(A, B) = length(A/B)` for `B ⊆ A`, additivity without inclusions,
antisymmetry and `idx(A, gA) = v(det g)`), for the definition of the index and the first two items of its API.

Let `O` be a discrete valuation ring with uniformizer `ϖ`, normalized valuation `v` and fraction field
`K`, `V` a finite-dimensional `K`-space, and lattices finitely generated `O`-submodules spanning `V`;
for a subspace `W`, the intersection of a lattice with `W` is a lattice of `W`. Lengths are lengths of
`O`-modules (`Module.length`).

*The index of two lattices.* Define the index `idx(A, B) ∈ ℤ` of
lattices `A, B` in `V`: `idx(A, B) = length(A/D) − length(B/D)` for any lattice `D ⊆ A ∩ B` (for
instance `D = A ∩ B`). Prove that it does not depend on `D`, and its API:
- `idx(A, B) = length(A/B)` when `B ⊆ A`; `idx(B, A) = −idx(A, B)`; `idx(A, B) + idx(B, C) = idx(A, C)`
  for any three lattices, with no inclusion among them;
  hence `idx(A′, B) = idx(A, B) + length(A′/A)` for `A ⊆ A′`: the index increases in its first
  argument and decreases in its second;
- `idx(gA, gB) = idx(A, B)` and `idx(A, gA) = v(det g)` for `g ∈ GL_K(V)`; in particular
  `idx(A, aA) = v(a)·dim V` for `a ∈ K^×`, and `idx(ϖ^{−d}B ∩ W, B ∩ W) = d·dim W` for every subspace
  `W` and every integer `d`;
- for `B ⊆ A` and subspaces `W′ ⊆ W`, `0 ≤ idx(A ∩ W′, B ∩ W′) ≤ idx(A ∩ W, B ∩ W) ≤ idx(A, B)`;
- *duality*: for a nondegenerate form `H : V × V → K`, `c`-semilinear in the first variable and
  `K`-linear in the second for an automorphism `c` of `K` with `c(O) = O` (`c = id` allowed), and
  `L^∨ = {x ∈ V : H(x, L) ⊆ O}`, `idx(B^∨, A^∨) = idx(A, B)`;
- *base change*: `idx(O′A, O′B) = idx(A, B)` in the setting of (c).

Prove:
(a) *uniform index on subspaces*: for every integer `d`,
`sup_W (idx(A ∩ W, B ∩ W) − d·dim W) = length(A/(A ∩ ϖ^{−d}B)) = length((ϖ^dA + B)/B)`,
the supremum over all subspaces `W` of `V` being attained; in particular
`idx(A ∩ W, B ∩ W) ≤ d·dim W + r` holds for every `W` if and only if `length((ϖ^dA + B)/B) ≤ r`;
(b) *a colength identity and a colength inequality*: let `X, Θ, S, Y, N′` be submodules of a module
over any ring, lengths taken in `ℕ ∪ {∞}`. Then
(i) if `S ⊆ X`, `length((X + Θ)/Θ) = length((S + Θ)/Θ) + length(X/(S + (X ∩ Θ)))`;
(ii) if `Y ⊆ Θ` and `S + Y ⊆ N′`, then `length((S + Θ)/Θ) ≤ length(N′/Y)`.
*Corollary (descent lemma).* Let `M, Θ ⊆ V` be lattices, `e ≥ 0`, `U ⊆ V` any `O`-submodule (for
instance a subspace), `M_U ⊆ M ∩ U` a submodule and `t_1, …, t_p ∈ M ∩ Θ` with
`length(M/(M_U + Σ_i O t_i)) ≤ q`; let `N_1, Z ⊆ Θ` be submodules, `N′` a submodule of `V` containing
`(ϖ^eM ∩ U) + N_1 + Z′`, where `Z ⊆ Z′ ⊆ N′`, and `ρ : N′ → W′` an `O`-linear map with kernel `Z′`
and `ρ(N_1) ⊆ A ⊆ A′`, `ρ(N′) ⊆ A′` for submodules `A, A′` of `W′`. Then
`length((ϖ^eM + Θ)/Θ) ≤ length(A′/A) + length(A/ρ(N_1)) + length(Z′/Z) + q`;
(c) *base change*: if `O → O′` is a flat local homomorphism of discrete valuation rings under which
`ϖ` stays a uniformizer, `K′ = Frac O′`, then `A ↦ O′A` preserves intersections, intersections with
subspaces and the lengths of the quotients above, and the supremum of (a) for `O′A, O′B` over all
`K′`-subspaces of `V ⊗_K K′` equals that for `A, B`.

*The form of the formal proof.* It uses only the inequality of (a): for every subspace `W` and every integer `d`,
`idx(A ∩ W, B ∩ W) ≤ d·dim W + length((ϖ^dA + B)/B)`; and the corollary for `U` the subspace `K·(N_1 + Z)`, with all
the lengths finite, through (a): for every subspace `W`,
`idx(M ∩ W, Θ ∩ W) ≤ e·dim W + length(A′/A) + length(A/ρ(N_1)) + length(Z′/Z) + q`. The first is half of (a), and the
second is the corollary combined with (a) for `d = e`, `A = M`, `B = Θ`.

Route: *the index.* For lattices `D′ ⊆ D ⊆ A ∩ B`, `length(A/D′) = length(A/D) + length(D/D′)` and
the same for `B`, so the difference does not change; two lattices in `A ∩ B` contain their
intersection, a lattice (`ϖ^NA ⊆ B` for large `N`, `A` being finitely generated and `B` spanning
`V`). Additivity: compute the three indices with one lattice `D ⊆ A ∩ B ∩ C`; antisymmetry and
`idx(A, B) = length(A/B)` are the case `D = B`; monotonicity is additivity with `idx(A′, A) = length(A′/A)`. `g` maps `A` isomorphically onto `gA` and `D` onto `gD`. For `idx(A, gA)`: by the Smith
normal form (Mathlib `Submodule.exists_smith_normal_form_of_le`, applied to `ϖ^N gA ⊆ A`) there is a
basis `u_i` of `A` with `gA = ⊕ϖ^{c_i}O u_i`; the bases `(gu_i)` and `(ϖ^{c_i}u_i)` of `gA` differ by an
element of `GL_n(O)`, so `v(det g) = Σ c_i`, which is `idx(A, gA)` (computed with `D = ϖ^N A`); the
case `g = ϖ^d` on `W` gives `idx(ϖ^{−d}B ∩ W, B ∩ W) = d·dim W`. For `B ⊆ A`, `(A ∩ W′)/(B ∩ W′)`
injects into `(A ∩ W)/(B ∩ W)`, which injects into `A/B`. Duality: for `B ⊆ A`, the map
`x ↦ (a ↦ H(x, a) mod O)`, `c`-semilinear in `x`, sends `B^∨` onto the `O`-linear maps `A/B → K/O`
(`H` is linear in its second variable; lift such a map to `A → K` with `B` going into `O`, `A` being
free, and write the lift as `H(x, ·)` by nondegeneracy), with kernel `A^∨`; so `B^∨/A^∨` is
`c`-semilinearly isomorphic to `Hom_O(A/B, K/O)`, which has the same length because `c(O) = O`, and
`Hom_O(T, K/O)` has the length of `T` for every `O`-module `T` of finite length; for general `A, B`
use `D ⊆ A ∩ B` and additivity. (a) By the API `idx(ϖ^{−d}B ∩ W, B ∩ W) = d·dim W`, so with
`C = ϖ^{−d}B` the left side is `sup_W idx(A ∩ W, C ∩ W)`; and
`idx(A ∩ W, C ∩ W) ≤ length((A ∩ W)/(A ∩ C ∩ W)) ≤ length(A/(A ∩ C))`, the last because
`(A ∩ W)/(A ∩ C ∩ W)` injects into `A/(A ∩ C)`. Equality: by the Smith normal form (applied to
`ϖ^kC ⊆ A`) there is a basis `u_i` of `A` with `C = ⊕ϖ^{c_i}O u_i`, and `W` spanned by the `u_i` with
`c_i > 0` gives `Σ_{c_i > 0} c_i = length(A/(A ∩ C))`; multiplication by `ϖ^d` identifies
`A/(A ∩ C)` with `(ϖ^dA + B)/B`. (b) (i): `(S + Θ)/Θ` is a submodule of `(X + Θ)/Θ` with quotient
`(X + Θ)/(S + Θ)`, onto which `X` maps with kernel `X ∩ (S + Θ) = S + (X ∩ Θ)` (the modular law, as
`S ⊆ X`); length is additive on exact sequences. (ii): `(S + Y)/Y ⊆ N′/Y` maps onto `(S + Θ)/Θ`
because `Y ⊆ Θ`. The corollary: put `X = ϖ^eM` and use (i) with `S = X ∩ U`; multiplication by `ϖ^e`
maps `M_U + Σ O t_i` into `(X ∩ U) + (X ∩ Θ)` (`U` and `Θ` are `O`-modules), so
`X/((X ∩ U) + (X ∩ Θ))` is a quotient of `M/(M_U + Σ O t_i)` and has
length at most `q`; (ii) with `S = X ∩ U` and `Y = N_1 + Z` gives
`length(((X ∩ U) + Θ)/Θ) ≤ length(N′/(N_1 + Z)) ≤ length(N′/(N_1 + Z′)) + length(Z′/Z)`, the last
because `(N_1 + Z′)/(N_1 + Z)` is a quotient of `Z′/Z`; and `ρ` induces
`N′/(N_1 + Z′) ≅ ρ(N′)/ρ(N_1) ⊆ A′/ρ(N_1)` (its kernel on `N′` is `N_1 + ker ρ`), of length at most
`length(A′/A) + length(A/ρ(N_1))`; add (i). (c) flatness makes `O′ ⊗_O –` exact and compatible with
intersections, and `O′/ϖO′` is the residue field of `O′`, so lengths of finite-length modules are
unchanged; this gives `idx(O′A, O′B) = idx(A, B)`, and by (a) the supremum is such a length.

*Needs:* Mathlib `Submodule.exists_smith_normal_form_of_le`, `Module.length`, `Module.Flat`.

**Checks.**

- Signs: in `V = K`, `idx(O, ϖO) = 1` and `idx(O, ϖ^{−1}O) = −1`; `idx(O, ϖO) = v(det ϖ) = 1`.
- Additivity without inclusions: in `V = K²`, `A = O²`, `B = O(1, 0) ⊕ ϖ²O(0, 1)` and
  `C = ϖ^{−1}O(1, 0) ⊕ ϖO(0, 1)` give `idx(A, B) = 2`, `idx(B, C) = −2` (`B ⊆ C` with colength two)
  and `idx(A, C) = 1 − 1 = 0` (through `A ∩ C = O(1, 0) ⊕ ϖO(0, 1)`), although neither of `A`, `C`
  contains the other.
- `A = O²`, `B = O(1, 0) ⊕ ϖ²O(0, 1)`, `d = 1`: `A ∩ ϖ^{−1}B = O(1, 0) ⊕ ϖO(0, 1)` has colength `1`
  in `A`; the line `W = K(0, 1)` gives `idx − d·dim W = 2 − 1 = 1`, while `W = V` gives `2 − 2 = 0` and
  `W = K(1, 0)` gives `0 − 1 = −1`: the supremum is attained on a proper subspace only.
- `d = 0` and `B ⊆ A`: (a) says that the largest index of `B ∩ W` in `A ∩ W` is `length(A/B)`,
  attained at `W = V`.
- In (b)(ii) the hypothesis `Y ⊆ Θ` is needed: in `V = K` with `Θ = ϖO` and `S = Y = N′ = O`,
  `S + Y ⊆ N′` and `length(N′/Y) = 0`, but `length((S + Θ)/Θ) = 1`.

### 4.1 Jordan splittings

*Origin:* published in characteristic zero: Kirschmer (2016), Theorem 3.3.3 and Proposition 3.3.5 (3), (5), after
Jacobowitz (1962), the Jordan splittings of Hermitian lattices at nondyadic and unramified places, the invariance of
the Jordan type and the modular lattices at ramified nondyadic places; in positive characteristic this roadmap's own
formulation.

*Method of the formal proof:* the form recorded below, in the localization of `O_E` at the primes above `𝔭`: a basis of
the lattice is orthogonalised by induction; if all Gram entries are divisible by the uniformizer the form is divided by
it, and otherwise a vector of unit norm exists (a diagonal one, or `x_i + s x_j` with `Tr(s h(x_i, x_j)) = 1`) and is
split off; the invariants are read off the cardinalities of `A/𝔭^jA` for the discriminant module
`A ≅ ⊕_i O_E/𝔭^{v(a_i)}`. The route written here obtains that basis by Gram–Schmidt over `E` on vectors of `L` close
to a basis of the completion `L_𝔭`.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.7.5 (the existence of Jordan splittings at split,
unramified and ramified nondyadic places, the invariance of the Jordan type, and the modular lattices at ramified
nondyadic places, over a local field of characteristic zero), for (a)–(c) in characteristic zero.

Let `v` be a finite place, nondyadic or unramified in `E` (split places included). Prove: (a) every lattice `L_v` is an
orthogonal sum `L_1 ⊥ ⋯ ⊥ L_m` of `𝔓^{a_i}`-modular lattices with `a_1 < ⋯ < a_m`, `𝔓` the prime of
`E_v` (at a split place, `ϖ_v` and componentwise, 2.3); (b) the sequence of pairs
`(rank L_i, a_i)` (the Jordan type) is an invariant of `L_v`; (c) if `E_v/F_v` is ramified and `v`
nondyadic, a `𝔓^a`-modular lattice with `a` odd is an orthogonal sum of planes `Oe ⊕ Of` with
`h(e, e) = h(f, f) = 0`, `h(e, f) = Π^a`, hence of even rank, and one with `a` even is `Π^{a/2}L_0`
with `L_0` unimodular. In characteristic zero, (a) and (b) are [Kirschmer], Theorem 3.3.3, p. 32, and
(c) is Proposition 3.3.5 (3), (5) there, pp. 32–33. For symmetric bilinear forms over a discrete valuation ring, the
quadratic counterpart of (a), (b) is IntegralLattices 3B.

*The form of the formal proof* of (a), (b). Let `E/F` be unramified at every finite place, `X ⊆ V` a subspace on which
`h` is nondegenerate, `L` an integral lattice of `X` and `𝔭` a prime of `F`, inert or split. There are an orthogonal
basis `b_1, …, b_m` of `X` and `a_i ∈ O_F ∖ 0` with `h(b_i, b_i) = a_i` and `Σ O_E b_i = L` after localisation at `𝔭`.
For every such basis `v_𝔭(𝔳(L)) = Σ_i v_𝔭(a_i)` and `t(L_𝔭) = #{i : v_𝔭(a_i) > 0}`; and if the discriminant modules at
`𝔭` of two such lattices are isomorphic, then `Σ_i min(v_𝔭(a_i), j) = Σ_i min(v_𝔭(a′_i), j)` for every `j ≥ 0`.

Route: choose `x, y` with `h(x, y)` generating `s(L)`; if some `h(x, x)` generates it, split off
`O_E x`, otherwise split off the plane spanned by `x, y`; induct. Invariance of the type from the
dimensions of `𝔓^j L^∨ ∩ L` modulo `𝔓`, as for quadratic lattices (O'Meara §91). (c): for `a` odd,
`Π̄^a = −Π^a`, so `Π^{−a}h` reduces to a nondegenerate alternating form on `L/𝔓L`, whose symplectic
basis lifts; for `a` even, `L_0 = Π^{−a/2}L` is unimodular by 4.0(a), (d). The form of the formal proof: at a split or
unramified `𝔭` the splitting above is into lines (`Tr` is onto, so some `h(x, x)` generates `s(L)`); Gram–Schmidt over
`E` on vectors of `L` close to such a basis of `L_𝔭`, scaled by elements of `O_F ∖ 𝔭` to lie in `L`, gives the `b_i`;
the volume, `t(L_𝔭)` and the sums `Σ_i min(v_𝔭(a_i), j)` are read off `A_{L_𝔭} ≅ ⊕_i O_E/a_iO_E` (localised at `𝔭`).

*Needs:* 4.0; GeometryOfNumbersAndQuadraticArithmetic 2.5.2, 2.7.3.

**Checks.**

- The invariant factors of GeometryOfNumbersAndQuadraticArithmetic 2.7.3 are read off the Jordan type
  in the unramified case: a `ϖ^a`-modular component of rank `r` contributes `r` factors `a`.
- Over a ramified nondyadic `E_v`, a `Π`-modular lattice of rank one does not exist: `h(x, x) ∈ F`
  has even `𝔓`-valuation.

### 4.2 Unimodular lattices

*Origin:* published in characteristic zero: Kirschmer (2016), Theorem 3.3.3, Proposition 3.3.5 and Theorem 3.3.6,
after Jacobowitz (1962) and Shimura (1964), the unimodular Hermitian lattices at split, unramified and ramified
nondyadic places, their conjugacy, their diagonal unit bases and the classification by Jordan type at unramified
places; the orthonormal bases of (a) follow from them, units being norms at split and unramified places. The
hyperbolic splitting (d), the skew-Hermitian case and the positive characteristic are this roadmap's own formulation;
[FormalProof] has the orthonormal bases and the completion of an isotropic frame to hyperbolic planes in the setting
of its Method label.

*Method of the formal proof:* over a ring with involution whose fixed ring is Henselian local with finite residue field
and on which the trace is onto, a Hermitian matrix of unit determinant is made the identity by induction: a
transvection produces a unit diagonal entry, which is a norm (a binary quadratic form over the finite residue field
represents every element, then Hensel's lemma) and is split off; a primitive isotropic frame is completed to
hyperbolic planes by a correction with an element `τ` with `τ + τ̄ = 1`.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.7.6 (the unimodular lattices at split, unramified and
ramified nondyadic places over a local field of characteristic zero: existence, conjugacy, the residue form, diagonal
unit bases, and the classification by Jordan type at unramified places), for (a)–(c) in characteristic zero, the
orthonormal bases of (a) apart.

Prove: (a) if `E_v/F_v` is split, every `V_v` contains a
unimodular lattice; if `E_v/F_v` is unramified (every residue characteristic), `V_v` contains one iff
`val(det V_v)` is even (well defined, as `N(E_v^×)` consists of the elements of even valuation); in both
cases a unimodular lattice has an orthonormal basis and is unique up to `U(V_v)` (at a split place the
determinant class is trivial, `N(E_v^×) = F_v^×`, and the valuation of a Gram determinant is not an
invariant of `V_v`); (b) if `E_v/F_v` is ramified
and `v` nondyadic, every `V_v` contains unimodular lattices; each has an orthogonal basis of vectors
`x_i` with `h(x_i, x_i) ∈ O_v^×`; `h` modulo `𝔓` is a nondegenerate symmetric bilinear form on
`L_v/𝔓L_v` over `k_v` (the residue form), whose discriminant is the class of `det L_v`; and two
unimodular lattices in `V_v` are conjugate under `U(V_v)`; (c) if `E_v/F_v` is unramified, two
lattices in `V_v` are conjugate under `U(V_v)` iff they have the same Jordan type; (d) hyperbolic
splitting: if `v` is split, unramified, or ramified and
nondyadic, `L_v` is unimodular and `x ∈ L_v` is isotropic and primitive in `L_v` (Conventions:
`L_v/O_{E_v}x` torsion-free; `x ∉ 𝔓L_v` at a nonsplit place, `x_1 ∉ ϖ_vΛ` and `x_2 ∉ ϖ_vΛ^*` at a
split place with `L_v = (Λ, Λ^*)`), there is `f ∈ L_v` with `h(x, f) = 1`, `h(f, f) = 0` and
`L_v = (Ox ⊕ Of) ⊥ (L_v ∩ ⟨x, f⟩^⊥)`; consequently a unimodular lattice in an isotropic `V_v` splits
off a unimodular hyperbolic plane. The same holds for a skew-Hermitian `(W_v, w)` and a lattice
unimodular for `w` (Conventions), with `w(x, f) = 1` and `w(f, f) = 0`.

Route: (a) at a split place, `(Λ, Λ^*)` is unimodular for every lattice `Λ ⊂ V_1`, every unimodular
lattice has this form (2.3), dual bases `u_i`, `u_i^*` give the orthonormal basis `x_i = (u_i, u_i^*)`,
and `g ∈ GL(V_1) = U(V_v)` (0.1) with `gΛ = Λ′` maps `(Λ, Λ^*)` to `(Λ′, Λ′^*)`. At an unramified place,
a unimodular lattice has a unit Gram determinant, so `val(det V_v)` is even; it contains a vector of
unit length, else `Tr h(L, L) ⊆ ϖO_F` and the perfect trace pairing of the unramified `O_{E_v}` forces
`s(L) ⊆ 𝔓`; split it off and induct; units of `O_F` are norms, so the unit lengths can be made `1`, an
orthonormal basis, and two orthonormal bases differ by an element of `U(V_v)`. Conversely, if
`val(det V_v)` is even, `det V_v` is the class of a unit, which is a norm, and 2.1(a) gives
`V_v ≅ ⟨1, …, 1⟩ ⊇ O_{E_v}^n`. (b) every class of `F_v^×/N(E_v^×)` contains a unit, since
`N(Π)` has odd valuation; split off unit vectors as in (a), using `2 ∈ O^×`. Uniqueness: the two
diagonal unit Gram matrices have determinants in the same class modulo norms, and a unit is a norm
from the ramified `E_v` iff its residue is a square, so the residue forms have the same rank and
discriminant and are isometric over `k_v` (`q_v` odd); lift a residue isometry to a change of basis of
`L_v`, after which the Gram matrix is congruent modulo `ϖ_v` to the other diagonal one; Gram–Schmidt
with unit pivots makes it diagonal with entries `w_i ≡ u_i mod ϖ_v`, and `w_i/u_i ∈ 1 + ϖ_vO_v`
is a square of `O_v^×`, hence a norm (`N(a) = a²` for `a ∈ O_v`), so `⟨w_i⟩ ≅ ⟨u_i⟩`. (c) a
`ϖ^a`-modular component becomes unimodular after rescaling the form by `ϖ^{−a}`, so components of the
same rank and scale are isometric by (a), and lattices of the same type are isometric
componentwise; an isometry between lattices spanning `V_v` is an element of `U(V_v)`; the converse is
4.1(b). (d) `x` primitive and `L_v = L_v^∨` give `h(x, L_v) = O_{E_v}` (at a split place
`h(x, (y_1, y_2)) = (⟨y_1, x_2⟩, ⟨x_1, y_2⟩)`, and `⟨Λ, x_2⟩ = O_v`, `⟨x_1, Λ^*⟩ = O_v` exactly when
`x_2 ∉ ϖ_vΛ^*` and `x_1 ∉ ϖ_vΛ`), hence `y ∈ L_v` with `h(x, y) = 1`; put `f = y + μx` with
`μ ∈ O_{E_v}`, `Tr μ = −h(y, y)` (`Tr : O_{E_v} → O_v` is onto at these places); a unimodular
sublattice `P` is an orthogonal summand, the projection of `z` to `P` lying in `P^∨ = P`. For `w`
the condition is `μ − μ̄ = w(y, y)`, a trace-zero element of `O_{E_v}`; at these places every
trace-zero element of `O_{E_v}` is some `μ − μ̄` (`(a, −a) = (a, 0) − (0, a)` at a split place;
`O_v(θ − θ̄)` with `θ − θ̄` a unit for `O_{E_v} = O_v[θ]` unramified; `O_vΠ = 2O_vΠ` at a ramified
nondyadic place).

*Needs:* 0.1, 1.5, 2.1, 2.3, 4.0, 4.1.

**Checks.**

- At a split place the parity of the valuation of a Gram determinant is not an invariant: in the line
  `V_v = E_v` with `h(x, y) = x̄y`, the bases `e = (1, 1)` and `(ϖ_v, 1)e` have Gram determinants `1` and
  `N(ϖ_v, 1) = ϖ_v`, and `V_v` contains the unimodular `(O_v, O_v)` in either description.
- Over `ℚ_3(√−3)`, `⟨1, 1⟩` and `⟨1, 2⟩` are unimodular; their residue forms over `𝔽_3` are the
  nonsplit plane `x² + y²` and the split plane `x² + 2y²`.
- At an inert place, the space `⟨1, ϖ⟩` contains no unimodular lattice: its determinant has odd
  valuation.
- (d) fails at a dyadic ramified place: over `ℚ_2(i)`, in the unimodular `L = Oe_1 ⊕ Oe_2` of
  `⟨1, −1⟩`, the vector `x = e_1 + e_2` is primitive and isotropic, but `f = ae_1 + be_2` with
  `h(x, f) = a − b = 1` has `h(f, f) = N(b + 1) − N(b) = Tr(b) + 1`, which is odd because
  `Tr(O_E) = 2ℤ_2`, so never `0`.
- Primitivity at a split place needs both components: in `L = (O_v², O_v²)` with dual bases
  `u_i`, `u_i^*`, the isotropic `x = (u_1, ϖ_vu_2^*)` is not in `ϖ_vL`, but `x_2 ∈ ϖ_vΛ^*`, and
  `h(x, L) = (ϖ_vO_v, O_v) ≠ O_{E_v}`: no `f ∈ L` has `h(x, f) = 1`.

### 4.3 Dyadic ramified places

*Origin:* published: Kirschmer (2016), Algorithm 3.3.2 and Theorem 3.3.3, the splitting of a Hermitian lattice at a
dyadic ramified place into modular lattices of rank one or two.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `E_v/F_v` be ramified with `v` dyadic. Prove that every
lattice is an orthogonal sum of modular lattices of rank one or two.

This is GeometryOfNumbersAndQuadraticArithmetic §2.7.5 (d) (a dyadic place of a local field of characteristic `≠ 2`
being of characteristic zero); the classification of these lattices is [Jacobowitz], Theorem 11.4, quoted in
[Kirschmer], Theorem 3.3.18, p. 38.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.7.5.

**Checks.**

- Over `ℚ_2(i)`, the unimodular plane `O e ⊕ O f` with `h(e, f) = 1`, `h(e, e) = h(f, f) = 0` does
  not split into lines: a modular line `O x` would need `h(x, x)` to generate `s(L) = O_E`, while
  every `h(x, x)` lies in `n(L) = 2ℤ_2` (4.0).

### 4.4 Maximal lattices

*Origin:* published in characteristic zero for norm-maximal lattices: Shimura (1964), Proposition 4.13, Gan, Hanke and
Yu (2001), and Kirschmer (2016), Definition 2.3.3 (7) and Lemmas 3.5.2, 3.5.3: their existence, normal forms,
conjugacy and genus. In positive characteristic, and for the scale-maximal notion, its comparison with the
norm-maximal one and its conjugacy and genus clauses, this roadmap's own formulation.

*Method of the formal proof:* the form for a CM extension unramified at every finite place: a maximal lattice is
unimodular, or unimodular plus a `ϖ`-modular line. An integral lattice is enlarged to a maximal one by induction on the
order of its discriminant module; at an inert prime the classes of the discriminant module killed by the prime form a
line, since the norm of the residue field extension is onto; two maximal lattices are made unimodular of rank `n + 1`
by adjoining a line of norm `ϖ`, a device printed by Li and Zhang (2019), Lemma 9.1.1, for local densities, and the
uniqueness of unimodular lattices with a local Witt theorem fixing the added vector gives one genus. The route written
here derives the normal forms from the Jordan splittings of 4.1, the conjugacy from 4.2(a), (c), and the genus from the
conjugacy by gluing (4.0(g)).

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.7.7 (norm-maximal lattices over a number field or a local
field of characteristic zero: existence, the local–global criterion, local conjugacy, the normal forms at split,
unramified and ramified nondyadic places, and one genus), for the clauses on norm-maximal lattices in characteristic
zero.

Define: `L` is scale-maximal if `s(L) ⊆ O_E` and no strictly larger
lattice has this property; and `L` is norm-maximal if `n(L) ⊆ O_F`
(`h(x, x) ∈ O_F` for all `x ∈ L`) and no strictly larger lattice has this property. Norm-maximal
lattices are the maximal lattices of [Shimura64] and [GHY] (the `O_F`-maximal lattices of [Kirschmer],
Definition 2.3.3 (7), p. 18; that they form one genus is [Kirschmer], Lemma 3.5.2, p. 43, which refers to
[Shimura64], Proposition 4.13). Prove:
(a) every lattice with `s(L) ⊆ O_E` (resp. `n(L) ⊆ O_F`) lies in a scale-maximal (resp. norm-maximal)
lattice; `s(L) ⊆ O_E` implies `n(L) ⊆ O_F`, and `n(L) ⊆ O_F` implies `s(L) ⊆ 𝔇_{E/F}^{−1}`; globally,
`L` is scale-maximal (norm-maximal) iff every `L_v` is;
(b) at split places and at places unramified in `E` the two notions coincide;
(c) at a finite place nondyadic or unramified in `E`, any two scale-maximal lattices in `V_v` are
conjugate under `U(V_v)`; at every finite place, so are any two norm-maximal ones;
(d) normal forms at such places: if `v` splits, or `E_v/F_v` is unramified and `val(det V_v)` is
even, a maximal lattice (in either sense) is unimodular; if `E_v/F_v` is unramified and
`val(det V_v)` is odd, it is `M ⊥ N` with `M` unimodular of rank `n − 1` and `N` a `ϖ_v`-modular
line; if `E_v/F_v` is ramified and `v` nondyadic, a scale-maximal lattice is unimodular, and a
norm-maximal lattice is `L_{−1} ⊥ L_0` with `L_{−1}` `𝔓^{−1}`-modular and `L_0` unimodular with
anisotropic residue form, of rank `1` for odd `n`, `0` for even `n` with `ε(V_v) = 1`, and `2` for
even `n` with `ε(V_v) = −1` (the volumes `𝔳(L_v)` of the norm-maximal forms are [Kirschmer], Lemma
3.5.3 (2), (3), p. 43);
(e) the norm-maximal lattices of a global `V` form one genus, and, if no dyadic place of `F` ramifies
in `E`, so do the scale-maximal ones.

Route: (a) integral overlattices of `L` lie in `L^∨`, and norm-integral ones in `𝔇^{−1}L^∨`, because
`Tr(λh(x, y)) = h(λ̄x + y, λ̄x + y) − h(λ̄x, λ̄x) − h(y, y) ∈ O_F` for `λ ∈ O_E`; Noetherianity; the
local-global statement from 4.0(f), (g). (b) `𝔇_{E/F} = O_E` and `Tr(O_E) = O_F` there. (c), (d) at a
split place, where `L = (Λ, Λ′)` (2.3): `h(x, y) = (⟨y_1, x_2⟩, ⟨x_1, y_2⟩)` gives `s(L) = 𝔞 × 𝔞` and
`n(L) = 𝔞` for the ideal `𝔞 = ⟨Λ, Λ′⟩` of `O_v`, so `L` is integral (in either sense) iff
`Λ′ ⊆ Λ^*`, and then the unimodular `(Λ, Λ^*)` contains `L`; so `L` is maximal iff `Λ′ = Λ^*`, that
is iff `L` is unimodular, and any two such are conjugate under `GL(V_1)` (4.2(a)). At unramified
places: by 4.1 a maximal lattice has Jordan components only in scales `O_E` and `𝔓` (for a
`𝔓^a`-modular component `L_i` with `a ≥ 2`, replacing `L_i` by `ϖ^{−1}L_i` keeps the lattice integral);
a `ϖ`-modular component `L_i` of rank `≥ 2` has a residue form `ϖ^{−1}h` on `L_i/ϖL_i` that is a
nondegenerate Hermitian space over `k_{E_v}/k_v`, isotropic by 1.5, so some `x ∈ L_i ∖ ϖL_i` has
`h(x, x) ∈ ϖ²O_v`, and `L + O_Eϖ^{−1}x` is integral and strictly larger; unimodular lattices are
maximal because an integral `L' ⊇ L` lies in `L^∨ = L`; conjugacy from 4.2(a), (c). The finite-field
step has no split analogue: at a split place a `ϖ`-modular lattice of rank one exists (Checks) and is
excluded by the description above, not by an isotropic vector. At a ramified nondyadic place, a
`𝔓`-modular plane `O e ⊕ O f` (4.1(c)) lies in the integral unimodular `Π^{−1}O e ⊕ O f`, so scale-maximal means unimodular, conjugate by 4.2(b); for the
norm, a unimodular lattice whose residue form is isotropic contains a primitive isotropic vector
(Hensel, `q_v` odd), hence a plane `O e ⊕ O f` with `h(e, f) = 1`, `h(e, e) = h(f, f) = 0` that splits
off (4.2(d)), and this plane lies in the norm-integral `𝔓^{−1}`-modular `Π^{−1}O e ⊕ O f`;
so `L_0` has anisotropic residue form, of rank at most two, and its rank is fixed by `n` and `ε(V_v)`;
the `𝔓^{−1}`-modular part is determined by its rank (4.1(c)) and `L_0` by its rank and determinant
class (4.2(b)). Norm-maximal lattices at a dyadic ramified place: if `V_v` is anisotropic,
`M = {x ∈ V_v : h(x, x) ∈ O_v}` contains every norm-integral lattice and is a lattice, hence the only
norm-maximal one (bounded as `h(x, x)` is anisotropic, an `O_{E_v}`-module as
`h(λx, λx) = N(λ)h(x, x)`, and closed under addition because on the `F_v`-span of two of its vectors
`h(x, x)` is `a·t²` or `a·N_{K/F_v}` for a quadratic field `K`, integral exactly on a fractional ideal of
`O_v` or `O_K`). Otherwise take `x` primitive and isotropic in a norm-maximal `L`. Since
`h(y + μx, y + μx) = h(y, y) + Tr(μh(y, x))`, `L + O_{E_v}cx` is norm-integral whenever
`c·h(L, x) ⊆ 𝔇_{E/F}^{−1}`, so maximality and (a) give `h(L, x) = 𝔇_{E/F}^{−1}`; for `y ∈ L` with
`h(y, x)` generating it and `μ ∈ O_{E_v}` with `Tr(μh(y, x)) = −h(y, y)` (`Tr(𝔇_{E/F}^{−1}) = O_v`),
`x` and `f = y + μx` span a `𝔇_{E/F}^{−1}`-modular hyperbolic plane, an orthogonal summand of `L` (the
projection of `z ∈ L` has coefficients in `O_{E_v}`, as `h(z, x), h(z, f) ∈ 𝔇_{E/F}^{−1}`) with
norm-maximal complement. By induction `L` is `r` such planes (`r` the Witt index) plus the
norm-maximal lattice of the anisotropic kernel (1.2), so two norm-maximal lattices are isometric, and
an isometry between lattices spanning `V_v` is an element of `U(V_v)`. (e) from (c) and 4.0(g).

*Needs:* 1.2, 1.5, 4.0, 4.1, 4.2.

**Checks.**

- For `E = ℚ(√−3)` and `V = ⟨1, 2⟩`, `L = O_E e_1 ⊕ O_E e_2` is scale-maximal: at `2` (inert) it is
  `⟨1⟩ ⊥ ⟨2⟩`, and every overlattice `L + O_E x/2` has `h(x/2, x/2) ∉ ℤ_2` unless `x ∈ 2L`; at `3` it is
  unimodular. It is not norm-maximal: `V_3` is hyperbolic (`−2` is a norm from `ℚ_3(√−3)`, as
  `(−2, −3)_3 = 1`), so `L_3 = O e ⊕ O f` for a hyperbolic pair (4.2(d)), contained with index `3` in
  the norm-integral `Π^{−1}O e ⊕ O f`.
- At a ramified nondyadic place, `O e ⊕ O f` with `h(e, e) = h(f, f) = 0`, `h(e, f) = Π^{−1}` has norm
  `Tr(𝔓^{−1}) = O_F` and scale `𝔓^{−1}`, and contains the unimodular plane `OΠe ⊕ Of` with index
  `q_v`: the two notions differ at every ramified place, dyadic or not.
- Over `ℚ_2(i)`, with `Π = 1 + i` and `h(e, f) = 1`, `Π^{−1}O e ⊕ O f` has norm in `ℤ_2` and scale
  `Π^{−1}O_E`.
- The hyperbolic plane `ϖ O e ⊕ O f` with `h(e, f) = 1` at an inert place is integral and
  `ϖ`-modular of rank two, and is contained in the unimodular `O e ⊕ O f`.
- At a split place, in the line `V_v = E_v` with `x̄y` (`V_1 = V_2 = F_v`, `⟨a, b⟩ = ab`), the lattice
  `(O_v, ϖ_vO_v)` has scale `ϖ_vO_{E_v}` and is `ϖ_v`-modular of rank one; it has no isotropic vector (a
  line contains none, 1.4) and lies in the unimodular `(O_v, O_v)`. Enumerating, for `ϖ_v = 2` and
  `n = 1, 2`, the pairs `(Λ, Λ′)` of lattices between `2O_v^n` and `2^{−1}O_v^n`: the maximal integral pairs
  are exactly the unimodular ones (`3` of the `6` integral pairs for `n = 1`, `15` of `69` for `n = 2`).

### 4.5 Lattices and compact open subgroups

*Origin:* published: Borel (1963), the stabilizers of lattices in the local and in the finite adelic points of a linear
algebraic group are compact open, and a compact open subgroup of the finite adelic points lies in the stabilizer of a
family of local lattices almost all equal to those of a given lattice, a compact group fixing the sum of the finitely
many transforms of a lattice (the second clause of (a)), as located in AdelicAlgebraicGroups §1.5a; the form of (c)
with one global lattice, by gluing, is this roadmap's own formulation.

*Method of the formal proof:* the completed lattice is compact and open, so the matrices mapping it into itself form
an open set, which is closed and bounded by evaluation on a spanning family, hence compact; the stabilizer is the set of
`g` with `g` and `g^{−1}` in that set.

*Corollary of:* AdelicAlgebraicGroups §1.5a (*lattice-stabilizers*: stabilizers of local lattices and of families of
local lattices are compact open, and every compact open subgroup of `G(𝔸_{F,f})` lies in the stabilizer of a family
of local lattices almost all equal to those of a given lattice), for the first clause of (a), for (b), and for (c)
with a family of local lattices in place of one lattice.

Prove:
(a) `U(L_v)` is compact open in `U(V)(F_v)`, and every compact subgroup of `U(V)(F_v)` fixes some
lattice; (b) `K_L` is compact open in `U(V)(𝔸_f)`, and for lattices `L, L'` in `V`,
`[U(L_v) : U(L_v) ∩ U(L'_v)]` is finite and equal to `1` for almost all `v`; (c) every compact open
subgroup `K ⊂ U(V)(𝔸_f)` lies in `K_L` for some lattice `L`; given any lattice `L^0`, `L` can be
chosen with `L_v = L^0_v` at every `v` at which the projection of `K` lies in `U(L^0_v)`.

Route: `U(L_v) = U(V)(F_v) ∩ GL(L_v)`; a compact `C` fixes the finite sum `Σ_{c ∈ C/(C ∩ U(L^0_v))} cL^0_v`;
`L_v = L'_v` for almost all `v` (4.0(f)). (c): let `K_v` be the projection of `K` to `U(V)(F_v)`, a
compact subgroup; as `K` is compact in the restricted product, `K_v ⊆ U(L^0_v)` for almost all `v`.
Put `L_v = Σ_{c ∈ K_v/(K_v ∩ U(L^0_v))} cL^0_v`, a finite sum, stable under the group `K_v`, and equal
to `L^0_v` when `K_v ⊆ U(L^0_v)`; glue by 4.0(g); then `K ⊆ ∏_v K_v ⊆ K_L`.

*Needs:* 0.1, 4.0; AdelicAlgebraicGroups §1.5.

**Checks.**

- Compactness is needed in (a): on a hyperbolic plane `Ee ⊕ Ef`, the group generated by
  `g = diag(ϖ, ϖ^{−1})` fixes no lattice, since `gL = L` and `ce ∈ L` would give `ϖ^{−k}ce ∈ L` for
  every `k`.

### 4.6 Integral models of lattice stabilizers

*Origin:* adapted from Tits (1979), 3.9, 3.9.1, 3.8.1 and 1.15, Bruhat and Tits (1987), and Gan and Yu (2000): the
stabilizer of a lattice as the integral points of the schematic closure, and the reductive models at almost all
places, are published there; the reductive model of the stabilizer of a unimodular lattice at an unramified or split
place, with its special fibre, for the unitary group of a Hermitian space of any rank and in every residue
characteristic, is derived from the published cases (ReductiveGroupsPartII §RG2.3.5a).

*Method of the formal proof:* none; the statement is not in [FormalProof].

For a finite place `v` and a lattice `L_v ⊂ V_v`, define the integral model
`𝒰_{L_v}`: the schematic closure of `U(V)_{F_v}` in `Res_{O_{E_v}/O_v} GL(L_v)` over the discrete
valuation ring `O_v`. Prove that `𝒰_{L_v}(O_v) = U(L_v)`; that if `E_v/F_v` is unramified or split
and `L_v` is unimodular, `𝒰_{L_v}` is a reductive group scheme over `O_v`, with special fibre the
unitary group of `L_v/ϖ_vL_v` over `k_{E_v}/k_v` (resp. `GL_n`), in every residue characteristic; and
that for a lattice `L` in a global `V` these models are reductive at almost all `v`.

The first two statements are ReductiveGroupsPartII §RG2.3.5a (*hermitian-lattice-stabilizer-models*, (a) and (b));
the route below gives in addition the special fibre, and the last statement follows from the second, `L_v` being
unimodular and `E_v/F_v` unramified or split at almost all `v`.

Route: ReductiveGroupsPartII RG2.3.1 *schematic-closure*. At unramified unimodular places `L_v` has
an orthonormal basis (4.2(a)); the map `g ↦ g^*g` from `Res GL(L_v)` to the Hermitian matrices is
smooth along `𝒰_{L_v}`, its differential `X ↦ X + X^*` being onto `Herm_n(O_v)` because
`Tr : O_{E_v} → O_v` is onto; the fibres are connected (unitary and general linear groups over
fields); split places are the case `GL_n` (2.3).

*Needs:* 0.1, 1.5, 2.3, 4.2; ReductiveGroupsPartII RG2.3.1, RG2.3.5a.

**Checks.**

- For `E = ℚ(i)` and `L = ℤ[i]` with `x̄y`, the model at `p = 5` (split) is `G_m`, and at `p = 3`
  (inert) it is the norm-one torus of `ℤ_9/ℤ_3`, with `|U_1(𝔽_3)| = 4` points over `𝔽_3`.
- For the ramified `E_3 = ℚ_3(√−3)` and the unimodular line `O_{E_3}` with `x̄y`, write
  `x = a + bΠ`; then `N(x) ≡ a² mod ϖ`, and the special fibre of `𝒰_{L_3}` is `{a² = 1} × {b} ≅ μ_2 × 𝔾_a`,
  which is neither connected nor reductive (it has a unipotent part). Unimodularity alone does
  not give a reductive model at a ramified place.

### 4.7 Relative position of unimodular lattices and global hyperbolic splittings

*Origin:* adapted from Satake (1963), the Cartan decomposition for unramified unitary groups and for `GL_n`: here (a)
and (a′) read it as the relative position of two unimodular lattices, with an explicit hyperbolic family; (b) and (c),
the global hyperbolic splitting along an isotropic vector with its coefficient ideal, are this roadmap's own
formulation.

*Method of the formal proof:* for (b), for a CM extension unramified at every finite place, globally and by ideal
arithmetic: the ideal `h(L, x)` is invertible, which gives `y_0` with `h(x, y_0) = 1` such that `z ↦ h(z, x)y_0`
preserves `L`; with `θ ∈ O_E` of trace `1`, `y = y_0 − θh(y_0, y_0)x` is isotropic and the plane spanned by `x` and
`y` splits off. The route written here finds `y` from local solutions by additive strong approximation.

Prove:
(a) if `v` is a finite place unramified (and not split) in `E` and `L, M ⊂ V_v` are unimodular,
there are a hyperbolic family
`e_1, f_1, …, e_r, f_r` (`h(e_i, f_j) = δ_{ij}`, `h(e_i, e_j) = h(f_i, f_j) = 0`), integers
`a_1 ≥ ⋯ ≥ a_r ≥ 1`, determined by `L` and `M`, and a unimodular `L_0` orthogonal to the family
with `L = ⊕_i (Oe_i ⊕ Of_i) ⊥ L_0` and `M = ⊕_i (ϖ^{−a_i}Oe_i ⊕ ϖ^{a_i}Of_i) ⊥ L_0`;
(a′) if `v` splits, `E_v = F_v × F_v`, and `L = (Λ, Λ^*)`, `M = (Λ′, Λ′^*)` are unimodular (2.3),
there are an `O_v`-basis `u_1, …, u_n` of `Λ` and integers `b_1 ≥ ⋯ ≥ b_n`, the elementary divisors of
`Λ′` relative to `Λ`, with `Λ′ = ⊕_i ϖ_v^{b_i}O_v u_i`; equivalently, with the dual basis `u_i^*` of
`Λ^*`, the vectors `x_i = (u_i, u_i^*)` form an orthonormal basis of `L` and
`M = ⊕_i c_iO_{E_v}x_i` with `c_i = (ϖ_v^{b_i}, ϖ_v^{−b_i}) ∈ E_v^1`; every vector `(b_1 ≥ ⋯ ≥ b_n)` of
integers occurs;
(b) over a number field with no dyadic place ramified in `E`, let `L ⊂ V` be a lattice with `L_v`
unimodular at every finite `v`, and `x ∈ V` isotropic with `L ∩ Ex = 𝔞x`. There is an isotropic
`y ∈ V` with `h(x, y) = 1` and `L = (𝔞x ⊕ 𝔞̄^{−1}y) ⊥ (L ∩ ⟨x, y⟩^⊥)`; the first summand is a
unimodular lattice in the hyperbolic plane `Ex + Ey`, and it is `Oe ⊕ Of` with `h(e, f) = 1`,
`h(e, e) = h(f, f) = 0` at every finite place;
(c) for a skew-Hermitian `(W, w)` and lattices unimodular for `w`: (b) holds as stated with
`w(x, y) = 1`; and at a place of (a) or (a′), for a trace-zero unit `δ_v` of `O_{E_v}`, the
Hermitian `δ_v^{−1}w` has the same unimodular lattices, so (a) and (a′) hold for `h = δ_v^{−1}w`.

Route: (a) induction on the dimension: let `a ≥ 0` be least with `ϖ^aM ⊆ L` (then
`ϖ^aL ⊆ M` by duality); if `a = 0` then `M = L`; otherwise choose `x ∈ M` with `e = ϖ^a x` primitive in
`L` (at an inert place, `e ∉ ϖL`) and `f ∈ L` with `h(e, f) = 1`; the plane `P = Ee + Ef` meets `L` in
`Oe ⊕ Of` and `M` in `Oϖ^{−a}e ⊕ Oϖ^af`, both with unit Gram determinant, so both split off; `P` is
hyperbolic, and Hensel's lemma for `h(x, x) + Tr(t) + ϖ^{2a}N(t)h(f, f) = 0` in `t ∈ O_{E_v}`
(solvable modulo `ϖ` because `Tr` is onto) gives a hyperbolic basis `(e_1, f_1)` of `P` with
`e_1 = e + ϖ^{2a}t f`, `L ∩ P = Oe_1 ⊕ Of_1` and `M ∩ P = ϖ^{−a}Oe_1 ⊕ ϖ^aOf_1`; continue in
`P^⊥`; the `a_i` are determined because the elementary divisors of `M` relative to `L` over the
discrete valuation ring `O_{E_v}` are the `ϖ^{±a_i}` and `1`. (a′) the Smith normal form of `Λ′`
relative to `Λ` over `O_v` (Mathlib `Submodule.exists_smith_normal_form_of_le`, after scaling
`Λ′` into `Λ`); then `Λ′^* = ⊕ϖ_v^{−b_i}O_vu_i^*`, and
`h(x_i, x_j) = (⟨u_j, u_i^*⟩, ⟨u_i, u_j^*⟩) = δ_{ij}` (0.1). (b)
at each finite `v`, 4.2(d) applied to a generator of `𝔞_v x` gives local solutions `y_v`; the set of
`y ∈ V_v` with `h(x, y) = 1`, `h(y, y) = 0` and the required splitting of `L_v` is open, and for almost
all `v` it contains every such `y` in `L_v`; the variety `{y : h(x, y) = 1, h(y, y) = 0}` is an affine
space over `F` (`y = y_0 + z + μx` with `z ⊥ x, y_0` and `μ + μ̄ = −h(z, z)`), so additive strong
approximation gives a global `y` in all these open sets; then `𝔞x ⊕ 𝔞̄^{−1}y ⊆ L` locally everywhere,
hence globally (4.0(f)), and it splits `L`. (c) in (b) replace `μ + μ̄ = −h(z, z)` and the local
condition `Tr μ = −h(y, y)` by `μ − μ̄ = w(z, z)` and `μ − μ̄ = w(y, y)` as in 4.2(d); trace-zero units
exist at the places of (a) and (a′) (`(1, −1)` at a split place, `θ − θ̄` for `O_{E_v} = O_v[θ]`
unramified), and the dual for `δ_v^{−1}w` equals the dual for `w` because `δ_v` is a unit.

*Needs:* 0.1, 2.3, 4.0, 4.2; GlobalNumberFields Layer 6
(`IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap`); Mathlib
`Submodule.exists_smith_normal_form_of_le`.

**Checks.**

- (a) at an inert place with `n = 2`: `L = Oe ⊕ Of` and `M = ϖ^{−1}Oe ⊕ ϖOf` (`a_1 = 1`);
  `L ∩ M = Oe ⊕ ϖOf` and `L/(L ∩ M) ≅ k_{E_v}` is a simple module.
- (a′) for `n = 1`: `V_v = E_v` with `x̄y`, and the unimodular lattices are
  `L_a = (ϖ_v^aO_v, ϖ_v^{−a}O_v)`, `a ∈ ℤ`, with `b_1 = a` relative to `L_0`. The shape of (a) would
  force `M = L` here, since a hyperbolic family needs dimension two; for `n = 2` the relative position
  `b = (1, 0)` is not of the shape `(a_1, …, a_r, 0, …, 0, −a_r, …, −a_1)` either.
- In (b) the coefficient ideal cannot be dropped: over `E = ℚ(√−15)`, `F = ℚ` (`2` splits), take `V = H`
  with hyperbolic basis `x, y_0` and `L = 𝔞x ⊕ 𝔞̄^{−1}y_0` for a prime `𝔞` above `2`, which is not
  principal (`a² + 15b² = 8` has no solution); then
  `L ∩ Ex = 𝔞x` is not free, and `L` contains no pair `e, f` with `h(e, f) = 1` spanning a direct
  summand `Oe ⊕ Of` of rank two with `e ∈ Ex`.

### 4.8 Discriminant forms

*Origin:* adapted from Nikulin (1980), §1, the discriminant forms of integral symmetric bilinear forms over `ℤ`: here
over a Dedekind domain with involution, for `ε = ±1` and at split places, with the classification (c) by the
discriminant module, in this roadmap's own formulation; the classification by Jordan type at unramified places that
(c) rests on is Kirschmer (2016), Theorem 3.3.3 and Proposition 3.3.5, after Jacobowitz (1962).

*Method of the formal proof:* the order of `A_L` and special cases of its structure: `#A_L = #A_M·[M : L]²` for
`L ⊆ M` comes from `[L^∨ : M^∨] = [M : L]`, proved along a chain with simple quotients (a step with quotient `O/P`
dualises to a step with quotient `O/P̄`); and, for a CM extension unramified at every finite place, the lattices with
`A_L ≅ O_E/T`, `T` a completely split prime, form one genus, by way of their unimodular overlattice and the
transitivity of the local unitary group on sublattices with simple quotient. The route written here derives the order
from the volume ideal (4.0(c)) and the structure from Jordan splittings and the Smith normal form.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.7.6 (c) (at an unramified place of a local field of
characteristic zero, two lattices of a Hermitian space are conjugate under `U(V)` exactly when they have the same
Jordan type), for the first clause of (c) at unramified places, through (b).

Let `R`, `K`, `c`, `ε`, `V`, `H` and the duals be as in 4.0a, or let `R = O_{E_v} = O_v × O_v` with
the swap at a split place `v`, `V` a Hermitian space over `E_v` and duals as in 4.0 (componentwise,
2.3). A lattice `L ⊂ V` is integral if `H(L, L) ⊆ R`; then `L ⊆ L^∨`. For integral `L` define
the *discriminant module* `A_L = L^∨/L`, its *discriminant form*
`b_L : A_L × A_L → K/R`, `b_L(x + L, y + L) = H(x, y) + R`,
and `O(A_L)`: the group of `R`-linear
automorphisms `γ` of `A_L` with `b_L(γx, γy) = b_L(x, y)`. For integral `L`, `M`, an *anti-isometry*
`A_L → A_M` is an `R`-linear isomorphism `γ` with `b_M(γx, γy) = −b_L(x, y)`. For the Hermitian
lattices of 4.0 (`R = O_E` or `O_{E_v}`, `c = σ`, `ε = 1`) the values lie in `E/O_E` (resp.
`E_v/O_{E_v}`), and at a finite place `t(L_v)` is the minimal number of generators of the
`O_{E_v}`-module `A_{L_v}`: when `E_v` is a field it is the invariant `t(L_v)` of
GeometryOfNumbersAndQuadraticArithmetic 2.7.3 (the number of positive exponents of `L_v^∨/L_v`), and
at a split place it is the common value for the two components `A_1`, `A_2` of (c). Prove:
(a) `A_L` has finite length; `b_L` is well defined, `c`-semilinear in the first variable, with
`b_L(y, x) = ε·c(b_L(x, y))`, and nondegenerate: `b_L(x, A_L) = 0` only for `x = 0`. `A_{L ⊥ M}` is the
orthogonal sum `A_L ⊥ A_M`; an isometry `g : (V, H) → (V′, H′)` induces an isometry `A_L → A_{gL}`, in
particular a homomorphism `ρ_L : U(L) → O(A_L)`; the lattice
`L` of `(V, −H)` has the form `−b_L`. For a Hermitian lattice over a number field (`R = O_E`,
`c = σ`), `#A_L = N_{F/ℚ}(𝔳(L))²`, and `A_L = ⊕_v A_{L_v}` over the finite places (almost all terms
zero), an orthogonal sum for `b_L` under `E/O_E = ⊕_v E_v/O_{E_v}`; so `O(A_L) = ∏_v O(A_{L_v})`, and an
anti-isometry `A_L → A_M` is a family of local anti-isometries.
(b) *Jordan type* (every finite place, dyadic and ramified places included). If
`L_v = L_1 ⊥ ⋯ ⊥ L_m` with `L_i` `𝔓^{a_i}`-modular of rank `n_i` (4.1, 4.3; `𝔓 = ϖ_vO_{E_v}` at a
split place), then `A_{L_v} ≅ ⊕_i (O_{E_v}/𝔓^{a_i})^{n_i}`. Hence the module `A_{L_v}` determines the
scales `a_i > 0` of the constituents of positive scale together with their ranks: they are its
invariant factors (GeometryOfNumbersAndQuadraticArithmetic 2.7.3 when `E_v` is a field). Moreover
`t(L_v) = Σ_{a_i > 0} n_i` (the constituents of positive scale counted with their ranks), the unimodular
constituent has rank `n − t(L_v)`, `t(L_v)` is the corank of the reduction modulo `𝔓` of the Gram matrix
of any `O_{E_v}`-basis of `L_v` (at a split place, of each of its two components), and, when `E_v` is a
field, `length_{O_{E_v}} A_{L_v} = Σ_i a_in_i = v_𝔓(𝔳(L_v)O_{E_v})`, the invariant `val(L_v)` of 2.7.3.
Two integral lattices with isomorphic discriminant modules have the same `t(L_v)` at every `v` and the
same volume ideal.
(c) *Split and unramified places.* Let `v` be split or unramified. Two integral lattices of the same
rank with isomorphic discriminant modules are isometric; `(A_{L_v}, b_{L_v})` is isometric to
`⊥_i (O_{E_v}/ϖ_v^{a_i})^{n_i}` with the form `ϖ_v^{−a_i}Σ_j x̄_jy_j` on the `i`-th summand; and
`(A_{L_v}, b_{L_v})` is anti-isometric to itself. At a split place, write `A_{L_v} = A_1 × A_2` along
`E_v = F_v × F_v`; `b_{L_v}` restricts to a perfect pairing `A_1 × A_2 → F_v/O_v`, and
`γ ↦ γ|_{A_1}` is an isomorphism from `O(A_{L_v})` onto `Aut_{O_v}(A_1)`, the component on `A_2` being
the inverse of the transpose.

*Comparison with the quadratic case.* For `R = ℤ`, `c = id`, `ε = 1` (a nondegenerate symmetric form on
a finite-dimensional `ℚ`-space and an integral `ℤ`-lattice), `(A_L, b_L)` is Tau Ceti's discriminant
bilinear module: `TauCeti.IntegralLattice.DiscriminantGroup` with
`TauCeti.IntegralLattice.discriminantPairing`, packaged as `discriminantBilinearModule`, nondegenerate
by `isNondegenerate_discriminantBilinearModule` and functorial by
`Isometry.discriminantBilinearIsometry` (the native labels 1C, 1D of IntegralLattices). For this case
the target is the comparison isomorphism between `A_L` and
`IntegralLattice.DiscriminantGroup`, carrying `b_L` to `discriminantPairing`; through it (a) is the
native statement, and nothing of (a) is proved again for `ℤ`-lattices. Beyond that case 4.8 covers the
involution `c ≠ id` (Hermitian lattices over `O_E` and `O_{E_v}`), `ε = −1`, a general Dedekind domain,
the split places, and the local structure (b), (c).

Route: (a) `b_L` is well defined because `H(L^∨, L) ⊆ R`; `b_L(x, A_L) = 0` means `x ∈ (L^∨)^∨ = L`
(4.0a(a)); the other identities are formal. The order is `[L^∨ : L] = 𝔳(L)O_E` (4.0(c)); the local
decomposition follows from 4.0(f) (duals and quotients localize) and the Chinese remainder theorem for
the torsion module `E/O_E`. (b) A `𝔓^a`-modular `L_i` has `L_i^∨ = 𝔓^{−a}L_i` (Conventions) and duals of
orthogonal sums are sums (4.0(a)), which gives the decomposition; the exponents are unique by
GeometryOfNumbersAndQuadraticArithmetic 2.5.3–2.5.4 (the number of exponents `≥ j` is the dimension of
`𝔓^{j−1}A/𝔓^jA` over the residue field; at a split place over each factor `O_v`), and `t(L_v)` is the
case `j = 1`, the minimal number of generators by Nakayama's lemma. In a basis `e_i` of `L_v` with Gram
matrix `H` and the dual basis `e_i^*` of `L_v^∨` (`h(e_i^*, e_j) = δ_{ij}`), `e_j = Σ_i H_{ij}e_i^*`, so
`A_{L_v}` is the cokernel of `H` on `O_{E_v}^n` and `dim A_{L_v}/𝔓A_{L_v}` is the corank of `H` modulo
`𝔓` (componentwise at a split place). The length is 4.0(c). (c) by (b)
the two lattices have the same Jordan type, so they are isometric by 4.2(c) at an unramified place
and, at a split place, because for `L_v = (Γ_1, Γ_2)` (2.3) the Jordan type is the list of elementary
divisors of `Γ_2^*` relative to `Γ_1`, which determine the pair `Γ_1 ⊆ Γ_2^*` up to `GL(V_1)` (Smith
normal form, Mathlib `Submodule.exists_smith_normal_form_of_le`); a Jordan splitting with Gram
matrices `ϖ_v^{a_i}·1` (4.2(a)) gives the normal form of `b_{L_v}`; for the anti-isometry multiply by a
unit `u` with `uū = −1` (units are norms at these places). At a split place
`b((x_1, x_2), (y_1, y_2)) = (⟨y_1, x_2⟩, ⟨x_1, y_2⟩)` (4.2(d)), so the `O_{E_v}`-linear maps preserving
`b` are the pairs `(γ_1, (γ_1^t)^{−1})`. The comparison: for `R = ℤ` both modules are the quotient of
the same dual lattice `L^∨` by `L`, and both pairings are `H(x, y)` reduced modulo `ℤ` on
representatives.

*Needs:* 2.3, 4.0, 4.0a, 4.1, 4.2, 4.3; GeometryOfNumbersAndQuadraticArithmetic 2.5.3, 2.5.4, 2.7.3;
Mathlib `Submodule.exists_smith_normal_form_of_le`, `Module.length`; Tau Ceti
`TauCeti.IntegralLattice.DiscriminantGroup`, `discriminantPairing`, `discriminantBilinearModule` (the
case `R = ℤ`).

**Checks.**

- At an inert `v`, `L = ⟨ϖ_v^a⟩`: `A_L = O_{E_v}/ϖ_v^a` with `b(x, y) = ϖ_v^{−a}x̄y`, and `O(A_L)` is the
  group of units `u` of `O_{E_v}/ϖ_v^a` with `uū ≡ 1 mod ϖ_v^a`, of order `(q_v + 1)q_v^{a−1}` for `a ≥ 1`
  (`3, 6` for `q_v = 2`; `4, 12` for `q_v = 3`, `a = 1, 2`); for `a = 0`, `L` is unimodular, `A_L = 0` and
  `O(A_L)` is trivial, of order `1`. The module automorphisms form the group `(O_{E_v}/ϖ_v^a)^×`, of
  order `(q_v² − 1)q_v^{2(a−1)}` for `a ≥ 1`, which contains `O(A_L)` with index `(q_v − 1)q_v^{a−1}`. The
  two groups coincide for `a = 0` and for `q_v = 2`, `a = 1` (every unit of `𝔽_4` has norm `1`: both have
  order `3`), and differ otherwise (`8` against `4` for `q_v = 3`, `a = 1`; `12` against `6` for `q_v = 2`,
  `a = 2`): the isometry group of the form, not the automorphism group of the module, is the one that
  enters 4.9 and 6.1d.
- The order does not determine the module: `⟨ϖ_v²⟩` and `⟨ϖ_v, ϖ_v⟩` have discriminant modules of
  order `q_v⁴`, namely `O_{E_v}/ϖ_v²` and `(O_{E_v}/ϖ_v)²`, with `t(L_v) = 1` and `2`.
- (c) fails at a ramified place: over `ℚ_3(√−3)`, `⟨3⟩` and `⟨−3⟩` both have discriminant module
  `O_E/𝔓²`, but an isometry of the forms `x̄y/3` and `−x̄y/3` would be a unit `u` with `uū ≡ −1 mod 3`,
  while `N(a + b√−3) = a² + 3b² ≡ a²` is `1 mod 3` for every unit; the lattices are not isometric (their
  determinants differ by the non-norm `−1`), and `A_{⟨3⟩}` is not anti-isometric to itself.

### 4.9 Gluing along discriminant forms

*Origin:* adapted from Nikulin (1980), Propositions 1.4.1, 1.5.1 and 1.6.1, the gluing of even `ℤ`-lattices along
discriminant forms: here over a Dedekind domain with involution, for `ε = ±1`, for unimodular lattices that need not be
even and at split places, with the counts (c), the global product (d) and the local existence criterion (e), in this
roadmap's own formulation.

*Method of the formal proof:* at each prime the projections of a self-dual lattice `Λ` with `Λ ∩ U = M`,
`Λ ∩ U′ = M′` are onto the duals of `M` and `M′`, so `Λ/(M ⊕ M′)` is the graph of an isomorphism of discriminant
modules, and comparison with one fixed `Λ_0` identifies the set of such `Λ` with the form-preserving automorphisms of
the discriminant module of `M′`; the global count is the product of the local ones because lattices are patched from
their localizations, and existence is by an explicit local construction from a Jordan basis of `M`. The route written
here obtains the local lattice of (e) from the classification by Jordan type and (b).

Let `R`, `K`, `c`, `ε`, `V`, `H` be as in 4.8 (a Dedekind domain with involution as in 4.0a, or
`O_{E_v}` at a split place), `V = U ⊥ U′` with `U`, `U′` nondegenerate and `P_U`, `P_{U′}` the
orthogonal projections, and `M ⊂ U`, `M′ ⊂ U′` lattices (duals taken in `U` and `U′`). Prove:
(a) If `Λ ⊂ V` is a lattice with `Λ^∨ = Λ`, `Λ ∩ U = M` and `Λ ∩ U′ = M′`, then `M` and `M′` are
integral, `P_U(Λ) = M^∨`, `P_{U′}(Λ) = M′^∨`, `M ⊕ M′ ⊆ Λ ⊆ M^∨ ⊕ M′^∨`, and `Λ/(M ⊕ M′) ⊂ A_M ⊕ A_{M′}` is
the graph of an anti-isometry `γ_Λ : A_M → A_{M′}`. In particular, for a unimodular `Λ` and a
nondegenerate subspace `U`, `Λ ∩ U` and `Λ ∩ U^⊥` have anti-isometric discriminant forms, hence (4.8)
the same invariant `t` at every place, the same volume ideal, and isomorphic isometry groups of their
discriminant forms.
(b) Conversely, if `M` and `M′` are integral, then for every anti-isometry `γ : A_M → A_{M′}` the lattice
`Λ_γ = {x + y : x ∈ M^∨, y ∈ M′^∨, γ(x + M) = y + M′}` is
unimodular with `Λ_γ ∩ U = M` and `Λ_γ ∩ U′ = M′`, and `Λ ↦ γ_Λ`, `γ ↦ Λ_γ` are inverse bijections.
(c) This set of lattices is empty or a principal homogeneous set under `O(A_{M′})` acting by `γ ↦ δ∘γ`
(and under `O(A_M)`): it is in bijection with `O(A_{M′})` (and with `O(A_M)`) if `A_M` and `A_{M′}` are
anti-isometric, and empty otherwise. When the residue fields of `R` are finite, `A_M` and `A_{M′}` are
finite (finite length, 4.8(a)), and the number of these lattices is `#O(A_{M′}) = #O(A_M)` or `0`; over a
Dedekind domain with an infinite residue field these groups can be infinite (Checks). An isometry
`g_U ⊕ g_{U′}` of `U ⊥ U′` with `g_UM = M`, `g_{U′}M′ = M′` maps `Λ_γ` to
`Λ_{ρ_{M′}(g_{U′})∘γ∘ρ_M(g_U)^{−1}}`. *The form of the formal proof* of (c): it uses (c) in the form: the number of these
lattices at a place is `0` or `#O(A_{M′})`; if it is not `0`, then `A_M ≅ A_{M′}` as modules; and it does not change
when `M′` is replaced by `gM′` for an isometry `g` of `V` fixing `U` pointwise. (c) implies it.
(d) *Global form.* For Hermitian lattices over a number field (`R = O_E`, `c = σ`, `ε = 1`),
`Λ ↦ (Λ_v)_v` is a bijection from the set of unimodular lattices `Λ` of the fixed space `V` with
`Λ ∩ U = M` and `Λ ∩ U′ = M′` onto the product, over the finite places, of the corresponding local
sets; at every `v` at which `M_v` and `M′_v` are unimodular the local set is `{M_v ⊥ M′_v}`. So the
number of these lattices (lattices, not classes) is the finite product of the local numbers:
`∏_v #O(A_{M′_v})` if `A_{M_v}` and `A_{M′_v}` are anti-isometric at every `v`, and `0` otherwise.
*The form of the formal proof* of (d): for `E/F` a CM extension unramified at every finite place, it uses (d) for `U′`
totally positive definite and when some unimodular `Λ_0` has `Λ_0 ∩ U = M`; then all the local numbers are nonzero if
and only if `M′` and `Λ_0 ∩ U′` are, at every prime, carried into one another by an isometry of `V` fixing `U`
pointwise. (a), (c), (d), 4.8(c) and 2.5(f) imply it.
(e) *Existence at split and unramified places.* Let `v` be split or unramified, `M_v ⊂ U_v` integral
and `n′ = dim U′_v`. There are a lattice `M′_v ⊂ U′_v` and a unimodular `Λ_v ⊂ V_v` with
`Λ_v ∩ U_v = M_v` and `Λ_v ∩ U′_v = M′_v` if and only if `t(M_v) ≤ n′` and `V_v` contains a unimodular
lattice; `M′_v` is then unique up to `U(U′_v)`: its constituents of positive scale are those of `M_v`,
and its unimodular constituent has rank `n′ − t(M_v)`. *The form of the formal proof* of (e) is global and is the
sufficiency only, with the strict `t(M_v) < n′` and a unimodular lattice of `V`: for `E/F` a CM extension unramified at
every finite place, `U′` totally positive definite and `M ⊂ U` integral, if `V` contains a unimodular lattice and
`t(M_v) < n′` at every finite `v`, some unimodular `Λ ⊂ V` has `Λ ∩ U = M`. The existence criterion of 6.4a(b) implies it.
At ramified places, dyadic ones included, (a)–(d) hold as stated; (e) does not (Checks).

*Comparison with the quadratic case.* For `R = ℤ`, `c = id`, `ε = 1`, statements (a)–(c) for even `M`,
`M′` and even unimodular `Λ`, with the isometries `q_M → −q_{M′}` of the quadratic discriminant forms in
place of the anti-isometries of `b_M`, `b_{M′}`, are Tau Ceti's gluing (Nikulin, Proposition 1.6.1):
`TauCeti.IntegralLattice.glueAlongDiscriminant` with `isUnimodular_glueAlongDiscriminant` and
`mem_glueAlongDiscriminant_left_iff`, and the converse `exists_eq_glueAlongDiscriminant`. The integral
overlattices of `M ⊥ M′` are the bilinear-isotropic subgroups of its discriminant group, unimodular
exactly when they are Lagrangian (`integralIntermediateCarrierOrderIsoIsotropicSubgroup`,
`IntermediateCarrier.IsIntegral.isUnimodular_toIntegralLattice_iff_isLagrangian`). For `R = ℤ` the
target is (a)–(c) for unimodular lattices that need not be even, read off these native correspondences
through the comparison of 4.8 (the Lagrangians meeting both summands trivially are the graphs of the
anti-isometries); nothing of the even case is proved again. Beyond that case 4.9 covers the involution
`c ≠ id`, `ε = −1`, a general Dedekind domain, the split places, the global form (d) and the local
existence (e).

Route: (a) `H(M, M) ⊆ H(Λ, Λ) ⊆ R`, so `M` and `M′` are integral; `(Λ ∩ U)^∨ = P_U(Λ^∨) = P_U(Λ)` (4.0a(b);
at a split place componentwise, for the pairing of 2.3, as in the route of 4.0), so `P_U(Λ) = M^∨`,
and `Λ ⊆ P_U(Λ) ⊕ P_{U′}(Λ)`. The map `Λ → A_M`, `λ ↦ P_Uλ + M`, is onto with kernel `M ⊕ M′` (if
`P_Uλ ∈ M ⊆ Λ`, then `λ − P_Uλ ∈ Λ ∩ U′ = M′`), and so is the map to `A_{M′}`; so `Λ/(M ⊕ M′)` is the
graph of an isomorphism `γ_Λ`, and `H(λ, μ) ∈ R` for `λ, μ ∈ Λ` says `b_M + b_{M′}∘(γ_Λ × γ_Λ) = 0`. The
consequences are 4.8(b) and the conjugation `δ ↦ γ^{−1}δγ`. (b) `Λ_γ` contains `M ⊕ M′`, lies in
`M^∨ ⊕ M′^∨`, is integral because `γ` is an anti-isometry, and meets `U` in
`{x ∈ M^∨ : γ(x + M) = 0} = M` (and `U′` in `M′`). It is unimodular: `Λ_γ ⊆ Λ_γ^∨ ⊆ (M ⊕ M′)^∨ = M^∨ ⊕ M′^∨` (4.0a(a)); let `x + y ∈ Λ_γ^∨` with `x ∈ M^∨`, `y ∈ M′^∨`, and write `x̄`, `ȳ` for the classes.
For every `x′ ∈ M^∨` choose `y′ ∈ M′^∨` with `y′ + M′ = γ(x′ + M)`; then `x′ + y′ ∈ Λ_γ`, so
`b_M(x̄, x̄′) + b_{M′}(ȳ, γx̄′) = 0`, while `b_M(x̄, x̄′) + b_{M′}(γx̄, γx̄′) = 0` because `γ` is an
anti-isometry. Hence `b_{M′}(ȳ − γx̄, γx̄′) = 0` for every `x̄′`; as `γ` is onto, the nondegeneracy of
4.8(a) gives `ȳ = γx̄`, that is `x + y ∈ Λ_γ`. The two maps are inverse by construction. (c)
composition with isometries; the action of `g` is read off the definition of `Λ_γ`. (d) unimodularity
is local (4.0(f): duals commute with completion), and so are the intersections: for unimodular `Λ`,
`Λ ∩ U = (P_UΛ)^∨` (4.0a(b), dualized in `U` by 4.0a(a)), and `P_U` and duals commute with completion
(4.0(f)), so `(Λ ∩ U)_v = Λ_v ∩ U_v`, and the same for `U′`. Local lattices equal to `M_v ⊥ M′_v` at
almost all `v` glue (4.0(g)) to a unimodular `Λ` whose intersection with `U` has the completions
`M_v`, hence is `M` (a lattice is determined by its completions, 4.0(f), (g)); at a place where
`A_{M_v} = A_{M′_v} = 0` the only map is `0`; the global count is 4.8(a). (e) By (a) and 4.8(b), `M′_v`
has the stated Jordan type; at an inert place a lattice of this type exists in `U′_v` iff
`val det U′_v ≡ Σ_{i ≥ 1} a_in_i (mod 2)` (2.1, units being norms), and since
`val det U_v ≡ Σ_{i ≥ 1} a_in_i` this is the parity condition of 4.2(a) for `V_v`; at a split place it
always exists. Lattices of one Jordan type have isometric discriminant forms that are anti-isometric
to themselves (4.8(c)), so (b) produces `Λ_v`; uniqueness is 4.8(c) and the transitivity of
`U(U′_v)` on isometric lattices of `U′_v` (an isometry between lattices spanning `U′_v` is an element
of `U(U′_v)`). The comparison: for `R = ℤ`, `M ⊥ M′` and its overlattices are lattices of one
rational space, the subgroup `Λ/(M ⊕ M′)` of the native discriminant group of `M ⊥ M′` is the graph of
(a), and (b) is the native correspondence applied to that graph.

*Needs:* 2.1, 2.3, 2.5, 4.0, 4.0a, 4.2, 4.8; Tau Ceti `TauCeti.IntegralLattice.glueAlongDiscriminant`,
`exists_eq_glueAlongDiscriminant`, `integralIntermediateCarrierOrderIsoIsotropicSubgroup` (the case
`R = ℤ`).

**Checks.**

- Inert `v`, `q_v = 2`: for `M = ⟨2⟩` and `M′ = ⟨1⟩ ⊥ ⟨2⟩` (so `dim V_v = 3`), enumerating the
  isotropic `O_E`-submodules of `A_M ⊕ A_{M′}` of order `|A_M|^{1/2}|A_{M′}|^{1/2}` that meet both
  summands trivially gives `3 = q_v + 1 = #O(A_{M′})` lattices; `M = ⟨4⟩`, `M′ = ⟨1, 4⟩` gives `6`;
  `M = ⟨2, 2⟩`, `M′ = ⟨2, 2⟩` gives `18 = |U_2(𝔽_2)|`; `M = ⟨4⟩`, `M′ = ⟨2, 2⟩` gives `0`, although
  `|A_M| = |A_{M′}| = 16`, because `O_E/4 ≇ (O_E/2)²`.
- Split `v`, `p = 3`: `M = ⟨9⟩`, `M′ = ⟨1, 9⟩` gives `6 = #(ℤ/9)^×`; `M = ⟨3⟩`, `M′ = ⟨3, 3⟩` gives `0`.
- An infinite residue field: over `R = ℚ[[t]]` (`c = id`, `ε = 1`), `M = R²` with Gram matrix `tJ` and
  `M′ = R²` with Gram matrix `−tJ`, `J = [[0, 1], [1, 0]]`, have `A_M = A_{M′} = ℚ²` with the forms
  `±t^{−1}x^TJy`; every `diag(a, a^{−1})`, `a ∈ ℚ^×`, is an anti-isometry, so by (b) infinitely many
  unimodular lattices meet `U` in `M` and `U′` in `M′`.
- (e) fails at a ramified place: over `ℚ_3(√−3)` let `U = Ee`, `U′ = Ef` with `h(e, e) = h(f, f) = 3`
  and `M = O_Ee`. `V ≅ ⟨1, 1⟩` contains unimodular lattices and `t(M_3) = 1 = dim U′`, but the only
  lattice of `U′` with discriminant module `O_E/𝔓²` is `O_Ef ≅ ⟨3⟩`, whose form is not anti-isometric to
  that of `M` (4.8's Check), and indeed no unimodular `Λ` meets `U` in `M`; with `h(f, f) = −3` there
  are `6 = #O(A_M)`. At the dyadic ramified `ℚ_2(i)`, `M = M′ = ⟨2⟩` gives `2 = #O(A_{M′})`, as (c) says.
- Global: `E = ℚ(√−3)`, `V = ⟨1, 1⟩`, `U = E(1, 1)`, `U′ = E(1, −1)`, `M = O_E(1, 1)` and
  `M′ = O_E(1, −1)` (both `⟨2⟩`). Only the inert place `2` contributes, with `#O(A_{M′_2}) = 3`: the three
  lattices are `O_E²` and its images under the isometries acting by `ω`, `ω²` on `U′` and trivially on
  `U` (`ω` a cube root of unity, acting on `A_{M′} = O_E/2` by a unit of norm `1`).

### 4.10 Sublattices of given index

*Origin:* this roadmap's own formulation: the counts of the submodules of given index by Gaussian binomial
coefficients and of the ideals of given norm, with the bounds `d^{Ω(m)}` and `s_j(i) ≤ i^{j + log₂[E : ℚ]}` that
[FormalProof] uses.

*Method of the formal proof:* only the bounds are proved: the ideals of norm `m` of `O_K` number at most
`[K : ℚ]^{Ω(m)}` because each is `PJ` with `P` one of the at most `[K : ℚ]` primes above the least prime factor of `m`
(induction on `m`), and the submodules of index `i` of a lattice of rank `j` number at most `[E : ℚ]^{Ω(i)}·i^j`
because the count is submultiplicative on coprime indices and, for `i = p^e`, every proper submodule lies in one of at
most `N(P)^j` maximal submodules for each prime `P` above `p` (induction on `e`).

Prove:
(a) let `O` be a discrete valuation ring with residue field of `q` elements and `j ≥ 1`; the number of
`O`-submodules of `O^j` of colength `e` (index `q^e`) is the Gaussian binomial coefficient
`[e + j − 1 choose j − 1]_q`, which is at most `q^{ej}` and at most `(e + 1)^j·q^{e(j−1)}` (it is the sum of
`q^{Σ_i (i−1)c_i}` over the `(c_1, …, c_j)` with `Σ c_i = e`);
(b) for a number field `K` of degree `d`, the number of ideals of `O_K` of norm `m` is at most
`m^{log₂ d}`; more precisely it is at most `d^{Ω(m)}`, `Ω(m)` the number of prime factors of `m` with multiplicity;
(c) let `E` be a number field and `L` an `O_E`-lattice of rank `j ≥ 1` (a finitely generated projective
`O_E`-module of rank `j`). For an integer `i ≥ 1`, the number `s_j(i)` of `O_E`-submodules `N ⊆ L` with
`#(L/N) = i` depends only on `j` and `i`: it is the sum, over the ideals `∏_𝔓 𝔓^{e_𝔓}` of `O_E` of norm `i`,
of `∏_𝔓 [e_𝔓 + j − 1 choose j − 1]_{N𝔓}`; and `s_j(i) ≤ i^{j + log₂[E : ℚ]}`.

Route: (a) induction on `j`: for `N ⊆ O^{j−1} ⊕ O`, put `N_1 = N ∩ O^{j−1}` and let `ϖ^cO` be the image
of `N` in the last factor; the `N` with given `N_1` (of colength `e_1`) and `c` are the graphs
`N_1 + O(y + ϖ^c e_j)`, `y ∈ O^{j−1}/N_1`, so there are `q^{e_1}` of them and `e = e_1 + c`. The generating
series is therefore `∏_{t=0}^{j−1}(1 − q^tX)^{−1}`, whose coefficients are the Gaussian binomials, and
`[e + j − 1 choose j − 1]_q = ∏_{t=1}^{e}(q^{j−1+t} − 1)/(q^t − 1) ≤ q^{e(j−1)}∏_{t=1}^{e}(1 − q^{−t})^{−1} ≤ q^{ej}`
(the last product is at most `2 ≤ q` for `e = 1` and below `3.5 < 4 ≤ q^e` for `e ≥ 2`). (b) The count
is multiplicative in `m`; for `m = p^a` an ideal of norm `p^a` is a solution of `Σ_k f_ke_k = a` over the
primes above `p`, and spreading each `e_k` over `f_k` slots embeds these solutions in the compositions
of `a` into at most `d` parts, of which there are at most `C(a + d − 1, d − 1) ≤ d^a ≤ (p^a)^{log₂ d}`. (c)
A submodule of finite index is determined by its localizations, which equal `L_𝔓 ≅ O_{E,𝔓}^j` at almost
every `𝔓`, and every such family comes from a submodule (4.0(f), (g)); the index is the product of the
local indices `N𝔓^{e_𝔓}`. Apply (a) at each `𝔓`, `∏_𝔓 N𝔓^{e_𝔓j} = i^j`, and (b) for `K = E`.

*Needs:* 4.0.

**Checks.**

- `E = ℚ(i)`, `L = ℤ[i]²` (`log₂[E : ℚ] = 1`): enumerating the `ℤ[i]`-stable sublattices of `ℤ⁴` in Hermite
  normal form gives `3, 7, 12, 15, 10, 36` submodules of index `2, 4, 5, 8, 9, 10`, the values of (c)
  (for `i = 9`, the inert `3` with `N𝔓 = 9`: `[2 choose 1]_9 = 10`; for `i = 5`, the two primes of norm
  `5`: `6 + 6`), against the bounds `8, 64, 125, 512, 729, 1000`. In rank one the counts `1, 1, 2, 3` for
  `i = 2, 4, 5, 25` are the numbers of ideals of these norms.
- (a) is not `q^{e(j−1)}`: for `j = 2`, `e = 1` there are `q + 1` submodules, the lines of `k^2`.

### 4.11 Integral lattices meeting two orthogonal subspaces

*Origin:* adapted from Nikulin (1980), Propositions 1.4.1 and 1.5.1, the overlattices of a `ℤ`-lattice and the
isotropic subgroups of its discriminant group: here over a Dedekind domain with involution, with the index identity (b)
and the count (c), in this roadmap's own formulation.

*Method of the formal proof:* every integral `L` with `L ∩ U = M` and `L ∩ U′ = M′` lies between `M ⊕ M′` and
`M^∨ ⊕ M′^∨`; over a Dedekind domain a lattice between two lattices is generated over the smaller by no more elements
than the larger is, so these `L` are images of tuples of generators in the finite quotient, which gives the bound with
exponent the number of generators of the two duals. The route written here bounds the number of graphs through
`dim U′` generators of `W′`, and proves the equality of (b) by duality, where the formal proof has the inequality, by
the multiplicativity of indices.

Let `R`, `K`, `c`, `ε`, `V = U ⊥ U′` be as in 4.9, with `R` having finite residue fields (for instance
`O_E` or `O_{E_v}`), and let `L ⊂ V` be an integral lattice, `M = L ∩ U`, `M′ = L ∩ U′`. Prove:
(a) `M`, `M′` are integral and `M ⊕ M′ ⊆ L ⊆ L^∨ ⊆ M^∨ ⊕ M′^∨`; the projections `λ ↦ P_Uλ + M` and
`λ ↦ P_{U′}λ + M′` are injective on `L/(M ⊕ M′)`, so `L/(M ⊕ M′) ⊂ A_M ⊕ A_{M′}` is the graph of an
`R`-linear isomorphism `γ` between submodules `W ⊆ A_M` and `W′ ⊆ A_{M′}`, with `b_M + b_{M′}∘(γ × γ) = 0`
on `W`; conversely, for integral `M ⊂ U`, `M′ ⊂ U′`, every such graph is `L/(M ⊕ M′)` for exactly one
integral `L` with `L ∩ U = M`, `L ∩ U′ = M′`;
(b) `#A_M·#A_{M′} = #A_L·[L : M ⊕ M′]²` and `[L : M ⊕ M′] ≤ min(#A_M, #A_{M′})`; hence
`#A_{M′} ≤ #A_M·#A_L`;
(c) for given integral `M`, `M′`, the number of integral `L` with `L ∩ U = M` and `L ∩ U′ = M′` is at most
`(#A_M·#A_{M′})^{dim U′}`.
4.9(a), (b) are the case `A_L = 0`, where `W = A_M`, `W′ = A_{M′}`.

*The form of the formal proof* of (c): for `E/F` a CM extension unramified at every finite place, `V` totally positive
definite and integral `L` with cyclic discriminant module (`L^∨ = L + O_E x`), `#A_L = N_0` and `#A_M = n`, the number
of such `L` with given `L ∩ U = M` and `L ∩ U′ = M′` is at most `(n·nN_0)^{2 dim U′ + 1}`. (c) implies this bound,
as `#A_{M′} ≤ nN_0` by (b).

Route: (a) as in the route of 4.9(a): `L ⊆ L^∨ ⊆ (M ⊕ M′)^∨ = M^∨ ⊕ M′^∨` (4.0a(a)), and if `P_Uλ ∈ M ⊆ L`
then `λ − P_Uλ ∈ L ∩ U′ = M′`; integrality of `L` is the isotropy of the graph; conversely the preimage of
a graph meeting `A_M ⊕ 0` and `0 ⊕ A_{M′}` trivially meets `U` in `M` and `U′` in `M′`, and it is integral
exactly when the graph is isotropic. (b) `#A_M·#A_{M′} = [M^∨ ⊕ M′^∨ : M ⊕ M′]`, which is
`[M^∨ ⊕ M′^∨ : L^∨]·#A_L·[L : M ⊕ M′]`, and `(M ⊕ M′)^∨/L^∨` is `c`-semilinearly isomorphic to
`Hom_R(L/(M ⊕ M′), K/R)` (the pairing of the duality of 4.0b), a finite module of the same order as
`L/(M ⊕ M′)`; the injections of (a) bound the index. (c) `W′` is a submodule of `A_{M′}`, whose local
components are quotients of `O^{dim U′}`, so `W′` and hence the graph are generated by `dim U′` elements
of `A_M ⊕ A_{M′}`.

*Needs:* 4.0a, 4.0b, 4.8, 4.9.

**Checks.**

- `E = ℚ(i)`, `V = ⟨1, 1⟩`, `U = E(1, 1)`, `U′ = E(1, −1)`, `L = O_E ⊕ 2O_E` (Gram matrix `diag(1, 4)`,
  `A_L = O_E/4`, `#A_L = 16`): `M = 2O_E(1, 1)` and `M′ = 2O_E(1, −1)` are `⟨8⟩`, with `#A_M = #A_{M′} = 64`;
  a determinant computation gives `[L : M ⊕ M′] = 16`, and `64·64 = 16·16²`. Enumerating the isotropic
  cyclic graphs in `(O_E/8)²` gives `16` integral `L` with these intersections (with `L/(M ⊕ M′)` of
  orders `1, 2, 4, 8, 16`), against the bound `64·64`. None is unimodular: that would need a graph of
  order `64`, an anti-isometry of `x̄y/8` on `O_E/8`, that is a unit with `uū ≡ −1 mod 8`, and
  `a² + b² ≢ 7 mod 8`.

### 4.12 Short vectors of the dual of a lattice over a CM field

*Origin:* adapted from Banaszczyk (1993), Theorem 2.1, the transference theorem `λ_i(L)λ_{n+1−i}(L^*) ≤ n`: explicit
bounds for short vectors of a Hermitian lattice over a CM field and of its dual, in terms of the discriminant.

*Method of the formal proof:* a nonzero vector whose trace pairings with the lattice are integral has `⟨x, x⟩` of norm
at least `(d_E²q)^{−1}` (through the different), hence of trace at least `2f·(d_E²q)^{−1/(2f)}` by the inequality of
arithmetic and geometric means; the transference theorem for the trace form then gives `2fk` short vectors independent
over `ℚ`, of which `k` are independent over `E`.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §4.4.13 (`euclidean_dual_transference_upper`:
`λ_i(L)λ_{n+1−i}(L^*) ≤ n` for a full Euclidean lattice of rank `n`), with the arithmetic of the different.

Let `E` be a CM field of degree `2f`, `d_E = |disc E|`, `rd_E = d_E^{1/(2f)}`, `X` a totally positive
definite Hermitian space of dimension `k` over `E`, with form `⟨·, ·⟩`, and `L ⊂ X` an `O_E`-lattice.
Prove:
(a) if `L ⊂ L^∨` and `q = [L^∨ : L]`, every nonzero `x ∈ X` with `Tr_{E/ℚ}⟨x, L⟩ ⊂ ℤ` has
`Tr_{E/ℚ}⟨x, x⟩ ≥ 2f·(d_E²q)^{−1/(2f)}`, and `L` contains `k` vectors, linearly independent over `E`,
with `Tr_{E/ℚ}⟨y, y⟩ ≤ 2f·k²·(d_E²q)^{1/(2f)}`;
(b) if `L` is integral, `L^∨` contains `k` vectors `y_1, …, y_k`, linearly independent over `E`, with
`Tr_{E/ℚ}⟨y_a, y_a⟩ ≤ 2f·k²·rd_E²`.

Route: with `𝔇_E = 𝔇_{E/ℚ}` the different, the trace dual of an `O_E`-lattice `M` is `𝔇_E^{−1}M^∨`. For
`L ⊂ L^∨` of index `q` the annihilator `𝔞` of `L^∨/L` has `N𝔞 ≤ q` and `⟨x, x⟩ ∈ 𝔇_E^{−2}𝔞̄^{−1}`, so
`N_{E/ℚ}⟨x, x⟩ ≥ (d_E²q)^{−1}`, and the inequality of arithmetic and geometric means gives the lower
bound. Transference `λ_1(M^*)λ_n(M) ≤ n` (GeometryOfNumbersAndQuadraticArithmetic 4.4.13) with
`n = 2fk` gives `2fk` vectors linearly independent over `ℚ`, among which `k` are linearly independent
over `E`. For (b), the trace dual of `L^∨` is `𝔇_E^{−1}L`, and `⟨L, L⟩ ⊂ O_E`.

*Needs:* 4.0; GeometryOfNumbersAndQuadraticArithmetic 4.4.13.

### 4.13 Short generators from a short spanning family

*Origin:* adapted from Cassels (1959), Chapter V, Lemma 8, after Mahler and Weyl, a lattice with short independent
vectors has a basis of controlled size (in Tau Ceti as `ZLattice.exists_basis_gauge_le`, listed by SuccessiveMinima):
here an explicit form for modules over the integers of a number field with a seminorm at every embedding, with at most
`2nρ` generators of size at most `n⁴ρ·rd(K)·B`.

*Method of the formal proof:* the ring of integers contains `n` elements independent over `ℚ` with all conjugates of
size at most `n³·rd(K)` (duality with the inverse different for the trace, and transference); their products with a
`K`-basis taken from the spanning family are a short `ℚ`-basis, and reducing a `ℤ`-basis of the module modulo these
products, by the fractional parts of the coordinates, gives the remaining generators.

Let `K` be a number field of degree `n` with root discriminant `rd(K) = |d_K|^{1/n}`, and `V` a `K`-vector space of
finite dimension `ρ`. For every field embedding `σ : K → ℂ` (all `n` of them) let `N_σ : V → ℝ_{≥0}` be a seminorm for
the absolute value `|σ(·)|` of `K`: `N_σ(x + y) ≤ N_σ(x) + N_σ(y)` and `N_σ(ax) = |σ(a)|·N_σ(x)` for all `a ∈ K` and
`x, y ∈ V`. Let `M ⊂ V` be a finitely generated `𝒪_K`-submodule containing a family that spans `V` over `K` and whose
members `y` satisfy `N_σ(y) ≤ B` for every `σ`. Prove that `M` is generated as a `ℤ`-module by at most `2nρ` elements `w`
with `N_σ(w) ≤ n⁴·ρ·rd(K)·B` for every `σ`.

Route: (1) *Short independent integers.* For `ε = ±1` let `φ_ε : K → ℝⁿ`, `x ↦ (Re σ(x) + ε·Im σ(x))_σ`. Then
`⟨φ_1(x), φ_{−1}(y)⟩ = Tr_{K/ℚ}(xy)` and `|φ_ε(x)|² = Σ_σ|σ(x)|²`, so the lattices `φ_{−1}(𝔇_K^{−1})` and `φ_1(𝒪_K)` are dual to
each other. A nonzero `x ∈ 𝔇_K^{−1}` has `|N_{K/ℚ}(x)| ≥ |d_K|^{−1}`, hence `Σ_σ|σ(x)|² ≥ n·|d_K|^{−2/n}` by the inequality of
arithmetic and geometric means. Transference (GeometryOfNumbersAndQuadraticArithmetic 4.4.13) gives `n` vectors of
`φ_1(𝒪_K)`, linearly independent over `ℝ`, of length at most `√n·rd(K)`: elements `ω_1, …, ω_n ∈ 𝒪_K`, linearly
independent over `ℚ`, with `|σ(ω_k)| ≤ √n·rd(K)` for every `σ`. (2) Choose `y_1, …, y_ρ` in the family, a basis of `V`
over `K`. The `nρ` products `ω_ky_j` lie in `M`, are a basis of `V` over `ℚ`, and have `N_σ(ω_ky_j) = |σ(ω_k)|·N_σ(y_j) ≤ √n·rd(K)·B`.
(3) For `x ∈ V` let `red(x)` be the combination of the `ω_ky_j` with the fractional parts of the coordinates of `x`;
`x − red(x)` is an integral combination of the `ω_ky_j`, and `N_σ(red(x)) ≤ nρ·√n·rd(K)·B`. (4) `M` is free over `ℤ` of
rank at most `nρ`; for a `ℤ`-basis `(b_i)`, the `ω_ky_j` and the `red(b_i)` lie in `M` and generate it, and all have
`N_σ ≤ n^{3/2}·ρ·rd(K)·B ≤ n⁴·ρ·rd(K)·B`.

*Needs:* 4.0; GeometryOfNumbersAndQuadraticArithmetic 4.4.13.

**Checks.**

- `K = ℚ(√−5)` (`n = 2`, `rd(K) = √20`), `V = K`, `N_σ(x) = |σ(x)|`, `M = (2, 1 + √−5)`, which is not free over `𝒪_K`, the family
  `{2}` and `B = 2`: with `ω = (1, √−5)` the route gives the generators `2`, `2√−5` and `red(1 + √−5) = 1 + √−5` (`red(2) = 0`),
  of sizes `2`, `2√5`, `√6`, against the bound `2⁴·√20·2 ≈ 143.1`; `2` and `1 + √−5` are a `ℤ`-basis of `M`.
- The compatibility with `K` cannot be dropped: on `V = K = ℚ(i)` the function `N(x + iy) = |x| + 1000|y|` (`x, y ∈ ℚ`) is
  subadditive and homogeneous for rational scalars, `M = ℤ[i]` contains the spanning family `{1}` with `B = 1`, the
  bound is `32`, and every set of generators of `ℤ[i]` contains an element with `y ≠ 0`, of size at least `1000`.

### Examples

Over `ℚ_2(i)/ℚ_2`, the hyperbolic plane `Oe ⊕ Of` has scale `O_E` and norm `2ℤ_2` (4.0) and does not split into lines (4.3). In `V = K²` over a discrete valuation ring, `A = O²`, `B = O(1, 0) ⊕ ϖ²O(0, 1)` and `C = ϖ^{−1}O(1, 0) ⊕ ϖO(0, 1)` have `idx(A, B) = 2`, `idx(B, C) = −2` and `idx(A, C) = 0` (4.0b). For `E = ℚ(√−3)`, `O_Ee_1 ⊕ O_Ee_2 ⊂ ⟨1, 2⟩` is scale-maximal and not norm-maximal (4.4). At an inert place with `q_v = 2`, `M = ⟨2⟩` and `M′ = ⟨1⟩ ⊥ ⟨2⟩` glue to `3 = #O(A_{M′})` unimodular lattices (4.9). For `E = ℚ(i)`, `ℤ[i]²` has `3, 7, 12` submodules of index `2, 4, 5` (4.10).

### Dependencies

Layers 0–3; GeometryOfNumbersAndQuadraticArithmetic 2.2.3–2.2.5, 2.5.2–2.5.4, 2.7.1–2.7.3, 4.4.13, and §2.7.5 (4.3); AdelicAlgebraicGroups §1.5; ReductiveGroupsPartII RG2.3.1, RG2.3.5a (4.6); GlobalNumberFields Layer 6; Tau Ceti's integral lattices over `ℤ` (4.8, 4.9); Mathlib's Dedekind domains, Smith normal form and lengths of modules.

## Layer 5: genera, class sets and masses

### 5.1 Genus and class set

*Origin:* adapted from Borel (1963), §2.1 and Proposition 2.3, lattices from their localizations and the classes in
the genus of a rational quadratic form as the double cosets of its adelic orthogonal group modulo the rational points
and the stabilizer of the integral lattice: here for Hermitian lattices over a number field, with the stabilizers
`U(V)(F) ∩ gK_Lg^{−1}`; the form for lattices over a conjugation-stable order is this roadmap's own formulation.

*Method of the formal proof:* the genus is defined by rational isometries of the localizations at each pair of
conjugate primes, and its basic properties are formal; the dictionary with adelic double cosets and with the groups
`U(V)(F) ∩ gKg^{−1}` is proved for the standard lattice of the proof's data, by transport to matrices over the finite
adeles. The route written here defines the genus by completions and identifies it with `U(V)(𝔸_f)/K_L` by gluing
(4.0(g)).

For a lattice `L` in a Hermitian space `V` over a number field, define the genus `gen(L)` and the
class set `cls(L)`, the set of classes of the lattices of `gen(L)` (Conventions). Prove that
`g ↦ [g·L]` is a bijection `U(V)(F)\U(V)(𝔸_f)/K_L ≃ cls(L)`, under which the stabilizer of
`g·L` in `U(V)(F)` is `U(V)(F) ∩ gK_Lg^{−1}`. The same holds for lattices over an `O_F`-order
`𝒪 ⊂ E` stable under conjugation, with `K_L` the stabilizer of `L`. For quadratic lattices over `ℤ`, the class set
and its adelic double-coset description are IntegralLattices 4A, 4B.

Route: 4.0(g) identifies `gen(L)` with `U(V)(𝔸_f)/K_L`; the class relation is the left action of
`U(V)(F)`.

*Needs:* 4.0, 4.5; Mathlib `DoubleCoset`.

**Checks.**

- `n = 1`, `E` imaginary quadratic, `L = O_E` with `x̄y`: the genus is `{𝔞 : 𝔞𝔞̄ = O_E}`, and the
  class set is `Cl(E)` modulo the subgroup generated by the classes of ideals stable under
  conjugation. For `E = ℚ(√−23)` it has three elements, for `E = ℚ(√−15)` one.
- In `V = ⟨1⟩` over `ℚ(i)`, the lattices `ℤ[i]` and `(1 + i)ℤ[i]` have volumes `ℤ` and `2ℤ` and lie in
  different genera, although the second, with the restricted form, is isometric to `ℤ[i]` in the
  space `⟨2⟩ ≅ ⟨1⟩`: genus and class are relations between lattices of one space.

### 5.2 Finiteness, stabilizers, Minkowski's bound and small levels

*Origin:* published: Borel (1963), the finiteness of class numbers, for (a); Minkowski (1887), the bound for the orders
of the finite subgroups of `GL_N(ℤ)` and the absence of torsion in congruence subgroups, for (c) and the local lemmas
of (d)(i), (iii); for (e), the vanishing case of the bound of Serre (2007), §2.2, Theorem 2′. The level conditions of
(d)(ii), the triviality of the stabilizers in (d) and the integrality of `mass(L)·minkowskiBound(n·[E : ℚ])` are this
roadmap's own formulation.

*Method of the formal proof:* (a) by reduction of lattices: in the definite case the lattices of a genus have equal
covolume and bounded denominators for the trace form, hence bases of the space made of vectors of bounded length and
finitely many Gram matrices, and in general by Hermite's induction on a vector of bounded nonzero length and its
orthogonal complement; (b) `U(L)` permutes the finitely many short vectors of the trace form; (c) Minkowski's bound is
proved by Schur's argument (the order of an `ℓ`-subgroup `P` of `GL_N(ℤ)` divides `Σ_{g ∈ P} tr(g)^k` for every `k`,
and the traces are `N − ℓy` with `0 ≤ y ≤ N/(ℓ − 1)`); (d)(i), (iii), for integer matrices and a modulus at least `3`,
by the binomial expansion of `(1 + p^sY)^q`. The route written here takes (a) from the finiteness of class numbers
(AdelicAlgebraicGroups §3.4) and (c) from the Minkowski bound of FiniteGroupInvariants 10.2.

*Corollary of:* FiniteGroupInvariants §10.2a (for a number field `F ⊆ ℂ` and an odd prime `ℓ` with
`[F(ζ_ℓ) : F] > n`, no element of `GL_n(F)` has order `ℓ`), for (e), with `[E(ζ_ℓ) : E] = ℓ − 1 > n` when `ℓ` is
unramified in `E`.

Prove: (a) the class set of every lattice is
finite. Let `V` be totally definite. (b) `U(L)` is finite and, for `n ≥ 1`, contains the group `μ(E)`
of scalars.
(c) Minkowski's bound: `|U(L)|` divides `minkowskiBound (n·[E : ℚ])` of FiniteGroupInvariants 10.2,
and so `mass(L)·minkowskiBound(n·[E : ℚ])` is an integer; this is the bound through the faithful
action on the `ℤ`-lattice `L` of rank `n[E : ℚ]`. (d) Small levels: let `K ⊂ K_L` be compact open
and `v` a finite place above a rational prime `p`, and suppose that either (i) `p ≥ 3` and the
projection `K_v` acts trivially on `L_v/pL_v`, or (ii) for a prime `𝔓` of `E` above `v`, with
ramification index `e(𝔓|p)` over `p`, `p > n·e(𝔓|p) + 1` and `K_v` acts on `L_v/𝔓L_v` through
unipotent elements, or (iii) (`p = 2` allowed) for some `m ≥ 2`, `K_v` acts trivially on `L_v/p^mL_v`.
The numerical condition of (ii) holds whenever `p > n[E : ℚ] + 1` (as
`e(𝔓|p) ≤ [E : ℚ]`), and whenever `p > n + 1` if `p` is unramified in `E`; the unipotence of the action
of `K_v` modulo `𝔓` is a separate hypothesis in every case (it holds, for instance, when `K_v` acts
trivially on `L_v/𝔓L_v`). Then `K` is sufficiently
small in the sense of AutomorphicFormsOnReductiveGroups 7.5 (`IsSufficientlySmall`: its projection
to `v` is torsion-free), and `U(V)(F) ∩ gKg^{−1} = 1` for every `g ∈ U(V)(𝔸_f)`. (e) If the prime `ℓ`
is unramified in a number field `E` and `n + 1 < ℓ`, no element of `GL_n(E)` has order `ℓ`; hence `ℓ`
does not divide the order of any finite subgroup of `GL_n(E)`, in particular of `U(V)(F) ∩ gKg^{−1}`
for every compact open `K` and every `g`.

Route: (a) AdelicAlgebraicGroups §3.4 *class-number-finite* with 5.1. (b) AdelicAlgebraicGroups §4.4
*rational-stabilizer-finite* with 2.5(c), or directly: after rescaling (2.5(e)), `U(L)` preserves
the positive definite `ℤ`-lattice `(L, Tr_{E/ℚ} ∘ h)`; scalars `ζ ∈ μ(E)` satisfy `ζζ̄ = 1`. (c)
`U(L)` acts faithfully on `L ≅ ℤ^{n[E:ℚ]}`; FiniteGroupInvariants 10.2 (`card_dvd_minkowskiBound`).
(d) The torsion elements to exclude are those of `K_v` and the images in `U(V)(F_v)` of the finite
groups `U(V)(F) ∩ gKg^{−1}` (5.2(b)), which lie in `g_vK_vg_v^{−1}` and act on the lattice
`g_vL_v`. (i) The local lemma: a torsion element of `GL_N(ℤ_p)` congruent to `1` modulo `p ≥ 3` is
`1`. Otherwise a power of prime order `ℓ` is `1 + p^aX` with `a ≥ 1` and `X ≢ 0 mod p`, and
`(1 + p^aX)^ℓ ≡ 1 + ℓp^aX mod p^{a+1}` if `ℓ ≠ p`, while for `ℓ = p` it is
`≡ 1 + p^{a+1}X mod p^{a+2}` (the middle binomial terms are divisible by `p^{2a+1}` and the last by
`p^{pa}`, with `pa ≥ a + 2` as `p ≥ 3`); neither is `1`. Apply it to `1 + p·End_{ℤ_p}(g_vL_v)`, a
subgroup of `GL_N(ℤ_p)`, `N` the `ℤ_p`-rank of `L_v`. (ii) The elements of `U(V)(F_v) ∩ GL(g_vL_v)`
acting trivially on `g_vL_v/𝔓g_vL_v` form a pro-`p` group (a principal congruence subgroup: of
`GL_{O_{E_v}}(g_vL_v)` at a nonsplit `v`; at a split `v`, where `U(V)(F_v) = GL(V_1)` (0.1), of
`GL(Λ)` for the component `Λ` of `g_vL_v` on which `𝔓` is the maximal ideal), so a torsion element
acting unipotently modulo `𝔓` has `p`-power order. If it is not `1`, a power `γ` has order `p`. Let
`E_𝔓` be the completion of `E` at `𝔓`: at a nonsplit `v`, `γ ∈ GL_{E_v}(V_v) ≅ GL_n(E_𝔓)`; at a split
`v`, `γ` acts on the component `V_i` of `V_v` on which `𝔓` acts as the maximal ideal (0.1), through
`GL(V_i) ≅ GL_n(F_v)` with `F_v = E_𝔓`, faithfully. Some eigenvalue of `γ` is a primitive `p`-th root of
unity `ζ_p`, so `[E_𝔓(ζ_p) : E_𝔓] ≤ n`. But `ℚ_p(ζ_p)/ℚ_p` is totally ramified of degree `p − 1`, so
the ramification index of `E_𝔓(ζ_p)/ℚ_p` is at least `p − 1`, and
`[E_𝔓(ζ_p) : E_𝔓] ≥ (p − 1)/e(𝔓|p) > n`, a contradiction. (iii) A torsion element of `GL_N(R)` congruent to `1`
modulo `p^m`, `m ≥ 2`, is `1`, for every discrete valuation ring `R` of characteristic zero in which `p` is not a unit:
for an element `1 + y ≠ 1` of prime order `ℓ` with `y ≡ 0 mod p^m`, the term `ℓy` of `(1 + y)^ℓ − 1` has strictly
smaller valuation than the others (for `ℓ = p` because `(p − 1)·v(y) ≥ 2v(p) > v(p)`); apply it as in (i), with
`R = O_v`. In all three cases AutomorphicFormsOnReductiveGroups 7.5 (`stabilizer_trivial`) concludes.
(e) An element of order `ℓ` has minimal polynomial dividing
`(X − 1)Φ_ℓ`, of degree `≤ n < ℓ − 1`; `Φ_ℓ` is irreducible over `E` (`ℚ(ζ_ℓ)` is totally ramified at
`ℓ`, and `E` is unramified there), so the minimal polynomial is `X − 1`; Cauchy's theorem gives the
statement on finite subgroups.

*Needs:* 0.1, 2.5, 4.5, 5.1; AdelicAlgebraicGroups §§3.4, 4.4; FiniteGroupInvariants 10.2;
AutomorphicFormsOnReductiveGroups 7.5.

**Checks.**

- `E = ℚ(√−3)`, `L = O_E^n` standard: `U(L) = μ_6^n ⋊ S_n` of order `6^n n!`; `72` divides
  `minkowskiBound 4 = 5760` and `1296` divides `minkowskiBound 6 = 2^{10}·3^4·5·7`.
- For `n = 1` and `E = ℚ(√−3)` the bound is `minkowskiBound 2 = 24`, against `|U(L)| = 6`: the
  `ℤ`-bound is not sharp.
- `p = 2` does not give small levels in (i): `−1 ∈ U(L)` is congruent to `1` modulo `2`. In (ii) the
  bound on `p` is needed: for `E = ℚ(√−3)` and `n = 1`, the element `ω` of order `3 = p` in `U(O_E)`
  acts trivially on `O_E/𝔓` for `𝔓 = (√−3)`; here `e(𝔓|3) = 2` and `p = 3 = n·e(𝔓|p) + 1`, and the
  strict inequality fails.
- The local bound is weaker than `p > n[E : ℚ] + 1`: for `E = ℚ(i)`, `n = 2` and the split prime
  `p = 5`, the numerical condition of (ii) holds (`5 > 2·1 + 1`) while `5 > n[E : ℚ] + 1 = 5` fails;
  indeed `GL_2(ℚ_5)` has no element of order `5`, since `[ℚ_5(ζ_5) : ℚ_5] = 4 > 2`.
- The unipotence hypothesis of (ii) is not implied by the bound on `p`: for `E = ℚ(i)`, `n = 1`,
  `L = O_E` and `p = 5 > n[E : ℚ] + 1 = 3`, the level `K = K_L` contains `−1`, which acts on
  `L_v/𝔓L_v ≅ 𝔽_5` as `−1 ≠ 1`, so not unipotently; `K_L` is not sufficiently small (`U(L) = μ_4`, and the
  projection of `K_L` to `v` contains `μ_4`).

### 5.3 Special genera

*Origin:* particular to this proof: the bound `h_E·N^{[E : ℚ]}` for the number of classes of
`U(1)(F)\U(1)(𝔸_f)/det(K)` at the congruence levels `K` of a unimodular lattice over a CM extension unramified at
every finite place. The special genera and their description by this group and by strong approximation, (a)–(c)
below, are published: Shimura (1964), Theorems 5.24 and 5.27, and Kirschmer (2016), Theorem 5.4.14 and Corollary
5.1.4, stated in GeometryOfNumbersAndQuadraticArithmetic §2.4.7.

*Method of the formal proof:* Hilbert 90 on the finite adeles writes a norm-one adele as `z/z̄`; the ideal class of `z`
determines it up to norm-one elements of `E` and norm-one integral units; residues modulo the level `N` account for the
congruence condition; and a quasi-reflection along a lattice vector of length one shows that every norm-one unit
congruent to `1` modulo `N` is a determinant of the level.

Two lattices of the genus of `L` are in the same special genus if `M' = γs·M` with `γ ∈ U(V)(F)` and
`s ∈ SU(V)(𝔸_f)`. Let `E/F` be a CM extension unramified at every finite place, `L` a unimodular lattice of rank
`n ≥ 1`, `N ≥ 1` an integer (the level; not the norm), `K_N ⊆ K_L` the principal congruence subgroup of level `N`
(the elements acting trivially on `L/NL`), `K` a compact open subgroup with `K_N ⊆ K ⊆ K_L`, and `h_E` the class
number of `E`. Prove that `U(1)(F)\U(1)(𝔸_f)/det(K)` is finite, with at most `h_E·N^{[E : ℚ]}` elements; for
`K = K_L` it is the group of (a) below, which counts the special genera in the genus of `L`.

For every lattice `L`, GeometryOfNumbersAndQuadraticArithmetic §2.4.7 states: (a) if `n ≥ 1`, `det` induces a
bijection from the set of special genera in the genus of `L` to `U(1)(F)\U(1)(𝔸_f)/det(K_L)`, a finite group; for
`n = 0` the genus is one special genus. (b) If `n ≥ 2` and
`SU(V)(F_v)` is noncompact for some archimedean `v`, every special genus is a single class. (c) If
`n ≥ 2` and `w` is a finite place at which `SU(V)(F_w)` is noncompact, every
class in the special genus of `L` contains a lattice `M` with `M_v = L_v` for all finite `v ≠ w`.
The number of special genera in a genus is computed in [Kirschmer], Theorem 5.4.14, p. 89, which refers
to [Shimura64], Theorems 5.24 and 5.27.

Route: Hilbert 90 at every finite place (Mathlib `groupCohomology.exists_div_of_norm_eq_one` when `E_v` is a field;
`(a, a^{−1}) = (a, 1)/(1, a)` at a split place; `z_v` can be taken a unit when the norm-one element is a unit, `E_v/F_v`
being unramified or split) writes a norm-one finite adele as `z/z̄` with `z` a finite idele of `E`; the class of the
ideal of `z` in the class group of `E` determines the class of `z/z̄` up to `U(1)(F)` and the norm-one integral units,
and the residues modulo `N` give at most `N^{[E : ℚ]}` classes over each ideal class; at every finite `v`, `s_x`
(0.2) for a vector `x` of `L_v` with `h(x, x) = 1` (4.2(a)) shows that every norm-one unit of `O_{E_v}` congruent to
`1` modulo `N` is in `det(K_N)`, hence in `det(K)`.

*Needs:* 0.2, 4.2; Mathlib `groupCohomology.exists_div_of_norm_eq_one`; GeometryOfNumbersAndQuadraticArithmetic
§2.4.7 (for (a)–(c)).

**Checks** (of the cited clause (a)).

- `n = 1`: `SU` is trivial, special genera are classes, and (a) recovers the class set of 5.1.
- `n = 0` is excluded from the bijection: for `V = L = 0` there is one special genus and
  `det(K_L) = {1}`, while `U(1)(F)\U(1)(𝔸_f)` is uncountable (for `E = ℚ(i)`, `U(1)(ℚ)` is countable
  and `U(1)(𝔸_f)` is not); `det` is then not onto `U(1)(𝔸_f)`.

### 5.4 Neighbours

*Origin:* published: Kneser (1957), the neighbour method, in the Hermitian form of Kirschmer (2016), Definition 5.2.1
and Propositions 5.2.4, 5.2.5, with Schiemann (1998), for (a) and (b); the metric form and the count of neighbours at a
split prime, recorded below as the form of the formal proof, are particular to this proof.

*Method of the formal proof:* the metric form recorded below: for unimodular `L_0 ≠ L`, a simple submodule of
`L_0/(L_0 ∩ L)` gives a prime `𝔓` and `x ∈ L_0` outside `L` with `𝔓x ⊆ L`; the neighbour `L(x)` meets `L_0` in
`(L_0 ∩ L) + O_Ex`, so the length of `L_0/(L_0 ∩ L(·))` drops by one at each step. (a) and (b) as stated are not
statements of [FormalProof]; the route written here proves (a) from the relative position of 4.7(a), (a′) and (b) by
strong approximation (GeometryOfNumbersAndQuadraticArithmetic §2.4.7 (c)).

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2.4.8 (Kneser's neighbour method for Hermitian lattices: (a)
any two lattices of the local orbit of `L_w` are joined by a chain of neighbours; (b) for
`n ≥ 2`, every class of the special genus of `L` is reached by a chain of `w`-neighbours), for (a) and (b).

Let `w` be a finite place, split or unramified in `E`, at which `L_w` is unimodular. A lattice `M`
is a `w`-neighbour of `L` if `M_v = L_v` for finite `v ≠ w`, `M_w` is in the `U(V)(F_w)`-orbit of
`L_w`, and `L_w/(L_w ∩ M_w)` is a simple `O_{E_w}`-module. Prove:
(a) any two lattices in the orbit of `L_w` are joined by a finite chain in which each lattice is a
neighbour of the next; (b) if `V` is totally definite and `n ≥ 2`, every class of the special genus
of `L` contains a lattice reached from `L` by a finite chain of `w`-neighbours. Kneser's neighbours
of a modular lattice and the chains of (a) are [Kirschmer], Definition 5.2.1 and Propositions 5.2.4,
5.2.5, pp. 75–76. Kneser's `p`-neighbours of integral quadratic lattices over `ℤ` are IntegralLattices 4G.

*The form of the formal proof: metric form.* Let `L_0 ≠ L` be unimodular lattices of `V`, with `E/F` unramified at the
places where they differ. There are a prime `𝔓` of `E` and `x ∈ L_0` with `x ∉ L`, `𝔓x ⊆ L` and `h(x, x) ∈ O_E` such that
the neighbour `L(x) = {y ∈ L : h(x, y) ∈ O_E} + O_E x` of `L` satisfies
`length(L_0/(L_0 ∩ L(x))) = length(L_0/(L_0 ∩ L)) − 1`; hence `L_0` and `L` are joined by a chain of exactly
`length_{O_E}(L_0/(L_0 ∩ L))` neighbours. At a prime `𝔓 ≠ 𝔓̄` of `E` of prime norm `q`, a unimodular `Λ` has
`(q^n − 1)/(q − 1)` unimodular neighbours `Λ′ ⊇ 𝔓Λ` with `[Λ : Λ ∩ Λ′] = q`, exactly one for each `Λ_0` with
`𝔓Λ ⊆ Λ_0 ⊆ Λ` of index `q`, and `Λ′` is such a neighbour of `Λ` for `𝔓` if and only if `Λ` is one of `Λ′` for `𝔓̄`.

Route: (a) the orbit of `L_w` is the set of unimodular lattices of `V_w` (4.2(a)). At an inert `w`,
by 4.7(a) two of them are `⊕(Oe_i ⊕ Of_i) ⊥ L_0` and `⊕(ϖ^{−a_i}Oe_i ⊕ ϖ^{a_i}Of_i) ⊥ L_0`; lowering one
`a_i` by one changes the lattice by a quotient `≅ k_{E_w}`, a neighbour step. At a split `w`, by
4.7(a′) the second is `⊕c_iO_{E_w}x_i` with `c_i = (ϖ^{b_i}, ϖ^{−b_i})`; moving one `b_i` by one
towards `0` replaces `Λ′` by a sublattice or a superlattice of colength one, and then
`L/(L ∩ M)` is `k_w × 0` or `0 × k_w`, a neighbour step. (b) at these places and `n ≥ 2`,
`SU(V)(F_w)` is noncompact (`SL_n` at a split place; at an unramified place `V_w ≅ ⟨1, …, 1⟩` by
4.2(a), and `⟨1, 1⟩ ≅ H` since `−1` is a unit, hence a norm); then GeometryOfNumbersAndQuadraticArithmetic §2.4.7 (c),
and (a) above. The metric form: `L_0 ⊄ L` (else
`L = L^∨ ⊆ L_0^∨ = L_0`), so `(L_0 + L)/L` has a simple submodule, which gives `𝔓` and `x ∈ L_0 ∖ L` with `𝔓x ⊆ L`, at a
place where `L_0` and `L` differ; `h(x, x) ∈ O_E` as `L_0` is integral. `L(x)` is integral, `L ∩ L(x)` is
`{y ∈ L : h(x, y) ∈ O_E}`, of index `N𝔓` in `L` (`y ↦ h(x, y)` maps `L` onto `𝔓̄^{−1}/O_E`) and in `L(x)` (`O_Ex ∩ L = 𝔓x`), so
`L(x)` is unimodular; and `L_0 ∩ L(x) = (L_0 ∩ L) + O_Ex` contains `L_0 ∩ L` with a simple quotient. At a split `𝔓` with
`Λ_v = (Γ, Γ^*)` (2.3), `𝔓` acting on the first component, the `Λ′` are the `(Γ′, Γ′^*)` with `ϖ_vΓ ⊆ Γ′ ⊆ Γ` of index
`q`, and `Λ ∩ Λ′ = (Γ′, Γ^*)`.

*Needs:* 2.3, 4.2, 4.7; GeometryOfNumbersAndQuadraticArithmetic §2.4.7.

**Checks.**

- For split `w`, `L_w = (Λ, Λ^*)` (2.3), and the neighbours of `L_w` are the `(Λ′, Λ′^*)` with
  `Λ′ ⊂ Λ` of colength one or `Λ′ ⊃ Λ` of colength one: Kneser's neighbours for `GL_n`. For `Λ′` in
  relative position `(1, −1)`, `Λ/(Λ ∩ Λ′)` has length one but `L_w/(L_w ∩ M_w)` has length two.

### 5.5 Mass

*Origin:* published: Gross (1999), the mass of a level of a group compact at infinity as a weighted count of classes
and as an adelic volume; here for `U(V)` and the levels `K_L` of lattices.

*Method of the formal proof:* the mass is defined as `Σ 1/|U(M)|` over representatives of the classes of the genus; it
is independent of the representatives because isometric lattices have conjugate stabilizers, and it is rewritten as a
sum over the orbits of `U(V)(F)` in the genus. The route written here obtains `mass(L)` as the mass of the level `K_L`
and adds the volume formula for every level, which the formal proof states for its own data only.

*Corollary of:* AdelicAlgebraicGroups §4.5a (*class-set-integration*: for a connected reductive group compact at
infinity modulo its split centre, `mass(U) = Σ_i |Γ_i|^{−1}` does not depend on the representatives and
`vol(G(F)\G(𝔸)^1) = vol(U)·vol(G(F_∞)/A_G(ℝ)^0)·mass(U)`).

For `V` totally definite, `U(V)` satisfies the hypotheses of AutomorphicFormsOnReductiveGroups 7.4
(for `n ≥ 1`, `U(V)(F ⊗ ℝ)` is compact by 2.5(c), and the centre is `U(1)` (0.2), whose rational points
`E^1` are discrete in `U(1)(𝔸_f)`; for `n = 0`, `U(V)` is the trivial group). Prove that `mass(L) = mass(K_L) = Σ_{[M] ∈ cls(L)} 1/|U(M)|` through the
dictionary of 5.1 (`Γ_g = U(g·L)`), and the volume formula of DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a
for `U(V)`: `μ(U(V)(F)\U(V)(𝔸)) = mass(K)·μ(U(V)(F_∞) × K)` for every Haar measure `μ`.

Route: AdelicAlgebraicGroups §4.5a (the instance DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a) with
`G = U(V)`, and 5.1.

*Needs:* 2.5, 5.1, 5.2; AutomorphicFormsOnReductiveGroups 7.4 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a;
AdelicAlgebraicGroups §4.5a.

**Checks.**

- `E = ℚ(√−15)`, `n = 1`, `L = O_E`: one class with `U(L) = {±1}`, mass `1/2`;
  `E = ℚ(√−23)`: three classes with stabilizer `{±1}`, mass `3/2`.

### 5.6 Index formula, rescaling and ratios between genera

*Origin:* published: the mass of a sublevel is the mass of the level times the index, (a), as stated in
AdelicAlgebraicGroups §4.5a; the ratio (c) of the masses of two lattices of one space, its corollary, is the form
[FormalProof] has; the invariance (b) and the form (d) for lattices over an order are this roadmap's own formulation.

*Method of the formal proof:* the ratio of two masses is proved as a statement about a group `G`, a subgroup `Γ` and
finitely many double cosets of `Γ` and `K_0` in `G`, with no Haar measure: the sum over the `Γ`-orbits in `G·x` of the
inverse orders of the stabilizers is a constant times `[K_0 : K_0 ∩ G_x]/[G_x : K_0 ∩ G_x]`, and in a restricted
product this ratio is the product of the local ones. The route written here takes the index formula from the volume
formula of the mass of a level.

*Corollary of:* AdelicAlgebraicGroups §4.5a (*class-set-integration*: `mass(U′) = [U : U′]·mass(U)` for compact open
`U′ ⊂ U`), for (a), and for (c) and (d) through `K_L ∩ K_{L′}`.

Prove: (a) `mass(K') = [K : K']·mass(K)` for open `K' ⊂ K` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a
for `U(V)`); (b) `mass(L) > 0`, and it is invariant under isometries of the ambient space, under
`L ↦ aL` (`a ∈ E^×`), and under rescaling the form by `c ∈ F^×`: `(V, ch)` has the same unitary group
(2.5(e)), the same lattices, genera, classes and stabilizers as `(V, h)`, so `mass(L)` is the same
computed in either space; (c) for lattices `L, L'` in one space,
`mass(L)/mass(L') = ∏_v [U(L'_v) : U(L_v) ∩ U(L'_v)] / [U(L_v) : U(L_v) ∩ U(L'_v)]`, a finite product;
(d) for a lattice `L` over an order `𝒪` (5.1), `mass(L) = [K_{O_E L} : K_L]·mass(O_E L)`.

Route: (a) is the instance; (b) the genus, the class relation and `U(M)` are defined through
`U(V)`, which rescaling does not change; (c), (d) from (a) through `K_L ∩ K_{L'}`, using 4.5(b); an
isometry preserving `L` preserves `O_E L`.

*Needs:* 2.5, 4.5, 5.5; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; AdelicAlgebraicGroups §4.5a.

**Checks.**

- `E = ℚ(√−3)`, `V = ⟨1, 1⟩`, `L = O_E e_1 ⊕ O_E e_2`, `L' = O_E e_1 ⊕ 2O_E e_2`. The lattices differ
  only at `2` (inert), `L = L' + 2L'^∨`, so `U(L'_2) ⊆ U(L_2)`, and `U(L'_2)` is the stabilizer of the
  nonisotropic line `𝔽_4 e_1` of `L_2/2L_2 = 𝔽_4²`; `U_2(𝔽_2)` permutes the two nonisotropic lines
  transitively, so (c) gives `mass(L') = 2·mass(L)`; the stabilizers `U(L') = μ_6 × μ_6` and
  `U(L) = μ_6² ⋊ S_2` have orders `36` and `72`, in the same ratio.

### 5.7 Dimension of spaces of algebraic modular forms

*Origin:* published: Gross (1999), the algebraic modular forms on a group compact at infinity as a sum over the class
set, with their dimension and its value at a small level, for (a)–(c); (d) is the Weyl dimension formula for `GL_n`
applied to `U(V)`.

*Method of the formal proof:* (c): at a level `K′ ⊂ K_L` all of whose stabilizers are trivial, the classes of level
`K′` over a class `[g]` of level `K_L` are in bijection with the cosets of `K′` in `K_L` modulo the finite group `Γ_g`,
so there are `[K_L : K′]/|Γ_g|` of them; summing over the classes gives `[K_L : K′]·mass(L)` classes, and the space of
forms of weight `W` at level `K′` has dimension that number times `dim W`. (a), (b) and (d), in the generality stated
here, are not statements of [FormalProof]; the route written here takes them from the sections named with each.

*Corollary of:* AutomorphicFormsOnReductiveGroups §7.5 (`equivSum`: `S(J, M) ≃ ⊕_i M^{Γ_i}` with finite stabilizers,
and `stabilizer_trivial` at a sufficiently small level), for (a).

Let `V` be totally definite, `K ⊂ U(V)(𝔸_f)` compact open, `C` a field of characteristic zero, and
`W` a finite-dimensional algebraic representation over `C` of the `ℚ`-group `G = Res_{F/ℚ} U(V)`
(when `C` contains a Galois closure of `E` and `n ≥ 1`, `G ⊗ C ≅ ∏_{v real} GL_n`; then every
irreducible `W` is absolutely irreducible and an external tensor product `⊠_v W_v` of irreducible
representations of the factors, and every `W` is a direct sum of such). Let `M_W(K)` be the space of
algebraic modular forms of weight `W` and level `K` for `G` (AutomorphicFormsOnReductiveGroups 7.4, `IsAlgebraicModularForm`; `G(ℚ) = U(V)(F)`,
`G(𝔸_{ℚ,f}) = U(V)(𝔸_f)`). Prove:
(a) `M_W(K) ≃ ⊕_{[g]} W^{Γ_g}` with `Γ_g = U(V)(F) ∩ gKg^{−1}`, which for `K = K_L` is `U(g·L)` (5.1),
so `dim M_W(K_L) = Σ_{[M] ∈ cls(L)} dim W^{U(M)}` (AutomorphicFormsOnReductiveGroups 7.5,
`equivSum`);
(b) `dim M_W(K) = Σ_{[g]} |Γ_g|^{−1} Σ_{γ ∈ Γ_g} tr ρ(γ)` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5c);
(c) for a sufficiently small `K ⊂ K_L` (5.2(d)), `dim M_W(K) = [K_L : K]·mass(L)·dim W` (7.5c with
5.5, 5.6(a));
(d) for `W` absolutely irreducible (for instance irreducible, with `C` containing a Galois closure of
`E`), with highest weights `(λ_v)_v` under `U(V) ⊗_{F, τ_v} C̄ ≅ GL_n(C̄)` for an algebraic closure
`C̄` of `C` and embeddings `τ_v : E → C̄`, one above each real place `v` of `F`,
`dim W = ∏_v ∏_{i<j} (λ_{v,i} − λ_{v,j} + j − i)/(j − i)` (the Weyl dimension formula,
ClassicalGroups Layer 5); for an arbitrary `W`, `dim W` is the sum of these
products over the irreducible constituents of `W ⊗_C C̄`, with multiplicities.

Route: the instances named in (a)–(c), with the dictionary of 5.1. (d): over `C̄`, `G` becomes
`∏_v GL_n`, a split reductive group, whose finite-dimensional representations are completely
reducible (characteristic zero) and whose irreducible ones are external tensor products of irreducible
representations of the factors, each with a highest weight; for absolutely irreducible `W`, `W ⊗_C C̄`
is one of them, and the Weyl dimension formula applies factor by factor. Over a smaller `C` an
irreducible `W` may split over `C̄` (Checks), so the formula is applied to the constituents.

*Needs:* 2.5, 5.1, 5.2, 5.5, 5.6; AutomorphicFormsOnReductiveGroups 7.4, 7.5 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5c;
ClassicalGroups Layer 5.

**Checks.**

- `E = ℚ(√−3)`, `L = O_E²` (one class, `U(L)` of order `72`), `W = det^a`: `det` maps `U(L)` onto
  `μ_6`, so by (b) the dimension is `1` if `6 | a` and `0` otherwise, while `mass(L)·dim W = 1/72`:
  the terms of nontrivial `γ` in (b) are essential at a level that is not small.
- For trivial `W`, (a) counts the classes.
- (c) at a small level: `E = ℚ(√−3)`, `V = ⟨1⟩`, `L = O_E`, trivial `W`, `K` the principal congruence
  subgroup of `K_L` at the split prime `7` (sufficiently small by 5.2(d)(i)). `[K_L : K] = |𝔽_7^×| = 6`
  and `mass(L) = 1/6`; `μ_6 = U(L)` maps isomorphically onto `𝔽_7^×` (`x² − x + 1` has the roots `3`,
  `5` of order six modulo `7`), so the one class of `L` splits into one double coset modulo `K` and
  `dim M_W(K) = 1 = 6·(1/6)·1`. The index is `[K_L : K]`, not `[K : K ∩ K_L] = 1`, which would give `1/6`.
- Absolute irreducibility is needed in (d): for `F = ℚ`, `E = ℚ(i)`, `n = 1`, `G = U(1)` acts on
  `W = ℚ(i) ≅ ℚ²` by multiplication, irreducibly over `C = ℚ` (multiplication by `(3 + 4i)/5 ∈ U(1)(ℚ)` has
  characteristic polynomial `x² − (6/5)x + 1`, of discriminant `−64/25`, so no rational eigenline), with
  `dim W = 2`; over `ℚ(i)`, `W` is the sum of the characters of weights `1` and `−1`, and no single
  highest weight gives `2`. A representation need not be a tensor product: for `G ⊗ C ≅ GL_1 × GL_1`
  (`F` real quadratic, `n = 1`), the sum of the characters of weights `(0, 0)` and `(1, 1)` is not one,
  since a tensor product of a character with a sum of characters keeps one weight coordinate fixed.

### 5.8 Unimodular genera

*Origin:* this roadmap's own formulation: the unimodular genera, drawn from the local uniqueness of unimodular lattices
(Kirschmer (2016), Proposition 3.3.5; Jacobowitz (1962)) and from Landherr's theorem with the Hasse norm theorem
(Landherr (1936)). (b) is the form [FormalProof] has.

*Method of the formal proof:* (b), for a CM extension unramified at every finite place: at every finite place a
unimodular lattice has an orthonormal basis (Hensel lifting over `O_v ⊗ O_E`, split and inert places treated
together), so the determinant of `V` is a local norm everywhere and positive at the real places; the Hasse norm theorem
makes it a global norm, and Landherr's theorem (3.1) gives `V ≅ ⟨1, …, 1⟩`. The same local bases give, at every place,
an isometry carrying one unimodular lattice of `V` to another, which is the statement that they form one genus.

Prove:
(a) over a number field with no dyadic place ramified in `E`, a Hermitian space `V` contains a
unimodular lattice iff `val_v(det V_v)` is even at every inert `v`, and then the unimodular lattices of
`V` form one genus; (b) if `E/F` is a CM extension unramified at every finite place and `V` is a
totally positive definite space of dimension `n` containing a unimodular lattice, then
`V ≅ ⟨1, …, 1⟩`; hence all unimodular lattices of rank `n` in totally positive definite Hermitian
spaces over `E` form one genus, that of `O_E^n` with the standard form.

Route: (a) local existence and uniqueness are 4.2(a), (b) (every space contains unimodular lattices
at ramified nondyadic and split places), and 4.0(g) glues; two unimodular lattices are conjugate at
every place, hence in one genus. (b) `det V` is a norm at every place: at inert places a unit times an
even power of `ϖ`, units being norms; at split places trivially; at real places positive; so it is a
global norm (`cyclicHasseNorm`), and 3.1 with equal signatures gives `V ≅ ⟨1, …, 1⟩`; then (a).

*Needs:* 3.1, 4.0, 4.2; ClassFieldTheory §13.1.

**Checks.**

- Over the ramified `ℚ(√−15)/ℚ`, `⟨1, 1⟩` and `⟨1, 2⟩` both contain unimodular lattices (no inert prime
  divides `2`, and `2` splits), are positive definite, and are not isometric: `η_3(2) = (2/3) = −1`.
  The hypothesis "unramified at every finite place" in (b) cannot be dropped.
- (b) is vacuous when `[F : ℚ]` is odd: `η(−1) = 1` and `η_v(−1) = −1` at every real place, `+1` at
  every finite unramified place, so a CM extension unramified at all finite places has `[F : ℚ]` even;
  `ℚ(ζ_12)/ℚ(√3)` is such an extension.

### 5.9 Subspaces carrying an integral lattice of given discriminant

*Origin:* adapted from Landherr (1936) and Scharlau (1985), Chapters 7 and 10, the classification of nondegenerate
subspaces up to the unitary group by their local invariants (Witt's extension theorem with Landherr's theorem): here
read through the volume ideal of an integral lattice, with the bound `n^{(log₂[F : ℚ])/2}` for the number of orbits,
this roadmap's own formulation; the bound `n^{1 + log₂[E : ℚ]}` recorded below is particular to this proof.

*Method of the formal proof:* a subspace `U` carrying an integral lattice `P` with `#A_P = n` is assigned the product of
the primes of `O_E` at which a maximal integral lattice of `U` containing `P` is not unimodular, an ideal of norm
dividing `n`; two totally positive definite spaces of the same dimension with the same such primes are isometric,
because adding to both the line `⟨β⟩`, `β` the Gram determinant of one of them, gives spaces with a unimodular lattice,
both therefore `⟨1, …, 1⟩` (5.8(b)), and Witt cancellation removes the line; Witt's extension theorem gives one orbit
for each ideal, and `O_E` has at most `n^{1 + log₂[E : ℚ]}` nonzero ideals of norm at most `n`. The route written here
reads the local invariants of `U` off the volume ideal of `P`, applies Landherr's theorem (3.1) to `U` itself and counts
the ideals of `O_F` of norm `√n`.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §2a.5 (two nondegenerate subspaces of a Hermitian space over a
quadratic extension of number fields are conjugate under `U(V)` exactly when they are isometric at every place), for
the determination of `U` up to `U(V)(F)` by its localizations.

Let `F` be totally real, `E/F` a CM extension unramified at every finite place, `V` a totally definite
Hermitian space over `E`, and `j ≥ 1`, `n ≥ 1`. Prove that a
`j`-dimensional subspace `U ⊆ V` containing an integral lattice `P` with `#A_P = n` is determined up to
`U(V)(F)` by the volume ideal `𝔳(P)`, an integral ideal of `O_F` with `N(𝔳(P))² = n` (its class is that of
the subspaces whose determinant has odd valuation exactly at the inert places where `v(𝔳(P))` is odd);
hence these subspaces form at most `n^{(log₂[F : ℚ])/2}` orbits under `U(V)(F)`, and none when `n` is not
the square of a norm of an ideal of `O_F`.

*The form of the formal proof:* for `V` totally positive definite, these subspaces form at most
`n^{1 + log₂[E : ℚ]}` orbits under `U(V)(F)`. The bound `n^{(log₂[F : ℚ])/2}` above implies it and is a sharpening
proved by the route here.

Route: at a real place `U_v` is definite with the sign of `V_v`; at a split place every local class is
trivial; at an inert place, units being norms, the class of `det U_v` is the parity of its valuation,
which is that of `v(𝔳(P))` because `𝔳(P) = N_{E/F}(∏𝔞_i)·det H` (Conventions) and norms have even
valuation there. So the localizations of `U` are fixed by `𝔳(P)`, and Landherr's theorem (3.1) fixes
`U` up to isometry; isometric subspaces of `V` are conjugate under `U(V)(F)` (Witt's extension theorem,
1.1(b)). `N(𝔳(P))² = #A_P` is 4.8(a), and the number of ideals of norm `√n` is at most
`(√n)^{log₂[F:ℚ]}` (4.10(b)).

*Needs:* 1.1, 3.1, 4.8, 4.10.

**Checks.**

- `E = ℚ(ζ_12)`, `F = ℚ(√3)`, unramified at every finite place, with `2 = 𝔭²` in `F` and `𝔭` (of norm
  `2`) inert in `E`; `j = 2`. For `n = 16` the only ideal of norm `4` is `𝔭²`, of even valuation, so at
  most one orbit (bound `16^{1/2} = 4`), that of the subspaces isometric to `⟨1, 1⟩` when `V` is totally
  positive definite. It is nonempty exactly when `V` contains `⟨1, 1⟩`: for `V = ⟨1, 1⟩` (or
  `⟨1, 1, 1⟩`) the subspace `⟨e_1, e_2⟩` carries `P = O_Ee_1 ⊕ 𝔓e_2`, `𝔓 = 𝔭O_E`, integral with
  `𝔳(P) = N_{E/F}(𝔓) = 𝔭²` and `#A_P = 4² = 16`: one orbit. For the positive definite binary host
  `V = ⟨1, 11⟩` there is none: `11` splits in `F` (`3 ≡ 5² mod 11`) into two primes inert in `E` (`−1` is
  not a square modulo `11`), at which `det V = 11` has odd valuation, while `𝔳(P) = 𝔭²` would make
  `P` unimodular there; the only binary subspace is `V`, so there are zero orbits. For `n = 4` the ideal
  would be `𝔭`, of odd valuation at one inert place only, which the product formula (3.2) forbids for a
  definite space: no orbit.

### Examples

For `n = 1`, `E` imaginary quadratic and `L = O_E`, the class set is `Cl(E)` modulo the subgroup of the classes of ideals stable under conjugation: one class for `ℚ(√−15)` and three for `ℚ(√−23)` (5.1), of masses `1/2` and `3/2` (5.5). For `E = ℚ(√−3)` and `L = O_E^n` standard, `U(L) = μ_6^n ⋊ S_n` has order `6^n n!` (5.2). In `⟨1, 1⟩` over `ℚ(√−3)`, `mass(O_Ee_1 ⊕ 2O_Ee_2) = 2·mass(O_E²)` (5.6). For `V = ⟨1⟩`, `L = O_E` over `ℚ(√−3)`, trivial `W` and the principal congruence level at `7`, `dim M_W(K) = 1 = 6·(1/6)·1` (5.7).

### Dependencies

Layers 0–4; AdelicAlgebraicGroups §§3.4, 4.4; AutomorphicFormsOnReductiveGroups 7.4, 7.5 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5c; FiniteGroupInvariants 10.2; GeometryOfNumbersAndQuadraticArithmetic §2.4.7 (5.3, 5.4); ClassFieldTheory §13.1; ClassicalGroups Layer 5; Mathlib's double cosets and Hilbert 90 (5.3).

## Layer 6: Tamagawa numbers, local densities, the mass formula and Siegel's main theorem

### 6.0 The Tamagawa number of the norm-one torus

*Origin:* published: Ono (1963), the Tamagawa numbers of algebraic tori, here `τ(U(1)_{E/F}) = 2`, and Tate (1950),
`τ(G_m) = 1`, with its invariance under restriction of scalars for `τ(Res_{E/F} G_m) = 1`.

*Method of the formal proof:* both clauses for a CM extension, in measure-theoretic form. The first is the class number
formula, written as the volume of the idele classes of a totally complex field and proved from the fundamental cone of
the unit lattice. For the second, the mean of the rational points of a rank-one fibre is a constant `κ` times the
product of the local fibre measures, independent of the fibre by scaling and the Hasse norm theorem; `κ` is found by
counting the points of `E^×` in two ways for a test function, a Riemann-sum limit giving the volume and an Abelian
theorem for zeta integrals on the ideles of `F`, applied on the subgroup `F^×·N(𝔸_E^×)` of index two and on the whole
group, the index two giving the factor `2`. The route written here deduces both clauses from `τ(G_m) = 1`, the
invariance under restriction of scalars and the quotient formula with index `2`.

*Corollary of:* AdelicAlgebraicGroups §3.4a (*tamagawa-multiplicative-group*: `τ(G_m) = 1`, and `τ(Res_{E/F} G_m) = 1`
for every finite extension `E/F`) and §4.1a (*tamagawa-quadratic-norm-torus*: `τ(R¹_{E/F}G_m) = 2` for a quadratic
extension `E/F` of number fields, a case of Ono's formula).

Let `E/F` be a quadratic extension of number fields. Prove that
`τ(Res_{E/F} G_m) = 1` and `τ(U(1)_{E/F}) = 2`, for the Tamagawa measures of AdelicAlgebraicGroups
§2.4. The general facts behind it belong to AdelicAlgebraicGroups and OrbitMeasuresOnAdelicGroups:
`τ(G_m) = 1` (OrbitMeasuresOnAdelicGroups §3.4a *tamagawa-multiplicative-group*), the invariance of `τ`
under restriction of scalars (AdelicAlgebraicGroups §2.5 *tamagawa-restriction-scalars*), and the
quotient formula `τ(G_2/T_1) = i·τ(G_2)/τ(T_1)` for a central induced torus `T_1` of a connected
reductive `G_2`, `i` the index of the image of `X^*_F(G_2) → X^*_F(T_1)` (OrbitMeasuresOnAdelicGroups
§3.4a *tamagawa-central-induced-quotient*).

Route: `τ(Res_{E/F}G_m) = τ(G_m) = 1` by AdelicAlgebraicGroups §2.5 *tamagawa-restriction-scalars*
and OrbitMeasuresOnAdelicGroups §3.4a *tamagawa-multiplicative-group*. The sequence `1 → G_m → Res_{E/F} G_m → U(1) → 1`, `z ↦ z/z̄`, is
exact, also on `F`- and `F_v`-points: an element of norm one is some `z/z̄` (Hilbert 90, Mathlib
`groupCohomology.exists_div_of_norm_eq_one`, when `E_v` is a field; `(a, a^{−1}) = (a, 1)/(1, a)` at a
split place). `G_m` is a central induced torus of `Res_{E/F}G_m`, and the rational character
`N_{E/F}` of `Res_{E/F}G_m`, which generates `X^*_F(Res_{E/F}G_m)`, restricts to `t ↦ t²` on `G_m`. So
`i = 2` in OrbitMeasuresOnAdelicGroups §3.4a *tamagawa-central-induced-quotient*, and
`τ(U(1)) = 2·1/1`.

*Needs:* 0.1, 0.2; AdelicAlgebraicGroups §§2.4, 2.5 (*tamagawa-restriction-scalars*);
OrbitMeasuresOnAdelicGroups §3.4a (*tamagawa-multiplicative-group*, *tamagawa-central-induced-quotient*);
Mathlib
`groupCohomology.exists_div_of_norm_eq_one`.

**Checks.**

- Directly for `ℚ(i)/ℚ`, with gauge forms compatible with `z ↦ z/z̄`: `U(1)(ℝ)` has volume `π`;
  `U(1)(ℚ_2)` has volume `2` (the image of `ℤ_2[i]^×` has volume `1` and index two, `i = (1 + i)/(1 − i)`
  not being `z/z̄` for a unit `z`); the corrected factors at odd `p` are `1`; `L(1, η)^{−1} = 4/π`; and
  `U(1)(ℚ)\U(1)(𝔸_f)/U(1)(ℤ̂)` is a point with stabilizer `μ_4`. So `τ(U(1)) = (4/π)·π·2/4 = 2`, while
  `i = 1` in the quotient formula would give `1`.
- The other exact sequence of the norm-one torus, `1 → U(1) → Res_{E/F}G_m → G_m → 1` (the norm), does
  not satisfy the hypothesis of the quotient formula that the kernel be induced: `U(1)` is not, and the
  norm `E^× → F^×` is not onto; the formula would give `τ(G_m) = 1/2`.

### 6.0a Weil's rank-one identity for unitary groups

*Origin:* published: Weil (1965), Siegel's formula in Weil's convergent range for the classical groups, unitary groups
included, here in rank one for `U(V)` acting on the trace form `q_h`, `n ≥ 3`; the estimate (b), with its exponent, is
this roadmap's own formulation.

*Method of the formal proof:* for a CM extension and `t ≠ 0`, as an identity of measures. Convergence comes from a bound
for the mean number of rational vectors in a box, by unfolding and the finite volume of smaller unitary groups. The
mean over `[U(V)]` of the rational vectors of length `t ≠ 0` is an invariant measure on the adelic fibre, hence `c`
times the product of the local fibre measures, the group being transitive on the fibre over every finite set of places.
To see `c = 1`, `V` is treated as a quadratic space of dimension `2n` over `F`: the mean of its theta function minus
the Eisenstein series is bounded by `∏_w y_w^{−n/2}` on the product of upper half-planes (reduction to a Siegel domain
for `SL_2(F)`), so its `t`-th Fourier coefficient for a lattice `L` of `V` and its multiples `a^{−1}L` is `O(a^{dn})`,
`d = [F : ℚ]`, while the product of the local densities of `a^{−1}L` is at least a constant times `a^{d(2n−2)}` for
infinitely many integers `a`. The route written here is Weil's: convergence from Siegel sets of `U(V)`, and the
constant from a dilation at one nonsplit place.

*Corollary of:* MetaplecticAutomorphicForms §6.4b (Weil's mean-value form of Siegel's formula for unitary groups:
`τ(H)^{−1}∫_{[H]} Σ_{x ∈ 𝒳_T(F)} Φ(g^{−1}x) dg = ∫ Φ dμ_T` for a nondegenerate `T` of size `k` with `2k < dim V`), with
`k = 1`, for the terms `t ≠ 0` of (c).

Let `E/F` be a quadratic extension of number fields and `V` a Hermitian space of dimension `n ≥ 3`
and Witt index `r`. Regard `V` as an `F`-space of dimension `m = 2n` with the quadratic form
`q_h(x) = h(x, x)`; `U(V)` acts on it inside `SO(q_h)`. Let `S(V_𝔸)` be the Schwartz–Bruhat space of
AnalyticNumberTheoryPartII §5.3h, `Θ(φ) = Σ_{x ∈ V} φ(x)`, `F_φ(t)` (`t ∈ 𝔸_F`) the fibre
distribution of `q_h` at `t` (GeometryOfNumbersAndQuadraticArithmetic §3.3
`quadraticFiberDistribution`, gauge `dx/dq_h`, on the nonzero vectors: the integral of `φ` over the
adelic fibre for the restricted product of the local fibre measures; for `φ = φ_∞ ⊗ ⊗_{v<∞}φ_v`, with
`φ_∞` a Schwartz function on `V ⊗_F F_∞`, the archimedean places taken together, it is the product of
the archimedean fibre integral of `φ_∞` at `t_∞` and the local fibre integrals of the `φ_v` at the
`t_v`), and
`E(φ) = φ(0) + Σ_{t ∈ F} F_φ(t)` the rank-one Eisenstein distribution of `q_h` (§3.3, absolutely
convergent and continuous in `φ` since `m > 4`). Let `dg` be the invariant probability measure on
`[U(V)] = U(V)(F)\U(V)(𝔸)`. Prove:
(a) `∫_{[U(V)]} Σ_{x ∈ V} |φ(g^{−1}x)| dg < ∞` for every `φ ∈ S(V_𝔸)`;
(b) for ideles `s` with `|s| ≥ 1` and `φ` in a bounded subset of `S(V_𝔸)`,
`∫_{[U(V)]} Σ_{x ∈ V ∖ 0} |s|^n|φ(s·g^{−1}x)| dg = O(|s|^{2−n})`;
(c) for every `t ∈ F`, `∫_{[U(V)]} Σ_{x ≠ 0, q_h(x) = t} φ(g^{−1}x) dg = F_φ(t)`; hence
`∫_{[U(V)]} Θ(φ(g^{−1}·)) dg = E(φ)`.

Route: (a), (b) are reduction theory for `U(V)`. Fix a Witt decomposition
`V = ⊕_{i≤r}(Ee_i ⊕ Ef_i) ⊥ V_0` and the split torus `α = (a_1, …, a_r)` (`e_i ↦ a_ie_i`,
`f_i ↦ a_i^{−1}f_i`); `[U(V)]` is covered by a Siegel set `ω·{α : |a_1/a_2|, …, |a_{r−1}/a_r|, |a_r| ≥ c}·K`
(AdelicAlgebraicGroups §3.4, *Siegel sets cover*; `ω` compact in `N_0(𝔸)M_0(𝔸)^1`, the window in the
norm-one part of the Levi included, and `α` positive real at the archimedean places, trivial at the
finite ones), on which the Haar measure is `δ(α)^{−1}dω dα dk` (§3.1, Iwasawa integration); `α`
commutes with the Levi part of `ω`. The positive roots are `a_i/a_j` and `a_ia_j` (`i < j`, multiplicity
`2`), `a_i` (multiplicity `2(n − 2r)`) and `a_i²` (multiplicity `1`), so
`δ(α) = ∏_i |a_i|^{2n−4i+2}`. For `g = pαk` in the Siegel set (`p ∈ ω`, `k ∈ K`),
`g^{−1}x = ((α^{−1}pα)k)^{−1}α^{−1}x`, so `φ(g^{−1}x) = φ′(α^{−1}x)` with `φ′ = φ ∘ ((α^{−1}pα)k)^{−1}`;
conjugation by `α^{−1}` multiplies the root coordinates of the unipotent radical by `|β(α)|^{−1}`, which
is bounded on the Siegel domain for positive roots `β`, so `(α^{−1}pα)k` stays in a compact subset of
`U(V)(𝔸)`, and `φ′` stays in a bounded subset of `S(V_𝔸)` when `φ` does (a compact set of linear
substitutions maps bounded sets to bounded sets). For `φ′` in a bounded set the sum over `x` of
`|φ′(s·α^{−1}x)|` is `≪ ∏_i max(1, |a_i/s|)²` (the `e_i`-coordinates, in `E`, are stretched by
`|a_i/s|`, the others contracted), and the sum over `x ≠ 0` is moreover
`O_N((max_i |a_i/s| + |s|^{−1})^N)` when every `|a_i| ≤ |s|`. The sum depends on `s` only modulo
`F^×`, and `F^×\𝔸_F^1` is compact (AdelicAlgebraicGroups §3.4), so in (b) it suffices to take `s` a
positive real number embedded diagonally at the archimedean places. For `s = 1` the integrand
`∏|a_i|²δ(α)^{−1}` is `∏_{j≤r} t_j^{−2j(n−j−1)}` in the coordinates `t_j = |a_j/a_{j+1}|`,
`t_r = |a_r|`, integrable on `t_j ≥ c` because `n − j − 1 ≥ n − r − 1 > 0` (`r ≤ n/2`, `n ≥ 3`): this is
(a). For (b), let `k` be the largest index with `|a_k| ≥ |s|` (`k = 0` if there is none); by the
ordering of the Siegel domain, `max(1, |a_i/s|) ≍ |a_i/s|` for `i ≤ k` and `≍ 1` for `i > k`, so with
the factor `|s|^n` the integrand is
`≪ |s|^{n−2k}·∏_{i≤k}|a_i|^{4i−2n}·∏_{i>k}|a_i|^{−(2n−4i+2)}`. In the ordered coordinates `t_j`
(`j < k`) and `a_k`,
`∏_{i≤k}|a_i|^{4i−2n} = ∏_{j<k} t_j^{−2j(n−j−1)}·|a_k|^{−2k(n−k−1)}`,
integrated over `t_j ≥ c` and `|a_k| ≥ |s|`, with result `≍ |s|^{−2k(n−k−1)}` because `n − j − 1 > 0`
and `k(n − k − 1) > 0` for `1 ≤ k ≤ r ≤ n/2`, `n ≥ 3`. This holds also for `k = r = n/2` (`V`
hyperbolic), where the exponent `4k − 2n` of `a_k` alone is `0`. The indices `i > k` contribute `O(1)`,
since `2n − 4i + 2 ≥ 2` and the `|a_i|` are bounded below on the Siegel domain. So the part with
`k ≥ 1` is `≪ |s|^{n−2k−2k(n−k−1)} = |s|^{2k² − 2nk + n}`, and `2k² − 2nk + n ≤ 2 − n` for
`1 ≤ k ≤ n/2` (convex in `k`, equal to `2 − n` at `k = 1` and to `n − n²/2 ≤ 2 − n` at `k = n/2`); the
part with `k = 0` contributes `≪ |s|^{2−n}` by the rapid decay.
(c) Write `I(φ)` for the theta integral and `D = I − E`. Both are continuous on `S(V_𝔸)`, invariant
under `U(V)(𝔸)` (the fibre distributions are orthogonally invariant, §3.3) and under the rational
Weil operators of `quadraticWeilOperators` (for `I`, by the invariance of `Θ` and the commutation of
the Weil operators with `O(q_h)(𝔸) ⊇ U(V)(𝔸)`; for `E`, because `E(φ) = ∫_{[SO(q_h)]}Θ(φ(g^{−1}·))dg`
by `rankOneSiegelWeil`, `m > 4`, which is invariant for the same reason). *Bounded orbits*: for a
compact `C ⊂ SL_2(𝔸)` and `φ ∈ S(V_𝔸)`, the set `{ω(g)φ : g ∈ C}` is bounded in `S(V_𝔸)` up to the
central scalars, with a common support and level at the finite places. Indeed `φ` is a finite sum of
functions `φ_∞ ⊗ ⊗_{v<∞}φ_v` with `φ_∞ ∈ S(V ⊗_F F_∞)`, all archimedean places together, and
`φ_v ∈ S(V_v)` (AnalyticNumberTheoryPartII §5.3h: `S(V_𝔸)` is the union over lattice pairs `L_2 ⊆ L_1` of the archimedean Schwartz
space tensored with the functions on `L_1/L_2`, finite combinations of coset indicators, which are
products over the finite places; finite sums of functions factorizable over all places are only dense
when `F` has several archimedean places, `e^{−x²−y²+xy}` on `ℝ²` for a real quadratic `F` and `V = F`
being no such sum); `ω(g)` and `D` are linear, so for the boundedness below it suffices to treat one
such function, and the archimedean places are never separated. At almost all finite `v` (`ψ_v`
unramified, `q_v` odd, `L_v` self-dual for the polar form of `q_h`, `φ_v = 1_{L_v}`), `SL_2(𝒪_v)`,
generated by the `n(b)` (`b ∈ 𝒪_v`), the `d(u)` (`u ∈ 𝒪_v^×`) and `w`, fixes `1_{L_v}` up to scalars
(`ψ(bq_h) = 1` on `L_v`, dilation by a unit preserves `L_v`, and `1_{L_v}` is its own Fourier
transform); at the other finite `v`,
`φ_v` is fixed up to scalars by the open subgroup generated by the `n(b)`, `n^−(b′)` with `b`, `b′` in a
small enough ideal, so a compact set has a finite orbit up to scalars; at the archimedean places, a
compact subset of `SL_2(F_∞) = ∏_{v|∞}SL_2(F_v)` lies in a product of compact subsets of the factors,
the operators of distinct archimedean places commute and act on `S(V ⊗_F F_∞)` in the variables of
their place (multiplication by `ψ_v(bq_h)`, dilation, the partial Fourier transform in `V_v`,
AnalyticNumberTheoryPartII §§5.3g, 5.3h), a compact subset `C_v` of `SL_2(F_v)` is covered by the two sets `{|γ(g)| ≥ ε}` and
`w^{−1}{|γ(g)| ≥ ε}` (`γ(g)` the lower left entry, `ε > 0` small: `γ(g)` and `γ(wg)` are, up to sign,
the two entries of the first column of `g`, and if both were `< ε` in absolute value, `|det g|` would be
`< 1` on the bounded set `C_v`); on the first `g = n(b)d(u)wn(b′)`, and on the second
`g = w^{−1}n(b)d(u)wn(b′)` (the identity, with `γ(1) = 0`, is `w^{−1}·w`), in both cases with `b`, `u`,
`u^{−1}`, `b′` bounded, and each of these operators with parameters in a compact set maps bounded subsets
of `S(V ⊗_F F_∞)` to bounded subsets. *Uniform decay of the fibres*: for `t ∈ 𝔸_F` and
`φ′ = φ′_∞ ⊗ ⊗_{v<∞}φ′_v`, `F_{φ′}(t)` is the product of the archimedean fibre integral of `φ′_∞` at
`t_∞` and the local fibre integrals at the finite `t_v`. At the finite places outside a finite set `S`
(those above) the local factor vanishes unless `t_v ∈ 𝒪_v`, and is then the local density of the
unimodular quadratic lattice `L_v` of rank `2n` at `t_v`,
`(1 − χ_vq_v^{−n})Σ_{j=0}^{ord t_v}(χ_vq_v^{1−n})^j` (`χ_v = ±1` the discriminant character of `q_h`
at `v`), which lies between `0` and `(1 + q_v^{−n})/(1 − q_v^{1−n}) = 1 + O(q_v^{−2})` uniformly in
`t_v` for `n ≥ 3`: the "local factors `1 + O(q^{−2})`" of §3.3 are used uniformly in `t`. At the finite
places of `S` the factors are bounded (continuity in `t` and compact support) and vanish unless `t_v`
lies in a fixed compact set; at the archimedean places
`F_{φ′_∞}(t_∞) = O_N(∏_{v|∞}(1 + |t_v|)^{−N})`: for every `M`,
`|φ′_∞(x)| ≤ C_M(1 + |x|)^{−dM} ≤ C_M∏_{v|∞}(1 + |x_v|)^{−M}` (`d = [F : ℚ]`, as
`∏_v(1 + |x_v|) ≤ (1 + |x|)^d`), the archimedean fibre measure is the product of the local ones, and the
integral of `(1 + |x_v|)^{−M}` over the fibre `{q_h = t_v}`, which stays at distance `≫ |t_v|^{1/2}`
from `0` and whose fibre measure grows polynomially, is `O_N((1 + |t_v|)^{−N})` for `M` large. All these
bounds are uniform for `φ′` in a bounded set with common support and level. *Boundedness*: by
AdelicAlgebraicGroups §3.4 (*Siegel sets cover*, for `SL_2` over `F` with the upper triangular Borel
subgroup `B = NM`, `M = {d(u)}`, and the standard maximal compact subgroup `K`),
`SL_2(𝔸) = SL_2(F)·𝔖(T′, Ω)` for some `T′` and some compact `Ω ⊂ N(𝔸)M(𝔸)^1`. The elements of
`𝔖(T′, Ω)` are the `n(b)d(u)d(s)k` with `n(b)d(u) ∈ Ω` (so `b` in a compact subset of `𝔸_F` and `u` in a
compact subset `Ω_M` of the norm-one ideles `𝔸_F^1`), `s` a positive real number embedded diagonally at
the archimedean places and trivial at the finite places with `s > c_1` (the inequality
`β(H_0(d(s)) − T′) > 0` for the simple root `β`, with a constant `c_1 > 0` fixed by `T′`), and `k ∈ K`.
The window `Ω_M` cannot be dropped when `F` has class number `> 1` (Checks). Since `d(u)` and `d(s)`
commute, every element of `𝔖(T′, Ω)` is `n(b)d(s)k′` with `k′ = d(u)k` in the compact set
`C = d(Ω_M)K`, and by *Bounded orbits* the family `{ω(k′)φ : k′ ∈ C}` is bounded in `S(V_𝔸)` (up to
central scalars) with a common support and level. If `s ≥ 1`, (b) applied to this family gives
`|I(ω(n(b)d(s)k′)φ) − |s|^n(ω(k′)φ)(0)| ≪ |s|^{2−n}` (`ω(n(b))` multiplies by `ψ(bq_h)`, of absolute
value one), and the scaling `F_{φ∘s}(t) = |s|^{−m+2}F_φ(s²t)` of §3.3 gives
`|E(ω(n(b)d(s)k′)φ) − |s|^n(ω(k′)φ)(0)| ≤ |s|^{2−n}Σ_{t∈F}|F_{ω(k′)φ}(s²t)| ≪ |s|^{2−n}`, the sum being
over `t` in a fixed fractional ideal (`s` is trivial at the finite places, and the common support
bounds the finite `t_v`) with `∏_{v|∞}(1 + s²|t_v|)^{−N} ≤ ∏_{v|∞}(1 + |t_v|)^{−N}`; so
`|D(ω(g)φ)| ≪ 1`. If `c_1 < s < 1`, then `g` lies in the compact set `n(Ω_N)d([c_1, 1])C` (`Ω_N` the
compact set of the `b`), whose Weil operators keep `φ` in a bounded set (*Bounded orbits*), on which the
continuous linear functional `D` is bounded. So `|D(ω(g)φ)|` (which does not see the central scalars of
the Weil operators) is bounded on `𝔖(T′, Ω)`, hence on `SL_2(𝔸) = SL_2(F)·𝔖(T′, Ω)`, `D` being invariant
under the rational Weil operators. *Fourier
coefficients*: for `t ∈ F`, `D_t(φ) = ∫_{F\𝔸} D(ω(n(b))φ)ψ(−tb) db` is, by (a), `I^t(φ) − E^t(φ)`, where
`I^t(φ)` is the left side of (c) and `E^t(φ) = F_φ(t)` (for `t = 0` the terms `x = 0` give `φ(0)` on both
sides, `dg` having mass one); `I^t` and `E^t` are positive `U(V)(𝔸)`-invariant Radon measures on the
adelic fibre `{q_h = t} ∖ 0`, and `|D_t(ω(g)φ)| ≤ sup|D(ω(·)φ)| < ∞` for every `g`. *Uniqueness at one
place*: fix a finite place `v` not split in `E`. Such a place exists: if every finite place split,
`L(s, η) = ζ_E(s)/ζ_F(s)` would be `ζ_F(s)` and have a pole at `s = 1`, whereas its limit at `s = 1` is
`L(1, η) = κ_E/κ_F` (AnalyticNumberTheoryPartI §2.17a). As `dim V_v ≥ 3`, every `t ∈ F_v` is
represented and `U(V)(F_v)` acts transitively on `{q_h = t}(F_v) ∖ 0` (1.1(b), 1.2, 2.1(c)); so for
fixed nonnegative `φ^v` away from `v`, `φ_v ↦ D_t(φ_v ⊗ φ^v)` is `c(φ^v)·μ_{t,v}(φ_v)` with `μ_{t,v}` the
local fibre measure (uniqueness of invariant measures on a homogeneous space, AdelicAlgebraicGroups
§2.2; the stabilizers are unimodular). *Dilation*: for `s_v ∈ F_v^×` at `v` only, the local scaling of
the fibre measures gives `|D_t(ω(d(s_v))φ)| = |c(φ^v)|·|s_v|^{2−n}μ_{s_v²t,v}(φ_v)`; as `|s_v| → 0`,
`μ_{s_v²t,v}(φ_v)` tends to `μ_{0,v}(φ_v)` (continuity in `t`, `quadraticFiberFourier`), which is
positive for suitable `φ_v ≥ 0` because `V_v` is isotropic, while `|s_v|^{2−n} → ∞`; boundedness forces
`c(φ^v) = 0`. So `I^t = E^t` on all `φ_v ⊗ φ^v` with `φ^v ≥ 0`, hence as Radon measures, which is (c);
summing over `t` (absolute convergence) gives `I = E`.

*Needs:* 1.1, 1.2, 2.1; GeometryOfNumbersAndQuadraticArithmetic §3.3 (`quadraticWeilOperators`,
`quadraticFiberDistribution`, `quadraticFiberFourier`, `rankOneSiegelWeil`); AnalyticNumberTheoryPartI
§2.17a; AnalyticNumberTheoryPartII §§5.3g, 5.3h; AdelicAlgebraicGroups §§2.2, 3.1, 3.4.

**Checks.**

- The right side depends only on `q_h`: averaging `Θ` over `U(V)(F)\U(V)(𝔸)` or over
  `SO(q_h)(F)\SO(q_h)(𝔸)` gives the same distribution.
- `n = 2` is excluded: `m = 4` is the borderline of `quadraticFiberDistribution`, and for the
  hyperbolic plane (`r = 1`) the exponent `n − r − 1` of (a) is `0`.
- At the nonsplit place of the route `U(V)(F_v)` is transitive on `{q_h = t}(F_v) ∖ 0` for every `t`. At
  a split place `v` the nonzero vectors of `{q_h = 0}(F_v)` are the pairs `(x_1, x_2) ≠ 0` with
  `⟨x_1, x_2⟩ = 0` (0.1), three `GL(V_{v,1})`-orbits according as neither, `x_2` or `x_1` vanishes, but
  uniqueness holds there as well: the two closed orbits carry no nonzero invariant Radon measure (on
  `V_{v,1} ∖ 0`, of dimension `n ≥ 3`, invariance under `SL(V_{v,1})` forces a multiple of additive Haar
  measure, which the scalar `a ∈ F_v^×` multiplies by `|a|_v^n`; the same on the dual), so an invariant
  measure on the punctured cone is a multiple of the invariant measure of the open orbit.
- The compact window in `M(𝔸)^1` of the Siegel set of *Boundedness* is needed. For `F = ℚ(√−5)` the ideal
  `𝔞 = (2, 1 + √−5)` is not principal (`x² + 5y² = 2` has no integral solution); let `u` be a finite
  idele with `u_vO_v = 𝔞_v` and `g_R = d(u)d(R)`, `R > 0` real at the complex place. If
  `γg_R = n(b)d(s)k` with `γ ∈ SL_2(F)`, `s ≥ c_1 > 0` real, `b` bounded and `k ∈ K` (no window), the
  bottom row `(c, d)` of `γ` makes `(cu_v, d/u_v)` the bottom row of `k_v`, integral and primitive, at
  every finite `v`: `c ∈ 𝔞^{−1}`, `d ∈ 𝔞` and `c𝔞 + d𝔞^{−1} = O_F`. `c = 0` would give `dO_F = 𝔞`; so
  `c ≠ 0`, `|c| ≥ N(𝔞)^{−1/2} = 2^{−1/2}`, and at the complex place the bottom row `(cR, d/R)` has length
  `≥ R/√2`, against the length `s^{−1} ≤ c_1^{−1}` of the bottom row of `n(b)d(s)k_∞`. So for large `R`
  no rational translate of `g_R` lies in such a set: the cusp of the class of `𝔞` is missed. With the
  window, `g_R = d(u′)d(R/√2)` with `u′ = (u, √2) ∈ 𝔸_F^1` (`|u| = 1/2`, `|√2|_ℂ = 2`).

### 6.0b The Tamagawa number of `U(V)`

*Origin:* published: Weil (1961) and Weil (1965), the Tamagawa number `τ(U(V)) = 2`, obtained by induction on the
dimension through the stabilizer of a vector, which has the Tamagawa number of the group; (c) is the orbit statement
that this induction uses for an isotropic vector.

*Method of the formal proof:* for a CM extension, a family of Haar measures on the adelic unitary groups compatible
with every passage to the stabilizer of a vector of nonzero norm: starting from any basis-invariant family, each step
from a unitary group to the stabilizer of a vector defines a positive scaling constant; these constants satisfy a square
relation, proved by unfolding two chains of steps over the pairs that span a plane, and a lemma in the manner of Witt's
chain equivalence (a third splitting adjacent to two given ones, chosen off the zero sets of three quadratic functions)
shows that they form a coboundary, which gives a family compatible with every step. The published proof, Weil (1961),
which is the route written here, uses the Tamagawa measures of invariant differential forms (gauge forms) and
determines the value `2`.

Let `E/F` be a quadratic extension of number fields. Prove: (a) for a Hermitian space `V'` of dimension `n′ ≥ 3` and a nonzero `x ∈ V'`,
the stabilizer `U(V')_x` of `x` satisfies `τ(U(V')_x) = τ(U(V'))`, where `U(V')_x = U(x^⊥)` if
`h(x, x) ≠ 0`, and `U(V')_x = U(W_0) ⋉ N` with `W_0 = ⟨x, y⟩^⊥` for a hyperbolic partner `y` of `x` and
`N` the Heisenberg group `1 → {z ∈ E : z + z̄ = 0} → N → W_0 → 1` if `x` is isotropic, its Tamagawa
number being that of OrbitMeasuresOnAdelicGroups §3.4a *tamagawa-number-unipotent-radical*; (b) `τ(U(V)) = 2`
for every Hermitian space `V` of dimension `n ≥ 1`, for the Tamagawa measure of AdelicAlgebraicGroups
§2.4 with convergence factors `L_v(1, η_v)` and leading coefficient `L(1, η)` (Weil [Weil65]; the value
is recorded in [Kirschmer], Theorem 4.2.3, p. 51); (c) for isotropic `x`: at
every place `v` split in `E` (finite, real or complex) the nonzero vectors of `{q_h = 0}(F_v)` form
three `U(V')(F_v)`-orbits (`x_1 ≠ 0 ≠ x_2`, `x_2 = 0`, `x_1 = 0` in the notation of 0.1), and at every
other place at most one; and, for a lattice `L ⊂ V'`, the adelic orbit `U(V')(𝔸)·x` has full measure in
the punctured adelic cone `C(𝔸)`, the restricted product of the punctured local cones
`C_v = {q_h = 0}(F_v) ∖ 0` with respect to the `C_v ∩ L_v`, for the restricted product of the local
fibre measures `|dx/dq_h|_v`.

Route: (a) Put `G = U(V')`, `H = U(V')_x`, `t = h(x, x)`. `H` is connected; `X^*(G) → X^*(H)` is an
isomorphism (both are `ℤ` with the nontrivial element of `Gal(E/F)` acting by `−1`, ReductiveGroups §9D.1, as
`dim x^⊥` and `dim W_0` are at least `1`); `τ(U(W_0) ⋉ N) = τ(U(W_0))` (OrbitMeasuresOnAdelicGroups §3.4a
*tamagawa-number-unipotent-radical*); and `G` and `H` are unimodular in the algebraic sense required
by OrbitMeasuresOnAdelicGroups §2.6 *homogeneous-gauge-measure*: `det Ad_{Lie G} = 1` and
`det Ad_{Lie U(x^⊥)} = 1` because these groups are reductive (ReductiveGroups §9D.1), and for `H = U(W_0) ⋉ N` the
factor `U(W_0)` acts on `Lie N = W_0 ⊕ {z : z + z̄ = 0}` with determinant `N_{E/F}(det g) = 1` (on the
`F`-space `W_0`; trivially on the centre) while `N` acts unipotently. The orbit `X` of `x` is the
fibre `{q_h = t}` for `t ≠ 0` and, for `t = 0`, the open `G`-orbit in the cone `{q_h = 0}`, which omits
`0` and, over `F̄`, the two closed orbits; in both cases `dq_h` is onto along `X`, and for `t = 0` the
`F`-points of `X` are all the nonzero rational isotropic vectors (for a field `E` both components over
`F̄` are nonzero). The rational points of `X` form one `G(F)`-orbit (1.1(b), 1.2). Unfolding this orbit
in 6.0a(c) for `V'`, the left side is `(τ(H)/τ(G))·∫_{H(𝔸)\G(𝔸)} φ(g^{−1}x) d(τ_G/τ_H)`, and by
OrbitMeasuresOnAdelicGroups §2.6 *homogeneous-gauge-measure* (iii), (iv) (`A = V'`, `B = F`, `Φ = q_h`, `X`
open in the fibre `{q_h = t}`; `G` acts linearly with determinant `N_{E/F}(det g) = 1`) the quotient of
`τ_G` by `τ_H` on `H(𝔸)\G(𝔸)` is the restricted product of the local fibre measures `|dx/dq_h|_v` of
`F_φ(t)` on the local orbits `G(F_v)·x`. For `t ≠ 0`, `G(𝔸)·x` is the whole adelic fibre (the restricted
product of the `{q_h = t}(F_v)` with respect to the `{q_h = t} ∩ L_v`): `G(F_v)` is transitive on
`{q_h = t}(F_v)` at every `v` (at a split place `GL(V'_1)` is transitive on `{⟨x_1, x_2⟩ = t}`), and for
almost all `v` `U(L_v)` is transitive on `{q_h = t} ∩ L_v` (a unimodular line splits off and its
complements are isometric, 4.2(a)). For `t = 0` use (c). Hence `(τ(H)/τ(G))·F_φ(t) = F_φ(t)` for all
`φ`, and `F_φ(t) ≠ 0` for suitable `φ ≥ 0` as `x` lies on the fibre. (b) `n = 1` is 6.0. For `n ≥ 2`
choose `x ∈ V` with `a = h(x, x) ≠ 0` (0.2) and put `V' = V ⊥ Ee` with `h(e, e) = −a`, of dimension
`n + 1 ≥ 3`. The stabilizer of `e` is `U(V)`; the vector `x + e` is isotropic, `⟨x, e⟩ ≅ H`, and its
stabilizer is `U(W_0) ⋉ N` with `W_0 = x^⊥ ∩ V` of dimension `n − 1 ≥ 1`. By (a) twice and
OrbitMeasuresOnAdelicGroups §3.4a *tamagawa-number-unipotent-radical*, `τ(U(V)) = τ(U(V')) = τ(U(x^⊥ ∩ V))`;
induction on `n`. (c) The orbits at a split place `v`, finite or archimedean, are those of
`GL(V'_1)(F_v)` on pairs `(x_1, x_2)` with `⟨x_1, x_2⟩ = 0` (0.1); the two closed ones have dimension
`n′ < 2n′ − 1` and are null for the fibre measure. At the other places Witt's theorem (1.1(b)) gives
at most one orbit. For almost all `v`, `x` is primitive in `L_v`, `L_v` is unimodular, `E_v/F_v` is
unramified or split, and `U(L_v)` is transitive on the primitive isotropic vectors of `L_v` (4.2(d),
then 4.2(a) for the complements); the isotropic vectors of `L_v` that are not primitive form a fraction
`O(q_v^{1−n′})` of the fibre measure of `C_v ∩ L_v`: those in `ϖ_vL_v` the fraction `q_v^{2−2n′}`
(scaling), and at a split place those with exactly one component in `ϖ_vΛ` or `ϖ_vΛ^*`, whose
reductions are the `2(q_v^{n′} − 1)` points with a vanishing component among the
`(q_v^{n′} − 1)(q_v^{n′−1} + 1)` nonzero points of the cone modulo `ϖ_v` (the open orbit has
`(q_v^{n′} − 1)(q_v^{n′−1} − 1)`); every nonzero point of the cone modulo `ϖ_v` is smooth, so by Hensel
each carries the same measure, and these vectors form the fraction `2/(q_v^{n′−1} + 1)` of the part with
nonzero reduction, that is `(1 − q_v^{2−2n′})·2/(q_v^{n′−1} + 1)` of `C_v ∩ L_v`; with the part in
`ϖ_vL_v` the non-primitive vectors at a split place form the fraction
`q_v^{2−2n′} + (1 − q_v^{2−2n′})·2/(q_v^{n′−1} + 1) = O(q_v^{1−n′})`. As `Σ_v q_v^{1−n′} < ∞` for
`n′ ≥ 3`, the points of `C(𝔸)` lying outside `U(L_v)x` at infinitely many `v` form a null set
(Borel–Cantelli for the restricted product measure, whose local factors `μ_{0,v}(C_v ∩ L_v)` are
`1 + O(q_v^{−2})` at almost all `v`, §3.3), and so do those meeting a closed orbit at some split place.
Every other point `y` has `y_v` in `G(F_v)·x` at every place (`x` lies in the open orbit at the split
places) and in `U(L_v)x` at almost all, so it lies in `G(𝔸)·x`.

For a CM extension unramified at every finite place, the quotient of `τ_G` by `τ_H` in the route of (a), `t ≠ 0`: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsIsGaugeOfIsCMExt.lean` (`GlobalTheory.GaugeEx.exists_isGauge`).
For a CM extension the formal proof builds a compatible family of Haar measures rank by rank, independent of the chain of
vectors chosen (two chains of two vectors of nonzero norm with the same orthogonal complement, `n′ ≥ 4`)
([FormalProof], `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/UnitaryStabilizerMeasureIndependentOfPathStatement.lean`
(`GlobalTheory.T.unitaryStabilizer_measure_independent_of_path`)), where this roadmap takes the Tamagawa measures.

*Needs:* 0.1, 0.2, 1.1, 1.2, 4.2, 6.0, 6.0a; AdelicAlgebraicGroups §§2.2, 2.4; OrbitMeasuresOnAdelicGroups
§§2.6 (*homogeneous-gauge-measure*), 3.4a (*tamagawa-number-unipotent-radical*); ReductiveGroups §9D.1.

**Checks.**

- The induction never passes through `SU(V)`: its last step is the torus `U(1)`, whose Tamagawa
  number `2` is the index `i = 2` of 6.0.
- Without the convergence factors, the local volumes `1 − q_v^{−1}` (split) and `1 + q_v^{−1}`
  (inert) of `U(1)(O_v)` have a product that converges only conditionally, to `L(1, η)^{−1}` up to
  the finitely many ramified factors.
- For `n = 1` the space `V' = ⟨a, −a⟩ ≅ H` has dimension `2`, too small for 6.0a; this is why the
  induction starts with the torus and uses only spaces `V'` of dimension `≥ 3`.
- (c) for `n′ = 3` at a split place with `q_v = 5`: the cone modulo `ϖ_v` has `124·26 = 3224` nonzero
  points, of which `248` have a vanishing component, the fraction `2/26 = 1/13` of the part with nonzero
  reduction; of the whole of `C_v ∩ L_v` the non-primitive vectors form
  `5^{−4} + (1 − 5^{−4})/13 = 49/625`. For `q_v = 2`: `1/16 + (15/16)(2/5) = 1/16 + 3/8 = 7/16`, which the
  counts of the cone modulo `2^N` approach (`0.4362`, `0.4372`, `0.4374`, `0.4375` for `N = 3, …, 6`).
  These fractions are `O(q_v^{−2})` and summable. For the orthogonal group of `q_h` there are no such
  closed orbits: `SO(q_h)(F_v)` is transitive on the nonzero isotropic vectors.

### 6.1 Local densities

*Origin:* published: Braun (1941), for Hermitian forms over an imaginary quadratic field, the local densities as limits
of normalized congruence counts, and Kirschmer (2016), Definition 4.2.2, after Gan and Yu (2000), the density of an
integral lattice as a point count of its stabilizer scheme; the densities as volumes of fibre measures, Weil (1961).
The rescaled definition for lattices that are not integral, the uniqueness clause of (f) and (g) in positive
characteristic are this roadmap's own formulation.

*Method of the formal proof:* for integral lattices at unramified places, in rank `n` and in rank one, the densities
are limits of normalized counts modulo `𝔭^N`, which stabilise by lifting solutions one step at a time with an element
`c` such that `c + c̄ ≡ 1`, and the relation between the densities of two lattices is an identity between indices of
congruence subgroups; separately, for Siegel's theorem, the fibre measures of `X ↦ T_X` are characterised by the fibre
integration formula together with continuity in `T`. The route written here identifies the congruence densities with
the fibre measures, in (f) and (g), and compares two lattices by a measure-preserving isometry of a compact set.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §3.2.8 (the local densities `β(L)`, `α(L, T)` of an integral
Hermitian lattice at every finite place of a local field of characteristic zero: stabilization of the normalized
counts, `β(L) = α(L, T_B)`, invariance, agreement with 3.2.2 at unramified places, vanishing exactly when `T` is not
represented), for (a)–(e) for integral lattices in characteristic zero.

Let `F_v` be a nonarchimedean local field of characteristic `≠ 2`, `L_v` a lattice of rank `n` in
`V_v`, `k ≤ n` and `T ∈ Herm_k(E_v)` nondegenerate. Define the local densities `β_v(L)` and
`α_v(L, T)` and prove: (a) if `L_v` is integral (`s(L_v) ⊆ O_{E_v}`), the sequences
`q_v^{−N n²}·#{X ∈ End(L_v)/ϖ_v^N End(L_v) : h(X·, X·) ≡ h mod ϖ_v^N Herm(L_v)}` and
`q_v^{−N(2nk − k²)}·#{X ∈ Hom(O_{E_v}^k, L_v)/ϖ_v^N : T_X ≡ T mod ϖ_v^N Herm_k(O_{E_v})}` are well
defined (the congruences depend only on the classes of `X`) and eventually constant, with limits
`β_v(L)` and `α_v(L, T)`; replacing `h` by `ϖ_vh` multiplies `β_v(L)` by `q_v^{n²}`, and, with `T`
replaced by `ϖ_vT`, multiplies `α_v(L, T)` by `q_v^{k²}`. For an arbitrary lattice `L_v` choose
`a ≥ 0` with `ϖ_v^a s(L_v) ⊆ O_{E_v}`, and put `β_v(L) = q_v^{−an²}β_v(L; ϖ_v^ah)` and
`α_v(L, T) = q_v^{−ak²}α_v(L, ϖ_v^aT; ϖ_v^ah)`, the densities of `L_v` for the form `ϖ_v^ah`, on which
it is integral; these depend neither on `a` nor on the uniformizer, and agree with the counts when
`L_v` is integral. (b) `β_v(L) = α_v(L, T_B)` for the Gram matrix `T_B` of any `O_{E_v}`-basis `B` of
`L_v`; (c) both are invariant under isometries, and `α_v(L, T) = α_v(L, A^* T A)` for
`A ∈ GL_k(O_{E_v})`; (d) at an inert place, for integral `L_v` and integral `T`, they agree with
GeometryOfNumbersAndQuadraticArithmetic 3.2.2 (`hermitianLocalDensity`); (e) `α_v(L, T) = 0` iff `T`
is not represented by `L_v`; (f) if `F_v` has characteristic zero, the maps `Φ_h(X) = h(X·, X·)` on
`GL(V_v)` and `X ↦ T_X` on the injective `X ∈ Hom(E_v^k, V_v)` are submersions; each fibre carries the
residue measure `μ = |dX/dS|` of OrbitMeasuresOnAdelicGroups §2.6 *homogeneous-gauge-measure* (iv) (with
*top-form-measure*), for the Haar measures of the Conventions; these measures satisfy the fibre
integration formula `∫ φ dX = ∫ (∫_{fibre over S} φ dμ) dS`, they depend continuously on `S` (for
`φ` continuous with compact support, `S ↦ ∫_{fibre over S} φ dμ` is continuous), and they are the
only family with these two properties (the formula alone determines the fibre measures only for
almost every `S`); and, for every lattice `L_v`, integral or not, `β_v(L) = μ(U(L_v))`,
`α_v(L, T) = μ({X ∈ L_v^k : T_X = T})`. The same holds over `F_∞ = F ⊗ ℝ` for a global `V` and
`T ∈ Herm_k(E)`, with the archimedean Haar measures of the Conventions on `End(V) ⊗_F F_∞`,
`(V ⊗_F F_∞)^k` and `Herm(V) ⊗_F F_∞`: this defines the archimedean fibre measures on `U(V)(F_∞)` and
on `X_T(F_∞) = {X : T_X = T}`; (g) in every characteristic `≠ 2`: for a lattice `L_v` and a compact open
`Ω ⊆ End_{E_v}(V_v)`, with `A = Ω ∩ U(V)(F_v)`, the number
`q_v^{Nn²}·vol_L{X ∈ Ω : h(X·, X·) − h ∈ ϖ_v^N Herm(L_v)}` (`vol_L` the Haar measure of the Conventions,
`End(L_v)` of volume one) is constant for large `N`, and its value `μ_L(A)` depends only on `A`; `μ_L`
extends to a left Haar measure of `U(V)(F_v)` with `β_v(L) = μ_L(U(L_v))`, and for two lattices
`μ_L = N(𝔳(L_v)𝔳(L′_v)^{−1})^n·μ_{L′}`. In characteristic zero `μ_L` is the residue measure of (f).
For integral `L_v` in characteristic zero, `β_v(L)` of (a) is the density of [Kirschmer], Definition
4.2.2, pp. 50–51, there written as a point count of the stabilizer scheme of `L_v`.

Route: (a) In a basis with Gram matrix `H`, `(X + ϖ^NY)^*H(X + ϖ^NY) − X^*HX` lies in
`ϖ^N Herm_n(O_{E_v})` when `H` is integral, so the congruences are conditions on the classes of `X`;
without integrality they are not (Checks). The congruence for `ϖh` modulo `ϖ^N` is that for `h`
modulo `ϖ^{N−1}`, and each class modulo `ϖ^{N−1}` has `q_v^{2n²}` (resp. `q_v^{2nk}`) lifts modulo
`ϖ^N`, which gives the factors `q_v^{n²}`, `q_v^{k²}` and the independence of `a`; multiplying `ϖ` by a
unit does not change the congruences. (a)–(e) Hensel's lemma for the smooth fibres over the compact
open sets of integral points gives stabilization, as in GeometryOfNumbersAndQuadraticArithmetic
`hermitian_count_stabilizes` (stated there for unramified `E_v`); the argument works at every place.
(f) the differentials `Y ↦ X^*HY + Y^*HX` are onto the Hermitian forms at invertible (resp. injective)
`X`, at nonarchimedean and archimedean places alike, and OrbitMeasuresOnAdelicGroups §2.6
*homogeneous-gauge-measure* (iv) (with `A = End(V_v)` or `Hom(E_v^k, V_v)`, `B` the Hermitian forms,
`Φ = Φ_h` or `X ↦ T_X`, `U(V)` acting by left multiplication with determinant `N_{E/F}(det g)^n` resp.
`N_{E/F}(det g)^k`, both `1`; over `F_∞` the product of the archimedean places) gives the residue
measures and the fibre integration formula. In the submersion charts of *top-form-measure* the
residue measures are Haar measures times a continuous density, so they depend continuously on `S`;
two continuous families satisfying the formula agree for almost every `S` (test it on `φ·(ψ∘Φ)`), hence
for every `S`. The identification with the limits of (a) for integral `L_v` is the counting of points
of the smooth fibres modulo `ϖ_v^N`; for an arbitrary `L_v`, the substitution `S ↦ ϖ^aS` on the
`F_v`-space `Herm(V_v)` of dimension `n²` (resp. `Herm_k(E_v)`, of dimension `k²`) has modulus
`q_v^{−an²}` (resp. `q_v^{−ak²}`), so the residue measure of `ϖ^ah` is `q_v^{an²}` (resp. `q_v^{ak²}`)
times that of `h` on the same set `U(L_v)` (resp. `{X ∈ L_v^k : T_X = T}`), which is the scaling of (a).
(g) In a basis of `L_v` with Gram matrix `H` (integral or not) put `τ = 1/2`, so `τ + τ̄ = 1`. For
`X_0 ∈ U(V)(F_v)` and `Z ∈ M_n(O_{E_v})`, `h(X·, X·)` for `X = X_0(1 + ϖ_v^mZ)` has Gram matrix
`H + ϖ_v^mΨ_m(Z)` with
`Ψ_m(Z) = HZ + Z^*H + ϖ_v^mZ^*HZ = λ(φ_m(Z))`, where `λ(W) = HW + W^*H` and
`φ_m(Z) = Z + ϖ_v^mτH^{−1}Z^*HZ` (as `(H^{−1}Z^*HZ)^*H = Z^*HZ`). For `m` large, `φ_m` maps
`M_n(O_{E_v})` into itself and preserves the distance given by the largest absolute value of the
entries (the correction `ϖ_v^mτH^{−1}(Δ^*HZ + Z′^*HΔ)` of `Δ = Z − Z′` is smaller than `Δ`); a
distance-preserving self-map of this compact set is a bijection preserving its Haar measure. `λ` is
`F_v`-linear and maps `M_n(O_{E_v})` onto a lattice `I` of Hermitian matrices (`λ(τH^{−1}S) = S`). So on
each ball `B(X_0) = X_0(1 + ϖ_v^m End(L_v))` the map `X ↦ h(X·, X·)` carries `vol_L` to `c` times a fixed
Haar measure `vol` of `Herm(V_v)` on `h + ϖ_v^mI`, with `c` independent of `X_0` (left multiplication by
`X_0` preserves `X ↦ h(X·, X·)` and has modulus `|N_{E/F}(det X_0)|_v^n = 1`). As `A` is compact and `Ω`
open and compact, for `m` large the balls `B(X_0)`, `X_0 ∈ A`, lie in `Ω` and meet `U(V)(F_v)` in the
cosets `X_0K_m`, `K_m = U(V)(F_v) ∩ (1 + ϖ_v^m End(L_v))`, which make up `A` (their number is written
`[A : K_m]`); on the compact
rest of `Ω` the value of `X ↦ h(X·, X·)` stays away from `h`. Hence for every small Borel set `Y` of
Hermitian forms, `vol_L{X ∈ Ω : h(X·, X·) − h ∈ Y} = C_A·vol(Y)` with `C_A = [A : K_m]·c`, and the
number in (g) is `C_A·vol(Herm(L_v))` for all large `N`: constant, determined by `A`, and additive and
left invariant in `A`, hence a left Haar measure. For integral `L_v` and `Ω = End(L_v)` (so
`A = U(L_v)`: an isometry `X` with `XL_v ⊆ L_v` has `XL_v = L_v`, the two having equal volume) the set
counted is a union of classes modulo `ϖ_v^N End(L_v)`, each of volume `q_v^{−2Nn²}`, so the number is the
normalized count of (a); for the form `ϖ_v^ah` the set is that for `h` with `N − a` in place of `N`, which
gives `β_v(L) = μ_L(U(L_v))` for every `L_v`. Two lattices give the same `vol_L` (`End(L_v)` and
`End(L′_v) = g End(L_v) g^{−1}` for `L′_v = gL_v` have equal volume) and the same `C_A`, so
`μ_{L′}/μ_L = vol(Herm(L′_v))/vol(Herm(L_v))`; and `Herm(L′_v) = {S : g^*Sg ∈ Herm(L_v)}`, where
`S ↦ g^*Sg` has modulus `|N_{E/F}(det g)|_v^n` on the `n²`-dimensional `Herm(V_v)` (`N(det g)^n` already
for diagonal `g`) and `N_{E/F}(det g)O_v = 𝔳(L′_v)𝔳(L_v)^{−1}`, so the ratio is
`N(𝔳(L′_v)𝔳(L_v)^{−1})^n`. In characteristic zero the fibre integration formula and the continuity in
`S` of (f) give `vol_L{X ∈ Ω : h(X·, X·) − h ∈ Y}/vol_L(Y) → μ(A)` as `Y` shrinks to `0`, for the Haar
measures of the Conventions (`vol_L(Herm(L_v)) = 1`), and the left side is `μ_L(A)` for small `Y`.

*Needs:* 4.0, 4.5; GeometryOfNumbersAndQuadraticArithmetic 3.2.1, 3.2.2, `hermitian_count_stabilizes`;
AdelicAlgebraicGroups §2.4 and OrbitMeasuresOnAdelicGroups §2.6 (*top-form-measure*, *homogeneous-gauge-measure*).

**Checks.**

- `n = k = 1`, `L = O_{E_v}`, `T = 1` at a ramified nondyadic `v`: the solutions of `xx̄ ≡ 1` modulo
  `ϖ_v^N` number `2q_v^N`, so `β_v = 2`.
- The normalization uses `q_v`, not `q_v²`: at an inert place and `n = 1`, `β_v = 1 + q_v^{−1}`.
- The counts need an integral form. Over `E_v = ℚ_3(i)` let `L = O_E` with `h(x, y) = x̄y/3`. The
  elements `1` and `1 + 3^N` have the same class modulo `3^N End(L)`, but `h(1, 1) − h = 0` while
  `h(1 + 3^N, 1 + 3^N) − h = 2·3^{N−1} + 3^{2N−1}` has valuation `N − 1`: the congruence of (a) is not a
  condition on classes. By the definition through `3h = ⟨1⟩`, `β_3(L) = 3^{−1}·(1 + 3^{−1}) = 4/9`, and
  through `9h = ⟨3⟩` (whose counts modulo `27` give `4`) the same `3^{−2}·4 = 4/9`.
- The norm-maximal `𝔓^{−1}`-modular plane `Oe ⊕ Of`, `h(e, f) = Π^{−1}`, over `ℚ_3(√−3)` (4.4(d)), is not
  integral. `3h` is the `𝔓`-modular plane, with counts `1944` modulo `3` and `157464` modulo `9`,
  normalized `24`; `9h` has `12754584` solutions modulo `9`, normalized `1944 = 3^4·24`. Both give
  `β_3 = 3^{−4}·24 = 3^{−8}·1944 = 8/27`, the value of 6.1a(d)'s Check.

### 6.1a Local densities at good places and at the nondyadic places

*Origin:* published: Gan and Yu (2000), Theorem 7.3, as quoted in Kirschmer (2016), Theorem 4.2.4 and Lemma 4.2.5, and
Hironaka (1998), the local densities `β_v` of unimodular Hermitian lattices at split, unramified and ramified nondyadic
places and of a unimodular lattice plus a modular line at an unramified place; the values of `α_v` in (a) are in the
form of this roadmap; the factors (d) of norm-maximal lattices are adapted from Kirschmer (2016), Lemma 4.2.9,
after Gan, Hanke and Yu (2001): the normalisation (`c_v(V)`, `λ_v`), equivalent to the printed one.

*Method of the formal proof:* for unimodular forms at an unramified or split place, treated together through the
residue algebra (the field of `q_v²` elements, or `k_v × k_v`): every solution of `X^*HX ≡ T` modulo `ϖ_v^N`, for `H`
of rank `n` and `T` of size `k`, has exactly `q_v^{2nk − k²}` lifts modulo `ϖ_v^{N+1}`, the differential
`Y ↦ Y^*HX + X^*HY` being onto the Hermitian matrices over the residue algebra, and the solutions modulo `ϖ_v` are the
orthonormal `k`-frames of a Hermitian space of rank `n`, counted by induction on the rank from the number
`q_v^{2n−1}(1 − (s/q_v)^n)` of vectors of given nonzero norm, `s = −1` for the field and `s = 1` for `k_v × k_v`. The
route written here treats the split place by a separate count of pairs of matrices and quotes the orders of the finite
unitary groups at an inert place.

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §3.2.9 (the local densities `β(L)` by the Jordan type at split
and unramified places, including the unimodular lattices and a unimodular lattice plus a `πO_F`-modular line, and of
the unimodular lattices at ramified places of odd residue characteristic, over a local field of characteristic zero),
for the values of `β_v(L)` in (a), (b) and (c) in characteristic zero.

Prove, over a nonarchimedean local field of
characteristic `≠ 2`:
(a) if `E_v/F_v` is unramified or split and `L_v` is unimodular (every residue characteristic),
`β_v(L) = β_v^⋆ = ∏_{k=1}^{n} L_v(k, η_v^k)^{−1}`, and for unimodular `T` of size `k ≤ n`,
`α_v(L, T) = ∏_{i=n−k+1}^{n} L_v(i, η_v^i)^{−1}`; for `k = 1`, `L_v` unimodular of rank `n ≥ 1` and `ν ∈ O_v ∖ 0` of
valuation `a`, `α_v(L, ν) = (1 − η_v^n q_v^{−n})·Σ_{l=0}^{a}(η_v^n q_v^{1−n})^l`;
(b) if `E_v/F_v` is ramified, `v` nondyadic and `L_v` unimodular, `β_v(L) = q_v^{−n(n−1)/2}· |O(L_v/𝔓L_v)(k_v)|`, with `O` the orthogonal group of the residue form of 4.2(b). Explicitly
`β_v = 2∏_{j=1}^{r}(1 − q_v^{−2j})` for `n = 2r + 1`, and `β_v = 2(1 − χ_v q_v^{−r}) ∏_{j=1}^{r−1}(1 − q_v^{−2j})` for `n = 2r` with `r ≥ 1` (for `n = 0`, `β_v = 1`, the value of the first
formula), where `χ_v = χ_v(L) = 1` if the residue form is split
(hyperbolic) and `−1` if not; it is split iff `(−1)^r det L_v` is a square in `k_v`, that is, iff
`ε(V_v) = 1`;
(c) if `E_v/F_v` is unramified (every residue characteristic) and `L_v = M ⊥ N` with `M` unimodular of
rank `n − 1` and `N` a `ϖ_v`-modular line, `β_v(L) = (q_v + 1)∏_{k=1}^{n−1}(1 − (−q_v)^{−k})`;
(d) let `E_v/F_v` be ramified, `v` nondyadic, and put `c_v(V) = 1/2` for odd `n` and
`c_v(V) = (1 + ε(V_v)q_v^{−n/2})/2` for even `n`, so that `β_v^⋆/β_v(L′) = c_v(V)` for every unimodular
`L′ ⊂ V_v` by (b). If `L_v` is norm-maximal (4.4(d)), it contains a unimodular `L′_v`, and
`λ_v(L) := N(𝔳(L_v))^n·β_v^⋆/β_v(L) = c_v(V)·vol(U(L′_v))/vol(U(L_v))` for any Haar measure on
`U(V)(F_v)`; the volume ratio is `1`, `2/(q_v^{n/2} + 1)` or `(q_v^{n/2} + 1)/(q_v + 1)`, so that
`λ_v(L)` is `1/2` for odd `n`, `q_v^{−n/2}` for even `n` with `ε(V_v) = 1`, and
`q_v^{−n/2}(q_v^n − 1)/(2(q_v + 1))` for even `n` with `ε(V_v) = −1`. In the normalization of
[Kirschmer], Definition 4.2.6, p. 53, larger by `q_v^{n/2}` for even `n` (its `a_p`), these are the
values of its Lemma 4.2.9, pp. 55–56, at the dual `L_v^∨ = ΠL_{−1} ⊥ L_0` of `L_v = L_{−1} ⊥ L_0` (4.4(d)),
which has the stabilizer of `L_v`.
At an inert `v` the value of `α_v(L, T)` in (a) is the self-dual density `Den(⟨1⟩_n, ⟨1⟩_k)` of
GeometryOfNumbersAndQuadraticArithmetic 3.2.4 (`normalizedSiegelPolynomial`).

Route: (a) at an unramified place, smoothness of the Gram map at unimodular points, including dyadic
places (GeometryOfNumbersAndQuadraticArithmetic `primitive_hermitian_smooth_count`), reduces the count
to the embedding counts of GeometryOfNumbersAndQuadraticArithmetic 3.1.3 over `k_{E_v}/k_v`
(`|U_n(k_v)|/|U_{n−k}(k_v)|`; `|U_n(k_v)|` for `k = n`, 1.5). At a split place the residue algebra is
`k_v × k_v` and that count does not apply: `L_v = (Λ, Λ^*)` (2.3), and in dual bases the Gram map is
`(X_1, X_2) ↦ X_2^tX_1` on pairs of `n × k` matrices over `O_v`, with `T = (T_1, T_1^t)`,
`T_1 ∈ GL_k(O_v)` (`H = 1`, 4.7(a′)). Every solution has `X_1` injective modulo `ϖ_v`, where the
differential `(Y_1, Y_2) ↦ X_2^tY_1 + Y_2^tX_1` is onto `M_k(O_v)`, so each solution modulo `ϖ_v` has
`q_v^{(N−1)(2nk−k²)}` lifts modulo `ϖ_v^N`. Modulo `ϖ_v` there are `∏_{i<k}(q_v^n − q_v^i)` injective
`X_1`, and for each the `X_2` form an affine space of dimension `nk − k²`: in all
`|GL_n(k_v)|/|GL_{n−k}(k_v)|` solutions (the orbit of one under `GL_n(k_v)`, with stabilizer
`GL_{n−k}(k_v)`), and `q_v^{−(2nk−k²)}|GL_n(k_v)|/|GL_{n−k}(k_v)| = ∏_{i=n−k+1}^{n}(1 − q_v^{−i})`, the
stated value, as `L_v(i, η_v^i) = (1 − q_v^{−i})^{−1}` at a split place for every `i`. For `k = 1` and `v(ν) = a`, write
a solution as `ϖ_v^lx′` with `x′ ∉ ϖ_vL_v` and `2l ≤ a`; the Gram map is smooth at `x′`, and the residue counts of the
nonzero `x′` (normalized: `1 − η_v^nq_v^{−n}` for a unit value, `(1 − η_v^nq_v^{−n})(1 + η_v^nq_v^{1−n})` for the value
`0`), weighted by `q_v^{2l(1−n)}`, sum to the stated value. (b) the
differential `Z ↦ Z + Z^*` of `X ↦ X^*HX` is onto `Herm_n(O_{E_v})` because `2` is a unit; the stabilizer scheme `X^*HX = H` is smooth, with
special fibre an extension of the orthogonal group of the residue form by a vector group of dimension
`n(n+1)/2` (`n² = n(n−1)/2 + n(n+1)/2`), as in [GanYu], Theorem 7.3 (quoted in [Kirschmer],
Theorem 4.2.4 and Lemma 4.2.5, pp. 52–53); count its points modulo `ϖ_v^N`. (c) in block
form `X = [[A, b], [c, d]]` for `L_v = M ⊥ O e`, `h(e, e) = ϖ_v`, the equations force
`b = −ϖ_v(A^*)^{−1}c^* d`, `A^*A = 1 − ϖ_v c^*c` (a unimodular form of rank `n − 1`) and `dd̄` determined
modulo `ϖ_v^{N−1}`; for `N ≥ 2`, modulo `ϖ_v^N`, `c` is free (`q_v^{2N(n−1)}` choices), `A` has
`|U_{n−1}(k_v)| q_v^{(N−1)(n−1)²}` and `d` has `(q_v + 1)q_v^N` (a unit norm prescribed modulo
`ϖ_v^{N−1}`: `(q_v + 1)q_v^{N−2}` classes modulo `ϖ_v^{N−1}`, each with `q_v²` lifts), so the normalized
count is constant from `N = 2` on; at `N = 1` the condition on `dd̄` is empty, `d` has `q_v²` values,
and the count `q_v^{2(n−1)}|U_{n−1}(k_v)|q_v²` has not yet stabilized. The group orders used in (b)–(d):
`|U_m(k_v)|` is 1.5; `|SO^±_m(k_v)|` (both parities of `m`, split and nonsplit) is
GeometryOfNumbersAndQuadraticArithmetic §3.3 `finiteOrthogonalOrder`, and `|O^±_m(k_v)| = 2|SO^±_m(k_v)|`
for `m ≥ 1` because `q_v` is odd and the determinant maps `O^±_m(k_v)` onto `{±1}` (`O_0 = SO_0` is
trivial); `|Sp_{2m}(k_v)|` is
AdelicAlgebraicGroups §2.4 (orders of connected reductive groups over finite fields). (d) For `n = 0`,
`L = 0` is unimodular, `U(V)` is trivial and `λ_v(L) = c_v(V) = 1`, the value `q_v^{−n/2}` of the
statement, with volume ratio `1`; the counts below are not used there (the zero quadratic space has one
maximal totally isotropic subspace, while `2∏_{i=1}^{m−1}(q_v^i + 1)` gives `2` at `m = 0`). Let `n ≥ 1`,
and write `L = L_{−1} ⊥ L_0` (4.4(d)), `2m` the rank
of `L_{−1}`, so `n = 2m + 1`, `2m` (with `m ≥ 1`) or `2m + 2` in the three cases. The unimodular lattices between
`L^∨ = ΠL_{−1} ⊥ L_0` and `L` are the preimages of the Lagrangians of the symplectic `k_v`-space
`L/L^∨ = L_{−1}/ΠL_{−1}` (the form `Πh` modulo `𝔓`, alternating as `Π̄ = −Π`); fix one, `L′`. The
norm-integral overlattices of `L′` are the `L′ + Π^{−1}W̃` for totally isotropic `W ⊆ L′/ΠL′` (the
residue quadratic space of 4.2(b), of dimension `n`), and the norm-maximal ones correspond to the
maximal `W`, of dimension `m`. `U(L′)` maps onto `O(L′/ΠL′)` (the smooth model of (b) and Hensel) and
so permutes the maximal `W` transitively (Witt's extension theorem over `k_v`, QuadraticFormInvariants
Layer 1); with 4.2(b) this makes `U(L)`
transitive on the Lagrangians. Hence `[U(L′) : U(L′) ∩ U(L)]` is the number of maximal totally isotropic
subspaces, `∏_{i=1}^{m}(q_v^i + 1)`, `2∏_{i=1}^{m−1}(q_v^i + 1)` or `∏_{i=2}^{m+1}(q_v^i + 1)`, and
`[U(L) : U(L) ∩ U(L′)]` the number of Lagrangians, `∏_{i=1}^{m}(q_v^i + 1)` (counts from the group
orders above). The Haar measures of 6.1(g), defined by the counts in every characteristic `≠ 2` (so
`𝔽_q((t))(√t)` is included), satisfy `β_v(L) = μ_L(U(L))`, `β_v(L′) = μ_{L′}(U(L′))` and
`μ_L = N(𝔳(L_v))^n μ_{L′}` (`𝔳(L′_v) = O_v`); so `λ_v(L) = c_v(V)·μ_{L′}(U(L′))/μ_{L′}(U(L))`, and the two
indices give the ratios and values stated.

*Needs:* 1.5, 2.3, 4.1, 4.2, 4.4, 4.7, 6.1; GeometryOfNumbersAndQuadraticArithmetic 3.1.3,
`primitive_hermitian_smooth_count`, §3.3 `finiteOrthogonalOrder`; AdelicAlgebraicGroups §2.4;
QuadraticFormInvariants Layer 1.

**Checks.**

- `E_3 = ℚ_3(√−3)`: `β_3(⟨1⟩) = 2`, `β_3(⟨1, 1⟩) = |O_2^−(𝔽_3)|/3 = 8/3`,
  `β_3(⟨1, 2⟩) = |O_2^+(𝔽_3)|/3 = 4/3`, `β_3(⟨1, 1, 1⟩) = 2(1 − 1/9) = 16/9`. The values in rank two are
  the stabilized counts `216, 17496` and `108, 8748` of (a) modulo `3` and `9`.
- At the inert prime `2` of `ℚ(√−3)`, `β_2(⟨1⟩ ⊥ ⟨2⟩) = 9/2` by (c) with `q = 2`, `n = 2`, and
  `β_2(⟨1, 1⟩) = |U_2(𝔽_2)|/16 = 9/8` by (a). Enumerating the matrices for `⟨1, 2⟩` gives `48` modulo `2`
  (`4·3·4`, normalized `3`: not yet stable), `1152 = 16·6·12` modulo `4` and `18432 = 64·12·24` modulo `8`,
  both normalized `9/2`; the formula `(q + 1)q^N` for `d` at `N = 1` would give `72`.
- (c) with `n = 1` gives `q_v + 1 = q_v·β_v^⋆`: the rank-one lattice `⟨ϖ_v⟩` has the stabilizer of
  `⟨1⟩` and a different fibre measure, because `Φ_h` depends on `h`.
- (d) for `n = 2` and `ε(V_v) = 1`: the `𝔓^{−1}`-modular plane has `β_v = q_v^{−1}(1 − q_v^{−2})`, which is
  `8/27` at `q_v = 3`, and `λ_v = q_v^{−2}(1 − q_v^{−2})/β_v = 1/3`; the indices are `2` and `q_v + 1`,
  and `c_v(V)·2/(q_v + 1) = q_v^{−1}`. For `n = 2` and `ε(V_v) = −1` the norm-maximal lattice is
  unimodular and `λ_v = c_v(V) = (1 − q_v^{−1})/2`.
- Equal characteristic, `F_v = 𝔽_3((t))`, `E_v = F_v(√t)` (ramified, `q_v = 3`, `O_{E_v}/t^N = 𝔽_3[s]/s^{2N}`,
  `s̄ = −s`): the counts of 6.1(a) modulo `t` and `t²` give `β_v(⟨1⟩) = 2` (`6`, `18`), `4/3` for the
  unimodular hyperbolic plane (`108`, `8748`), `8/3` for `⟨1, 1⟩` (`216`, `17496`) and `24` for the
  `𝔓`-modular plane `h(e, f) = s` (`1944`, `157464`), the values over `ℚ_3(√−3)`; so by 6.1(g) the
  `𝔓^{−1}`-modular plane has `β_v = 3^{−4}·24 = 8/27` and `λ_v = 1/3`, as in characteristic zero.
- At a split place (a) is not the unitary count: for `q_v = 3`, `n = 3`, `k = 1`, `T = 1` the solutions
  of `⟨x_1, x_2⟩ = 1` in `k_v^3 × k_v^3` number `234 = 26·9 = |GL_3(𝔽_3)|/|GL_2(𝔽_3)|`, so
  `α_v = 234/3^5 = 1 − 3^{−3}`, while `|U_3(𝔽_3)|/|U_2(𝔽_3)| = 252 = 28·9` gives the inert value
  `252/3^5 = 1 + 3^{−3}`. Brute-force counts at split places modulo `ϖ_v` and `ϖ_v²`: `8/9` (`n = 2`,
  `k = 1`, `q_v = 3`), `7/8` (`n = 3`, `k = 1`, `q_v = 2`), `21/32 = (1 − 2^{−3})(1 − 2^{−2})` (`n = 3`,
  `k = 2`, `q_v = 2`).

### 6.1b Archimedean densities

*Origin:* adapted from Braun (1941), the archimedean densities of positive Hermitian forms over an imaginary quadratic
field, Shimura (1997), and Siegel (1935–1937) for the quadratic original: here the closed formulas for `β_∞(L)` and
`α_∞(L, T)` over a CM field in this roadmap's normalization, for lattices that need not be free, this roadmap's own
computation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `V` be totally definite over a CM extension `E/F` with `d = [F : ℚ]`. Prove that
`β_∞(L) = ((2π)^{n(n+1)/2}/∏_{j=1}^{n} (j − 1)!)^d·|d_F|^{n/2}·|d_E|^{−n(n+1)/4}·N(𝔳(L))^{−n}`, and,
if `V` is totally positive definite, for a totally positive definite `T ∈ Herm_k(E)`, `k ≤ n`,
`α_∞(L, T) = ((2π)^{nk − k(k−1)/2}/∏_{j=0}^{k−1} (n − j − 1)!)^d·N_{F/ℚ}(det T)^{n−k}· |d_F|^{k/2}·|d_E|^{−(nk − k(k−1)/2)/2}·N(𝔳(L))^{−k}`.

Route: at each real place, in orthonormal coordinates, the push-forward of Lebesgue measure on
`M_{n×k}(ℂ)` under `X ↦ X^*X` is `π^{nk − k(k−1)/2}/∏_{j=0}^{k−1} Γ(n − j)·det(T)^{n−k} dT`; this is
the Hermitian Gaussian integral `∫ e^{−π tr X^*X} dX = 1` combined with the complex matrix Gamma
function `∫_{T>0} e^{−tr T} det(T)^{s−k} dT = π^{k(k−1)/2}∏_{j=0}^{k−1}Γ(s − j)`. The lattice
normalizations contribute `covol(Herm_k(O_E))/covol(Hom(O_E^k, L))`, with `covol(O_F) = |d_F|^{1/2}`,
`covol(O_E ⊂ ℂ^d) = 2^{−d}|d_E|^{1/2}` and `covol(L) = (2^{−d}|d_E|^{1/2})^n N(𝔳(L))`; this uses
`Hom(O_E^k, L) = L^k` and `Herm_k(O_E)` and holds for every `L`. For `β_∞`, first let `L_0` be free
with basis `B` (the `O_E`-span of an `E`-basis of `V`): identifying `End(V)` with `Hom(E^n, V)` and
`Herm(V)` with `Herm_n(E)` through `B` carries `End(L_0)`, `Herm(L_0)` to `Hom(O_E^n, L_0)`,
`Herm_n(O_E)` and `Φ_h` to `X ↦ T_X`, so `β_∞(L_0) = α_∞(L_0, T_B)`, the case `k = n` of the second
formula, which is the first. A lattice `L` need not be free (its Steinitz class may be nontrivial),
and a basis is not available; compare it with `L_0` instead. At each finite `v`, `L_v = g_vL_{0,v}`
with `g_v ∈ GL_{E_v}(V_v)`, `End(L_v)` and `End(L_{0,v})` have equal volume, and
`vol(Herm(L_v))/vol(Herm(L_{0,v})) = N(𝔳(L_v)𝔳(L_{0,v})^{−1})^n` (route of 6.1(g)); so in
`End(V) ⊗_F F_∞` and `Herm(V) ⊗_F F_∞`, `covol(End(L)) = covol(End(L_0))` and
`covol(Herm(L)) = N(𝔳(L)𝔳(L_0)^{−1})^{−n}covol(Herm(L_0))`. The Haar measure giving `Herm(L)` covolume
one is therefore `N(𝔳(L)𝔳(L_0)^{−1})^n` times that for `L_0`, the fibre measure normalized by `L` is
`N(𝔳(L)𝔳(L_0)^{−1})^{−n}` times that normalized by `L_0`, and
`β_∞(L) = N(𝔳(L)𝔳(L_0)^{−1})^{−n}β_∞(L_0)`, which is the first formula. At a real place
where `V` is negative definite, the fibre of `Φ_h` over `h` is the fibre of `Φ_{−h}` over `−h`, and
`S ↦ −S` preserves the Haar measure of the Hermitian forms, so the local factor of `β_∞(L)` does not
depend on the sign.

*Needs:* 4.0, 6.1; Mathlib `MeasureTheory.Measure.addHaar`, `Complex.Gamma`.

**Checks.**

- `F = ℚ`, `E` imaginary quadratic of discriminant `d_E`, `D = |d_E|`, `L = O_E^n` standard:
  `α_∞(L, T) = (2π/√D)^{nk − k(k−1)/2} det(T)^{n−k}/∏_{j=0}^{k−1}(n − j − 1)!`; for `E = ℚ(√−3)`
  (`D = 3`), `n = 2`, `k = 1`, `T = 1` this is `4π²/3`.
- `n = 1`, `F = ℚ`: `β_∞ = 2π/√|d_E|` is the volume of `U(1)(ℝ) = S¹` for the measure normalized by
  `O_E` and `ℤ`; for `ℤ[i]` (`|d_E| = 4`, not the radicand `1`) it is `π`, the fibre of `x² + y²` over
  `1` for `dx dy`, which gives `ℤ[i]` covolume one.
- A lattice that is not free: over `E = ℚ(√−15)` (class number `2`; `2` splits) let `P` be a prime above
  `2`, not principal (`a² + 15b² = 8` has no solution), as a lattice in `V = E` with `x̄y`. Then
  `End(P) = O_E` and `Herm(P) = {s ∈ ℚ : s·PP̄ ⊆ O_E} = (1/2)ℤ` (`PP̄ = 2O_E`), against `ℤ` for `O_E`; so
  `β_∞(P) = β_∞(O_E)/2 = π/√15`, the formula with `N(𝔳(P)) = 2`, although `P` and `O_E` have the same
  stabilizer in `U(V)(ℝ)`. Taking `β_∞(P) = β_∞(O_E)` because the stabilizers agree would halve
  `mass(P)` in 6.3 (Checks there).

### 6.1d Local densities by discriminant forms

*Origin:* adapted from Gan and Yu (2000), Theorem 7.3 (Kirschmer (2016), Theorem 4.2.4 and Lemma 4.2.5), and Hironaka
(1998), the local density of an integral Hermitian lattice at split and unramified places through its Jordan type:
here through the isometry group of its discriminant form, with (a)–(c) and (e) in this roadmap's own formulation. (a)
and the formula `β_v(L) = #O(A_{L_v})·β_v^⋆(n − t(L_v))` of (d) are what [FormalProof] has, in a diagonal basis.

*Method of the formal proof:* in a diagonal basis with Gram matrix `H`, modulo `𝔭^N`: the solutions of `X^*HX = H` map
onto `O(A_L)`, each isometry of the discriminant module being corrected to an exact solution, with kernel the
solutions `1 + YH`; and the equation `Y + Y^* + Y^*HY = T` has the same number `q_v^{n²N}·β_v^⋆(n − t(L_v))` of
solutions for every Hermitian `T ≡ 0`, by induction on `N` from a count modulo `𝔭`, which gives
`β_v(L) = #O(A_{L_v})·β_v^⋆(n − t(L_v))`. The route written here shows that `Y ↦ Y + Y^* + Y^*HY` carries Haar measure
to Haar measure through a distance-preserving bijection of `M_n(O_{E_v})`, and treats the unimodular part by the product
formula (c).

*Corollary of:* GeometryOfNumbersAndQuadraticArithmetic §3.2.9 (a) (at split and unramified places of a local field of
characteristic zero, `β(L) = q^{w(L)}∏_{i ≥ 0} β^⋆(n_i)` for the Jordan type `(a_i, n_i)`), for the explicit formula
for `β_v(L)` in (d) in characteristic zero.

Let `F_v` be a nonarchimedean local field of characteristic `≠ 2` at which `Tr(O_{E_v}) = O_v`, that
is, `v` is split, unramified (every residue characteristic) or ramified and nondyadic, and put
`β_v^⋆(m) = ∏_{k=1}^{m} L_v(k, η_v^k)^{−1}` (Conventions). Let `L_v ⊂ V_v` be an integral lattice of rank
`n` and `L_v = L_0 ⊥ L′` with `L_0` unimodular of rank `n_0 = n − t(L_v)` and `s(L′) ⊆ 𝔓` (group a
Jordan splitting, 4.1). Prove:
(a) `ρ_L : U(L_v) → O(A_{L_v})` (4.8(a)) is surjective.
(b) If `s(L_v) ⊆ 𝔓` (that is, `n_0 = 0`), then `β_v(L) = #O(A_{L_v})`. More precisely, the normalized
count of 6.1(a) restricted to `X ∈ 1 + Hom(L_v^∨, L_v)` (the `X` acting trivially on `A_{L_v}`) tends to
`1`, so that in characteristic zero `ker ρ_L` has fibre measure `1` (6.1(f)).
(c) `β_v(L_0 ⊥ L′) = β_v(L_0)·β_v(L′)`; hence `β_v(L) = #O(A_{L_v})·β_v(L_0)` for every integral `L_v`.
(d) If `v` is split or unramified,
`β_v(L) = #O(A_{L_v})·β_v^⋆(n − t(L_v))`,
which contains the formula for `β_v` of 6.1a(a) (`t(L_v) = 0`) and 6.1a(c) (`A_{L_v} = k_{E_v}` with the
form `ϖ_v^{−1}x̄y`, `#O = q_v + 1`). Explicitly, for the Jordan type `(a_i, n_i)_{0 ≤ i ≤ m}`,
`0 = a_0 < a_1 < ⋯ < a_m` (`n_0 = 0` allowed), and `w(L) = Σ_{i,j} min(a_i, a_j)n_in_j`,
`#O(A_{L_v}) = q_v^{w(L)}∏_{i ≥ 1}β_v^⋆(n_i)` and `β_v(L) = q_v^{w(L)}∏_{i ≥ 0}β_v^⋆(n_i)`;
at a split place `#O(A_{L_v})` is the number of automorphisms of the finite `O_v`-module
`⊕_{i ≥ 1}(O_v/ϖ_v^{a_i})^{n_i}` (4.8(c)). In characteristic zero the formula for `β_v(L)` is
[GanYu], Theorem 7.3, quoted in [Kirschmer], Theorem 4.2.4 and Lemma 4.2.5, pp. 52–53.
(e) If `v` is ramified and nondyadic, `β_v(L) = #O(A_{L_v})·q_v^{−n_0(n_0−1)/2}·|O(L_0/𝔓L_0)(k_v)|`, the
last factors being `β_v(L_0)` of 6.1a(b). The factor depends on the residue form of `L_0`, not only on
`n_0`, and the formula of (d) is false at these places.
At a dyadic ramified place (b) fails (Checks).

Route: (a) `A_L = A_{L′}` and `U(L′) × U(L_0) ⊆ U(L)`, so assume `L = L′`, that is `L ⊆ 𝔓L^∨`. Lift
`γ ∈ O(A_L)` to an `O_E`-linear `g_0 : L^∨ → L^∨` (`L^∨` is free); `g_0(L) ⊆ L`, `g_0` is onto modulo
`𝔓L^∨ ⊇ L`, hence bijective (Nakayama), and it restricts to an automorphism of `L`. Its defect
`S = h(g_0·, g_0·) − h` is integral on `L^∨` because `γ` preserves `b_L`. In a basis of `L` with Gram
matrix `H` (so `H ≡ 0 mod 𝔓`) and the dual basis of `L^∨` (Gram matrix `H^{−1}`), look for
`k = 1 + HY ∈ 1 + Hom(L^∨, L)` with `k^*(H^{−1} + S)k = H^{−1}`: this is
`Y + Y^* + Y^*HS + SHY + Y^*HY + Y^*HSHY = −S`, whose linear part `Y ↦ Y + Y^*` maps `M_n(O_E)` onto
`Herm_n(O_E)` because `Tr` is onto, the other terms being divisible by `𝔓`; Hensel's lemma solves it, and
`g = g_0k ∈ U(L)` induces `γ`. (b) For `N ≥ 2a_m` the solutions of the congruence of 6.1(a) modulo `ϖ^N`
form a group (their determinants are units), which acts on `A_L` preserving `b_L` and, by (a), maps onto
`O(A_L)`; its kernel consists of the solutions in `1 + Hom(L^∨, L) = 1 + M_n(O_E)H`. For `X = 1 + YH`,
`h(X·, X·) − h` has Gram matrix `H(Y + Y^* + Y^*HY)H`. The map `Ψ(Y) = Y + Y^* + Y^*HY` carries the Haar
measure of `M_n(O_E)` to that of `Herm_n(O_E)`: choose `τ ∈ O_{E_v}` with `τ + τ̄ = 1` (`Tr` is onto) and
write `Ψ = λ ∘ φ` with `φ(Y) = Y + τY^*HY` and `λ(W) = W + W^*` (`Y^*HY` is Hermitian). For
`Δ = Y − Y′`, `φ(Y) − φ(Y′) = Δ + τ(Δ^*HY + Y′^*HΔ)`, and `H ≡ 0 mod 𝔓`, so `φ` preserves the distance
of `M_n(O_E)` (the largest absolute value of the entries); a distance-preserving map of this compact
set into itself is a bijection that preserves its Haar measure. `λ` is `O_v`-linear and onto
`Herm_n(O_E)` because `Tr` is onto. (A unit differential at every point would not suffice:
`y ↦ y^p − y` on `ℤ_p` has one and maps `ℤ_p` into `pℤ_p`.) The substitutions `Y ↦ YH` on `M_n(E)` and `S ↦ HSH` on
`Herm_n(E)` both have modulus `|N_{E/F}(det H)|^n`; so the normalized count of the kernel is `1`.
(c) In a basis adapted to `L_0 ⊥ L′`, with Gram matrices `H_0` (unimodular) and `H′ ≡ 0 mod 𝔓`, write
`X = [[G, B], [C, D]]`; modulo `ϖ^N` the congruences are `G^*H_0G + C^*H′C = H_0`,
`G^*H_0B + C^*H′D = 0` and `B^*H_0B + D^*H′D = H′`. The first forces `G` invertible. For each of the
`q_v^{2Nn_0(n−n_0)}` matrices `C`, `H_0 − C^*H′C` is unimodular and congruent to `H_0` modulo `𝔓`, hence
`g^*H_0g` for some `g` (Hensel, `Tr` onto), so `G` has as many solutions as for `C = 0`;
`B = −(G^*H_0)^{−1}C^*H′D` is determined; and the last congruence becomes `D^*H″D = H′` with
`H″ = H′ + H′C(H_0 − C^*H′C)^{−1}C^*H′`, which differs from `H′` by `H′·Herm_n(O_E)·H′` and is therefore
`g′^*H′g′` with `g′ ∈ 1 + Hom(L′^∨, L′)` (the lifting step of (a)); so `D` has as many solutions as
for `C = 0`. The counts multiply. With (b) for `L′` and `A_L = A_{L′}` this is the second formula.
(d) `β_v(L_0) = β_v^⋆(n_0)` is 6.1a(a). For the explicit form, the congruence of 6.1(a) for `ϖ^ah` modulo
`ϖ^N` is that for `h` modulo `ϖ^{N−a}`, so `β_v` of a rank-`r` lattice with form `ϖ^ah` is `q_v^{r²a}`
times that for `h` (6.1(a)); apply this to `L′ = ⊥_{i ≥ 1}L_i` with `a = a_1`, then (c) to split off the
unimodular `ϖ^{−a_1}L_1`, and induct on `m`, using `min(a_i, a_j) = a_1 + min(a_i − a_1, a_j − a_1)` for
`i, j ≥ 1`. (e) 6.1a(b) for `β_v(L_0)`.

*Needs:* 4.0, 4.1, 4.8, 6.1, 6.1a.

**Checks.**

- Inert `v` with `q_v = 2` (`ℚ_2(√−3)`, residue field `𝔽_4`), `L = ⟨1⟩ ⊥ ⟨2⟩ ⊥ ⟨4⟩`:
  `A_L = O_E/2 ⊕ O_E/4`, `#O(A_L) = 72 = 2^5·(3/2)²` by enumerating the images of two generators, while
  the module has `576` automorphisms. The normalized counts of 6.1(a) modulo `8` and `16` are both `108`,
  which is `72·β^⋆(1) = 72·(3/2)` and `2^5·(3/2)³`; replacing `#O(A_L)` by the number of module
  automorphisms, or `β^⋆(n − t(L_v))` by `β^⋆(n)`, gives `864` or `729/8`.
- Inert `v` with `q_v = 3` (`ℚ_3(i)`): `β_3(⟨3, 9⟩) = 432 = #O(A)` (counts modulo `27`);
  `β_3(⟨1, 3, 3⟩) = 128 = |U_2(𝔽_3)|·(4/3) = 96·(4/3)` and `β_3(⟨1, 1, 3⟩) = 128/27 = 4·(4/3)(8/9)`
  (counts modulo `9`).
- `t(L_v)` counts the constituents of positive scale with their ranks. Over `ℚ_3(i)`, `L = ⟨3, 3⟩` has one
  constituent of positive scale, of rank two: `t(L_v) = 2`, the corank of `diag(3, 3)` modulo `3`, and
  `A_L = 𝔽_9²` with `O(A_L) = U_2(𝔽_3)` of order `96`. The normalized counts modulo `9` and `27` are `96`
  (`81` modulo `3`, not yet stable), which is `96·β_3^⋆(0)`; the number of constituents of positive scale
  in place of `t(L_v)` would give `96·β_3^⋆(1) = 128`.
- Split `v`, `p = 3`: `β_3(⟨3, 9⟩) = 108`, the number of automorphisms of `ℤ/3 ⊕ ℤ/9`, and
  `β_3(⟨1, 9⟩) = 4 = 6·(2/3)`; for `p = 2`, `β_2(⟨1, 2, 4⟩) = 4 = 8·(1/2)`, `8` being the number of
  automorphisms of `ℤ/2 ⊕ ℤ/4`.
- Ramified `ℚ_3(√−3)`: the `𝔓`-modular plane `Oe ⊕ Of`, `h(e, f) = √−3`, has `A = k_E²` with an
  alternating form and `β_3 = 24 = |SL_2(𝔽_3)| = #O(A)`, and `⟨1⟩` ⊥ this plane has `β_3 = 48 = 2·24`;
  `⟨1, 3⟩` has `β_3 = 12 = β_3(⟨1⟩)·#O(A) = 2·6`, while `#O(A)·β_3^⋆(1) = 6` (`β_3^⋆(1) = 1` at a ramified
  place).
- Dyadic ramified `ℚ_2(i)`: `⟨2⟩` has `A = O_E/2O_E`, whose only units `1, i` both have norm `1`, so
  `#O(A) = 2`, but `β_2(⟨2⟩) = 4` (the counts modulo `2^N`, `N = 3, …, 6`, are `2^{N+2}`): (b) fails
  where `Tr(O_E) = 2ℤ_2`.

### 6.2 The mass formula

*Origin:* adapted from Kirschmer (2016), Theorem 4.2.3, after Gan and Yu (2000), §10, and Shimura (1997), the mass
formula for integral lattices in totally definite Hermitian spaces, and from Weil (1961), the Tamagawa number `2` of
unitary groups, which gives the covolume form (b) for every signature: the normalisation of the local factors, with the
convergence factors `L_v(1, η_v)` and the densities of 6.1, for every lattice. The compact-dual form (c), with the
independence of the signature, is particular to this proof.

*Method of the formal proof:* in the definite case the adelic quotient is cut into the double cosets of the class set,
so that its volume is the mass of the genus, and the genus is that of `O_E^n` because the space has an orthonormal basis
and its self-dual lattices form one genus; the other signatures follow by induction on the number of negative
directions, since the ratio of 6.4 for a vector of norm `±1` depends only on the rank. The route written here deduces
(a) and (b) from the Tamagawa number `2` (6.0b) and the local densities, and (c) from (a) and (b).

Prove: (a) let `F` be totally
real, `E/F` a CM extension, `V` totally definite of dimension `n ≥ 1` and `L` a lattice in `V`; then
`mass(L) = 2·L(1, η)·β_∞(L)^{−1}·∏_{v<∞} (L_v(1, η_v) β_v(L))^{−1}`,
the product being absolutely convergent. (b) For a quadratic extension `E/F` of number fields, every
Hermitian space `V` of dimension `n ≥ 1` (no condition on signatures) and every lattice `L ⊂ V`,
`Σ_{[M] ∈ cls(L)} vol(U(M)\U(V)(F_∞)) = 2·L(1, η)·∏_{v<∞} (L_v(1, η_v)β_v(L))^{−1}`,
for the archimedean fibre measure on `U(V)(F_∞)` (6.1(f)), `U(M)` acting on `U(V)(F_∞)` through
`U(V)(F) ⊂ U(V)(F_∞)`; for totally definite `V`, `vol(U(M)\U(V)(F_∞)) = β_∞(L)/|U(M)|` and (b) is (a).
For integral `L`, (a) is the mass formula of [Kirschmer], Theorem 4.2.3, p. 51, written there without
the convergence factors `L_v(1, η_v)` and with `β_∞(L)` evaluated as in 6.3; its proof there refers to
[GanYu], §10. For `F = ℚ`, `E` imaginary quadratic of class number one and `L` unimodular, (a) contains the mass
formula that AbelianSchemesAndArithmeticModuliPartII F5.7 states for that case, with its local factors at the ramified
places, dyadic ones included, in the normalisation of 6.1.

(c) *The form of the formal proof: compact-dual normalisation.* Let `E/F` be a CM extension unramified at every finite
place, `V` a Hermitian space of dimension `n ≥ 1` with the same signature `(p, q)` at every real place, and `L ⊂ V` a
unimodular lattice. Then `Σ_{[M] ∈ cls(L)} μ^c(U(M)\U(V)(F_∞)) = mass(O_E^n)` for the compact-dual measure `μ^c` of the
Conventions, `mass(O_E^n)` being the mass of the unimodular lattices of rank `n` of 6.3(c); in particular the left side
does not depend on `(p, q)`. The formal proof has (c) in place of (b), and (a) in the form given in 6.3. The fibre
measure of (b) is `β_∞(L)·μ^c`, with `β_∞(L)` the value of the formula of 6.1b, so (c) follows from (b) and (a).
The independence of `(p, q)` is [FormalProof], `Formalism/LocalToGlobal/GlobalTheory/GL5/PNamed.lean`
(`Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.VolSigIndep`); for the ratio of the covolumes of a space and of the
orthogonal complement of a vector of norm `±1` (6.2 (c) with 6.4 (b)),
[FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/ThickPlacesCorollaryOfAnyTranslate.lean`
(`Formalism.MainNotions.StandardLattice.VolumeRatio₂`),
`Formalism/SharpRestriction/GlobalSchurBounds/MassRatioUnfoldedOfTheoremTwo.lean` (`Formalism.MainNotions.RT.MassRatioUnderVolume`).

Route: (a) by 5.5, `τ(U(V)) = mass(L)·vol(U(V)(F_∞) × K_L)` for the Tamagawa measure. The lattice
normalized measures on `End(V)_𝔸` and `Herm(V)_𝔸` are the Tamagawa measures of these vector groups
(volume one modulo rational points), and the gauge form `dX/dS` of the fibration `X ↦ h(X·, X·)`
(6.1(f)) is rational and invariant under left multiplication by `U(V)` (OrbitMeasuresOnAdelicGroups §2.6
*homogeneous-gauge-measure* (iv), as in 6.1(f)), so the Tamagawa measure of `U(V)` is
`L(1, η)^{−1}∏_v L_v(1, η_v)·(dX/dS)_v` (AdelicAlgebraicGroups §2.4, *convergence-factors* and the
independence of the gauge form; the local constants multiply to `|d_F|^{−dim U(V)/2}` by
OrbitMeasuresOnAdelicGroups §2.6 *homogeneous-gauge-measure* (iv)). Its
value on `U(V)(F_∞) × K_L` is `L(1, η)^{−1}β_∞(L)∏_v L_v(1, η_v)β_v(L)` by 6.1 and 6.1b. With
`τ(U(V)) = 2` (6.0b) this is the formula. Absolute convergence: `L_v(1, η_v)β_v(L) = ∏_{k=2}^{n} L_v(k, η_v^k)^{−1}` for almost all `v` (6.1a(a)). (b) the component decomposition
`⊔_{[g]} Γ_g\U(V)(F_∞) ≅ U(V)(F)\U(V)(𝔸)/K_L` over the finite class set (AdelicAlgebraicGroups §3.4,
with 5.1 and 5.2(a)), `Γ_g = U(V)(F) ∩ gK_Lg^{−1} = U(g·L)` acting freely on `U(V)(F_∞)`, gives
`vol(U(V)(F)\U(V)(𝔸)) = Σ_{[g]} vol(Γ_g\U(V)(F_∞))·vol(K_L)` for every Haar measure; with the
Tamagawa measure written as in (a) and `τ(U(V)) = 2` this is the formula. (c): both measures are Haar measures, and
the lattice normalizations depend on `L` only through `𝔳(L)` (route of 6.1b), in the same way for every `(p, q)`. At a
real place, in a basis with Gram matrix `H = I_{p,q}`, the differential of `X ↦ X^*HX` at `1` vanishes on `𝔲(p, q)`
and is `Z ↦ 2HZ` on `i𝔲(p, q)`; left multiplication by `H` preserves Lebesgue measure of `M_n(ℂ)`, commutes with `i`
and carries `𝔲(p, q)` onto `𝔲(n)` and `i𝔲(p, q)` onto `Herm_n`, so it carries `λ` to `λ`, and the density at `1` of the
fibre measure with respect to `λ` is the same for every `(p, q)`. In the definite case `μ^c` has mass one, so the
fibre measure is `β_∞(L)·μ^c` for every `(p, q)`, and the left side of (c) is the right side of (b) divided by
`β_∞(L)`. For unimodular `L`, `𝔳(L) = O_F` and `L_v(1, η_v)β_v(L) = ∏_{k=2}^{n} L_v(k, η_v^k)^{−1}` at every finite
`v` (6.1a(a)), as for `O_E^n ⊂ ⟨1, …, 1⟩`; so this quotient is the right side of (a) for `O_E^n`, `mass(O_E^n)`.

*Needs:* 5.1, 5.2, 5.5, 5.6, 6.0b, 6.1, 6.1a, 6.1b; AdelicAlgebraicGroups §§2.2, 2.4 and OrbitMeasuresOnAdelicGroups §2.6
(*homogeneous-gauge-measure*), 3.4.

**Checks.**

- `n = 1`, `E` imaginary quadratic of odd discriminant `−D` with `t` prime factors: the formula gives
  `2·(√D/2π)·L(1, η)·2^{−t} = h_E/(2^{t−1}|μ(E)|)` by the class number formula, which is the direct
  count of 5.1 (`1/2` for `ℚ(√−15)`, `3/2` for `ℚ(√−23)`).
- The factor `2` is `τ(U(V))`: replacing it by `1` halves every mass and contradicts the first Check.
- (b) for an indefinite space: `F = ℚ`, `E = ℚ(√5)` (the real place splits), `V = ⟨1⟩`, `L = O_E`.
  `U(V)(ℝ) = {(x, x^{−1})} ≅ ℝ^×`, and the archimedean fibre measure is `dx/(√5|x|)` (`O_E` has
  covolume `√5` in `ℝ²`, `Herm(L) = ℤ`, and the fibre of `(x, y) ↦ xy` over `1`). The class set has one
  element: the genus consists of the `𝔞` with `𝔞𝔞̄ = O_E`, which are the `𝔟/𝔟̄`, and `𝔟 = μO_E` as
  `ℚ(√5)` has class number one, so `𝔞 = (μ/μ̄)O_E` with `μ/μ̄ ∈ U(V)(ℚ)`. `U(L) = ±ε^{2ℤ}` is the group of
  units of norm one, the fundamental unit `ε = (1 + √5)/2` having norm `−1`; so the left side is
  `∫_1^{ε²} dx/(√5x) = 2 log ε/√5`. On the right, `L(1, η) = L(1, χ_5) = 2 log ε/√5`, the factors at the
  unramified primes are `1` (6.1a(a)), and at the ramified prime `5` `L_5(1, η_5) = 1` and `β_5 = 2`
  (6.1's first Check); so the right side is
  `2·(2 log ε/√5)·(1/2) = 2 log ε/√5`. With `1` in place of `τ(U(V)) = 2` it would be halved.

### 6.3 The mass formula in closed form

*Origin:* adapted from Shimura (1997), Gan, Hanke and Yu (2001) and Kirschmer (2016), Proposition 4.2.7 (3) and
Lemma 4.2.9, the exact mass formula for unitary groups and the masses of maximal lattices: the normalisation of the
local factors (`β_v^⋆/β_v(L)`, `c_v(V)`, `λ_v`), equivalent to the printed one. The form recorded below as the form of
the formal proof, with an undetermined constant, is particular to this proof.

*Method of the formal proof:* the masses of the lattices `O_E^n` are related by the ratios of consecutive ranks of 6.4
and telescoped down to rank one, whose mass stays an undetermined constant; a self-dual lattice of rank `n`
in a totally positive definite space has the mass of `O_E^n` because the space has an orthonormal basis and the lattice
lies in the genus of `O_E^n`. The route written here substitutes the local and archimedean densities into the mass
formula 6.2.

With the notation of 6.2(a) (so `n ≥ 1`) and `S(L)` the set of finite places at which `E/F` ramifies
or `L_v` is not unimodular, prove that
`mass(L) = 2·|d_F|^{n²/2}·N(𝔡_{E/F})^{n(n+1)/4}·N(𝔳(L))^n·∏_{k=1}^{n} ((k − 1)!/(2π)^k)^d· ∏_{k=1}^{n} L(k, η^k)·∏_{v ∈ S(L)} β_v^⋆/β_v(L)`.
Suppose moreover that no place above `2` ramifies in `E`, and let `c_v(V)` be the factor of 6.1a(d)
(`1/2` for odd `n`, `(1 + ε(V_v) q_v^{−n/2})/2` for even `n`). (a) If `L` is unimodular, the factor at each
ramified `v` is `c_v(V)` and every other place contributes `1`. (b) Let `S_odd(V)` be the set of inert
places at which `val(det V_v)` is odd. If `L` is scale-maximal,
`mass(L) = 2·|d_F|^{n²/2}·N(𝔡_{E/F})^{n(n+1)/4}·∏_{k=1}^{n} ((k − 1)!/(2π)^k)^d· ∏_{k=1}^{n} L(k, η^k)·∏_{v ramified} c_v(V)·∏_{v ∈ S_odd(V)} (q_v^n − (−1)^n)/(q_v + 1)`;
if `L` is norm-maximal, the same holds with `c_v(V)` replaced by the factor `λ_v` of 6.1a(d), which
is `1/2` for odd `n`, `q_v^{−n/2}` for even `n` with `ε(V_v) = 1`, and
`q_v^{−n/2}(q_v^n − 1)/(2(q_v + 1))` for even `n` with `ε(V_v) = −1`. (c) If `E/F` is unramified at
every finite place, every unimodular lattice of rank `n ≥ 1` in a totally definite space over `E` has the
mass `2·|d_F|^{n²/2}∏_{k=1}^{n}((k − 1)!/(2π)^k)^d∏_{k=1}^{n}L(k, η^k)` of `O_E^n`; in the totally
positive definite case these lattices moreover form one genus (5.8(b)). The first formula is
[Kirschmer], Proposition 4.2.7 (3), pp. 54–55, with the local factors arranged differently there
(its `λ(L_v)`).

*The form of the formal proof.* For `E/F` unramified at every finite place, `V` totally positive definite and `L`
integral: there is a constant `c_1 > 0` depending only on `E` such that, for every `n ≥ 1`,
`mass(L) = c_n·N(𝔳(L))^n·∏_{v<∞} β_v^⋆/β_v(L)` with `c_n = c_1·∏_{j=2}^{n}|d_F|^{(2j−1)/2}((j − 1)!/(2π)^j)^d L(j, η^j)`;
`c_n` is the mass of the unimodular lattices of rank `n`. The formal proof does not determine `c_1`: it uses the ratios
`c_n/c_{n−1}` (6.4(b)) and the masses of standard lattices as numbers. In the same setting it has (b) for the maximal
integral lattices `M` in the form `mass(M) = c·∏_{v ∈ S_odd(V)}(q_v^n − (−1)^n)/(q_v + 1)` with a constant `c > 0` that
it does not determine (the mass of the unimodular lattices of rank `n` when `V` contains one), and (c) in the form:
every unimodular lattice of rank `n` has the mass of `O_E^n`. The first formula implies the first form, with
`c_1 = 2·|d_F|^{1/2}(2π)^{−d}L(1, η)`; (b) and (c) imply the other two. The form of (c) is [FormalProof],
`Formalism/LocalToGlobal/GlobalTheory/GL5/DiscreteSeriesOfFormalDegree.lean`
(`Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.GenusMassAt`, `Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.ClassItemsAt`).

Route: substitute 6.1b into 6.2: `|d_F|^{−n/2}|d_E|^{n(n+1)/4} = |d_F|^{n²/2}N(𝔡_{E/F})^{n(n+1)/4}`;
off `S(L)`, `(L_v(1, η_v)β_v)^{−1} = ∏_{k=2}^{n} L_v(k, η_v^k)`, so the Euler products assemble into
`∏_k L(k, η^k)` up to the factors `β_v^⋆/β_v(L)` on `S(L)`. (a) is 6.1a(b) with `χ_v(L) = ε(V_v)`.
(b): by 4.4(d) a maximal `L` is unimodular at split places and at inert places outside
`S_odd(V)`, of the shape of 6.1a(c) on `S_odd(V)`, where `q_v^n β_v^⋆/β_v(L) = (q_v^n − (−1)^n)/(q_v + 1)`, and at ramified places unimodular (scale-maximal) or as in 6.1a(d)
(norm-maximal); the local parts of `N(𝔳(L))^n` are absorbed in these factors (at an inert place of
`S_odd(V)` by the identity just written, at a ramified place by the identity of 6.1a(d)). (c) is the
formula alone, with `S(L)` empty, `N(𝔡_{E/F}) = 1` and `N(𝔳(L)) = 1`; the genus statement is 5.8(b).

*Needs:* 4.4, 5.8, 6.1a, 6.1b, 6.2.

**Checks.**

- `E = ℚ(√−3)`, `L = O_E^n` standard (`3` ramified, residue form `x_1² + ⋯ + x_n²` over `𝔽_3`, so
  `ε(V_3) = −1` for `n = 2, 6` and `+1` for `n = 4`): `n = 1, …, 5` give
  `1/6, 1/72, 1/1296, 1/31104, 1/933120`, that is `1/(6^n n!) = 1/|U(L)|` (5.2): in each of these ranks
  the genus has a single class. For `n = 2` the formula reads `2·3^{3/2}·(2π)^{−3}·L(1, η)·ζ(2)·c_3`,
  with `L(1, η) = π/(3√3)`, `ζ(2) = π²/6` and `c_3 = 1/3`.
- The same lattice for `n = 6` (`ε(V_3) = −1`): the formula gives
  `13/235146240 = 1/(6^6·6!) + 1/39191040`, so the genus has a second class, with unitary automorphism
  group of order `39191040 = |6.U_4(3).2|`, the Hermitian structure over `ℤ[(1 + √−3)/2]` of the
  Coxeter–Todd lattice [Feit]. An error in the constants that preserved class number one in ranks
  `n ≤ 5` would not survive this test.
- `E = ℚ(√−3)`, `V = ⟨1, 2⟩` (`2` inert with odd determinant valuation, `ε(V_3) = 1`): (b) gives
  `1/36` for the scale-maximal `O_E e_1 ⊕ O_E e_2`, whose stabilizer `μ_6 × μ_6` has order `36`, and
  `1/72` for the norm-maximal lattices (4.4); the lattice `L'` of 5.6's Check has mass
  `2·(1/72) = 1/36`.
- `n = 8` (`ε(V_3) = +1`): the formula gives
  `41/48372940800 = 1/(6^8·8!) + 1/(39191040·72) + 1/2090188800`, three classes: `O_E^8`, the
  Coxeter–Todd lattice of the previous Check plus `O_E²`, and `E_8 ⊗ ℤ[(1 + √−3)/2]`, whose unitary
  automorphism group `W(E_8) × μ_3` has order `2090188800`. It tests the other sign of `ε(V_3)` in a
  rank with several classes.
- A formula with `L(k, η)` for every `k` in place of `L(k, η^k)` has `L(2, η)` instead of `ζ_F(2)`
  for `n = 2` and fails the first Check.
- `n ≥ 1` is needed: for `n = 0` every product is empty and the formula gives `2`, while the zero
  lattice has one class with trivial stabilizer and mass `1` (`U(0)` is trivial, of Tamagawa number
  `1`, not `2`).
- Lattices that are not free, over `E = ℚ(√−15)` with the prime `P` above `2` of 6.1b's Check. In rank
  one `U(P_v) = U(O_{E_v})` at every `v`, so the genus of `P` has the double coset of the genus of `O_E`
  (5.1): one class (both classes of `Cl(E)` are ambiguous), with stabilizer `{±1}`, and
  `mass(P) = 1/2`. The formula gives `2·√15·2·(2π)^{−1}·(2π/√15)·(1/2)²·(1/2) = 1/2`: `N(𝔳(P)) = 2`,
  `L(1, η) = 2π/√15`, the factors `1/2` of (a) at the ramified `3`, `5`, and `β_2^⋆/β_2(P) = (1/2)/1` at
  the split `2`, where `P_2 ≅ ⟨2⟩` (6.1d(d); the counts modulo `2^N` give `β_2 = 1`). Over `ℚ(√−23)`
  (class number `3`, no nontrivial ambiguous class) the same computation gives `3/2`, three classes with
  stabilizer `{±1}`. In rank two, `L = O_Ee_1 ⊕ Pe_2 ⊂ ⟨1, 1⟩` over `ℚ(√−15)`: counting pairs `M ⊂ U` of a
  lattice of the genus of `L` in a unimodular lattice (one genus, 5.8(a); at `2` a unimodular lattice
  contains six lattices of the type of `L_2 ≅ ⟨1, 2⟩`, and `L_2` lies in two unimodular lattices) gives
  `mass(L) = 3·mass(O_E²)`, and the formula gives the ratio
  `N(𝔳(L))²·β_2^⋆(2)/β_2(L) = 4·(3/8)/(1/2) = 3` (`β_2(L) = 1/2` from the counts modulo `4` and `8`). The
  normalization of `β_∞` of a free lattice, applied to these lattices, would give `1/4`, `3/4` and the
  ratio `3/4`.

### 6.4 Ratios of masses

*Origin:* adapted from Shimura (1997), Gan, Hanke and Yu (2001) and Kirschmer (2016), Proposition 4.2.7 (3), the exact
mass formula, of which these ratios are quotients, with the local factors in the normalisation of 6.3: the ratios
within one space and between consecutive ranks are this roadmap's own formulation, with the unramified unimodular ratio
in the covolume form of [FormalProof] recorded below.

*Method of the formal proof:* for a space of rank `n ≥ 3` with a self-dual lattice and a vector `x` of norm `±1` in it,
the one-vector Siegel–Weil identity is applied to the indicator of the lattice times a bump function near `x`;
unfolding over the rational orbit of `x` gives the quotient of the covolumes of `U(x^⊥)` and `U(V)`, and the local
densities of unit vectors give `L(n, η^n)^{−1}` and the archimedean constant. The route written here derives the ratios
from the closed formula 6.3, where the formal proof proves the ratio first and derives the masses from it.

Prove: (a) same space: 5.6(c), and, through 6.2,
`mass(L)/mass(L') = (β_∞(L')/β_∞(L))∏_v β_v(L')/β_v(L)`. (b) Consecutive ranks: for `n ≥ 2`, a
lattice `L` of rank `n − 1` in a totally definite space `U` and `L' = L ⊥ O_E e` with `h(e, e) = u` a
unit of `O_F` whose sign at every real place is that of `U` (so that `U ⊥ Ee` is totally definite),
`mass(L')/mass(L) = |d_F|^{(2n−1)/2}·N(𝔡_{E/F})^{n/2}·N(𝔳(L))·((n − 1)!/(2π)^n)^d·L(n, η^n)· ∏_{v ∈ S(L')} (β_v^⋆(n)/β_v(L'))/(β_v^⋆(n − 1)/β_v(L))`,
with `β_v^⋆(m)` as in the Conventions. In particular, if `E/F` is unramified at every finite place and
`L, L'` are unimodular, `mass(L')/mass(L) = |d_F|^{(2n−1)/2}((n − 1)!/(2π)^n)^d L(n, η^n)`. For `n = 1`
(`L = 0`, of mass `1`) the ratio is twice the displayed expression: it is `mass(L')`, given by 6.3.
[FormalProof] states the unramified unimodular case for covolumes, for a space of rank `n ≥ 3` with the same signature at
every real place and the orthogonal complement of a vector of norm `±1`.

Route: 6.3 for `L` and `L'`, both of positive rank; `𝔳(L') = 𝔳(L)` and `S(L') = S(L)`. The constant `2`
of 6.3 is `τ(U(V))` (6.0b, for positive dimension) and cancels in the ratio; for `n = 1` the lattice `L`
is the zero lattice of the trivial group `U(0)`, whose Tamagawa number is `1`.

*Needs:* 5.6, 6.2, 6.3.

**Checks.**

- `E = ℚ(√−3)`, `L = O_E^{n−1}`: the ratios are `1/12, 1/18, 1/24, 1/30` for `n = 2, …, 5`, that is
  `1/(6n)`, the ratio of the orders `6^{n−1}(n−1)!` and `6^n n!`; for `n = 6` the ratio is `13/252`, not
  `1/36`, because of the second class of rank six (6.3).
- `n = 1` is excluded from the displayed form: over `ℚ(√−3)`, `mass(⟨1⟩)/mass(0) = 1/6`, while the
  expression gives `√3·(2π)^{−1}·(π/(3√3))·(β_3^⋆(1)/β_3(⟨1⟩)) = 1/12` (`β_3(⟨1⟩) = 2`, `β_3^⋆(1) = 1`).

### 6.4a Unimodular lattices meeting a subspace in a given lattice

*Origin:* this roadmap's own formulation: the weighted count of the unimodular lattices that meet a subspace in a given
lattice, from the gluing of 4.9 and the mass formula 6.2–6.3, with the existence criterion of (b); its sufficiency in
the strict form `t(M_v) < n′` is the form of [FormalProof] recorded below.

*Method of the formal proof:* the map `Λ ↦ Λ ∩ U′` is equivariant with fibres of `∏_v #O(A_{M_v})` elements over one
genus (4.9), an orbit count turns the weighted sum over the `Λ` into that number times the mass of the genus, and the
mass is evaluated through the local densities, the density of a lattice being the number of automorphisms of its
discriminant form times the density of its unimodular part.

Let `E/F` be a quadratic extension of number fields, `V = U ⊥ U′` a Hermitian space over `E` with `U′` of
dimension `n′ ≥ 1` (no condition on signatures), and `M ⊂ U` an integral lattice. Let `𝒢l(M)` be the
set of unimodular lattices `Λ ⊂ V` with `Λ ∩ U = M`. The group `U(U′)(F)`, acting on `V` by the identity
on `U`, permutes `𝒢l(M)`; the stabilizer `Stab(Λ)` of `Λ` lies in `U(Λ ∩ U′)` with finite index, and is
discrete in `U(U′)(F_∞)`. Call a genus `𝒢` of lattices `M′ ⊂ U′` *admissible* if `A_{M′_v}` is
anti-isometric to `A_{M_v}` at every finite `v`. All lattices of admissible genera have the volume ideal
`𝔳(M)` (4.9(a)) and therefore define the same archimedean fibre measure on `U(U′)(F_∞)` (6.1(f),
Conventions); write `β_v(𝒢) = β_v(M′)` for `M′ ∈ 𝒢`. Prove:
(a) in `[0, ∞]`,
`Σ_{Λ ∈ U(U′)(F)\𝒢l(M)} vol(Stab(Λ)\U(U′)(F_∞)) = (∏_v #O(A_{M_v}))·Σ_𝒢 2·L(1, η)·∏_{v<∞}(L_v(1, η_v)β_v(𝒢))^{−1}`,
the sum over the admissible genera, for that fibre measure; both sides are `0` when there is no
admissible genus. In particular, if `F` is totally real, `E/F` is a CM extension and `U′` is totally
definite, then `Stab(Λ)` is finite and
`Σ_{Λ ∈ U(U′)(F)\𝒢l(M)} 1/|Stab(Λ)| = (∏_v #O(A_{M_v}))·Σ_𝒢 mass(𝒢)`,
`mass(𝒢)` being the mass of 5.5;
(b) suppose no dyadic place of `F` ramifies in `E` and `M_v` is unimodular at every ramified `v`. Then
there is at most one admissible genus `𝒢(M)`, and `𝒢l(M)` is nonempty iff, at every finite `v`, `V_v`
contains a unimodular lattice and `t(M_v) ≤ n′`. If these conditions hold and moreover `F` is totally
real, `E/F` is CM and `U′` is totally definite, the sum `Σ 1/|Stab(Λ)|` of (a) is
`2·|d_F|^{n′²/2}·N(𝔡_{E/F})^{n′(n′+1)/4}·N(𝔳(M))^{n′}·∏_{k=1}^{n′}((k − 1)!/(2π)^k)^d·∏_{k=1}^{n′}L(k, η^k)· ∏_{v ∈ S(M)} β_v^⋆(n′)/β_v^⋆(n′ − t(M_v))·∏_{v ramified} c_v(U′)`,
where `d = [F : ℚ]`, `S(M)` is the set of finite places at which `E/F` ramifies or `M_v` is not
unimodular (as `S(L)` in 6.3; at a ramified `v` the factor of `S(M)` is `1`, as `t(M_v) = 0` there),
`β_v^⋆(m)` is that of the Conventions and `c_v(U′)` is the factor `c_v` of 6.1a(d) for the space `U′_v`;
if the conditions fail, `𝒢l(M)` is empty and the sum is `0`;
(c) in particular, let `E/F` be a CM extension unramified at every finite place and `U′` totally
definite: if `V_v` contains a unimodular lattice and `t(M_v) ≤ n′` at every finite `v`, the sum is
`mass(O_E^{n′})·N(𝔳(M))^{n′}·∏_{v ∈ S(M)} β_v^⋆(n′)/β_v^⋆(n′ − t(M_v))`, with `mass(O_E^{n′})` the mass of
the unimodular lattices of rank `n′` of 6.3(c); otherwise `𝒢l(M)` is empty and the sum is `0`. The sum
depends on `M` only through `𝔳(M)`, the places `S(M)`, the numbers `t(M_v)` and the existence condition.

*The form of the formal proof* of the existence criterion of (b), (c): for `E/F` a CM extension unramified at every
finite place and `U′` totally positive definite, it uses only the sufficiency, in the form: if `V` contains a
unimodular lattice and `t(M_v) < n′` at every finite `v`, then `𝒢l(M)` is nonempty. The criterion of (b) implies it.

Route: (a) `Λ ↦ M′ = Λ ∩ U′` is `U(U′)(F)`-equivariant, and `Stab(Λ)` preserves `M′`, so it is the
stabilizer of `Λ` in `U(M′)`. For a fixed `M′`, the set of `Λ ∈ 𝒢l(M)` with `Λ ∩ U′ = M′` has
`∏_v #O(A_{M′_v}) = ∏_v #O(A_{M_v})` elements if the genus of `M′` is admissible and is empty otherwise
(4.9(c), (d)); `U(M′)` permutes this finite set, so `Stab(Λ)` has finite index in `U(M′)`, the orbits
have sizes `[U(M′) : Stab(Λ)]`, and `vol(Stab(Λ)\U(U′)(F_∞)) = [U(M′) : Stab(Λ)]·vol(U(M′)\U(U′)(F_∞))`
(both groups act freely by left multiplication). Grouping the orbits of `U(U′)(F)` by the class of `M′`
(5.1), those over the class of `M′` contribute `∏_v #O(A_{M_v})·vol(U(M′)\U(U′)(F_∞))`, and the sum over
the classes of an admissible genus is `2·L(1, η)·∏_{v<∞}(L_v(1, η_v)β_v(𝒢))^{−1}` by 6.2(b). The
archimedean measure is the same for all admissible genera because the covolume of `End(M′)` does not
depend on `M′` and that of `Herm(M′)` depends only on `𝔳(M′)` (the local indices are powers of
`|N_{E/F}(det g_v)|_v` for `M′_v = g_vM″_v`). In the definite case `U(M′)` is finite (5.2(b)),
`vol(Stab(Λ)\U(U′)(F_∞)) = β_∞(M′)/|Stab(Λ)|` with `β_∞(M′)` depending only on `𝔳(M′) = 𝔳(M)` (6.1b),
and 6.2(a) turns the right side into `β_∞(M′)·(∏_v #O(A_{M_v}))·Σ_𝒢 mass(𝒢)`. (b) At a place of
`S(M)` that is split or unramified, `M′_v` is unique up to `U(U′_v)` and exists under the stated
conditions (4.9(e)); at the other finite places `A_{M′_v} = 0`, so `M′_v` is a unimodular lattice of
`U′_v`, which exists and is unique up to `U(U′_v)` at split, unramified and nondyadic ramified places
(4.2(a), (b); at an inert `v` where `M_v` is unimodular, `val det U′_v ≡ val det V_v − val det U_v` is
even); the local lattices glue to a lattice `M′ ⊂ U′` (4.0(g)) and the local anti-isometries to a
global one (4.8(a)), which gives `Λ` by 4.9(b). Apply 6.3 to `M′`: `𝔳(M′) = 𝔳(M)` (4.9(a)),
`S(M′) = S(M)` (4.8(b)), at a split or unramified `v ∈ S(M)`
`β_v(M′) = #O(A_{M_v})·β_v^⋆(n′ − t(M_v))` (6.1d(d)), and at a ramified `v`, where `M′_v` is unimodular,
`β_v^⋆(n′)/β_v(M′) = c_v(U′)` (6.1a(d)). The factors `#O(A_{M_v})` cancel. (c) is (b) with
`N(𝔡_{E/F}) = 1`, no ramified place, and 6.3(c).

*Needs:* 4.0, 4.2, 4.8, 4.9, 5.1, 5.2, 5.5, 6.1a, 6.1b, 6.1d, 6.2, 6.3.

**Checks.**

- `E = ℚ(√−3)`, `V = ⟨1, 1⟩`, `U = E(1, 1)`, `M = O_E(1, 1)` (`⟨2⟩`), `n′ = 1`; `S(M) = {2, 3}`: `2` is
  inert with `t(M_2) = 1`, and at the ramified `3`, where `M_3` is unimodular, the factor is `1`. The genus
  `𝒢(M)` is the class of `M′ = O_E(1, −1)`, with `U(M′) = μ_6`; `𝒢l(M)` is one `U(U′)(ℚ)`-orbit, that of
  `O_E²` (4.9's last Check), with stabilizer `{±1}` (`μ_6` acts on `A_{M′} = O_E/2` through
  `μ_6 → (O_E/2)^× ≅ μ_3`), so the left side of (a) is `1/2 = 3·(1/6)`. The closed form gives
  `2·3^{1/2}·2·(2π)^{−1}·(π/(3√3))·(3/2)·(1/2) = 1/2`, with `β_2^⋆(1)/β_2^⋆(0) = 3/2` and
  `c_3(U′) = 1/2` (`n′` odd). Leaving out `∏_v #O(A_{M_v})` would give `1/6`.
- `V = ⟨1, 1, 1⟩` over the same `E`, `U = E(1, 1, 0)`, `M = O_E(1, 1, 0)`, `n′ = 2`, `U′ ≅ ⟨2, 1⟩`:
  `𝒢(M)` is the genus of the scale-maximal lattice `⟨1, 2⟩` of 6.3's Checks, of mass `1/36`, and the
  closed form is `2·3^{3/2}·4·(8π³)^{−1}·(π/(3√3))·(π²/6)·(3/4)·(2/3) = 1/12 = 3·(1/36)`, with
  `β_2^⋆(2)/β_2^⋆(1) = (9/8)/(3/2) = 3/4` and `c_3(U′) = (1 + 3^{−1})/2 = 2/3` (`ε(U′_3) = η_3(−2) = 1`).
- (a) for an indefinite `U′`: `F = ℚ`, `E = ℚ(√5)` (the real place splits, `U(U′)(ℝ) ≅ ℝ^×`),
  `V = ⟨1, 1⟩`, `U = E(1, 1)`, `U′ = E(1, −1)`, `M = O_E(1, 1)` (`⟨2⟩`; `2` is inert, `A_{M_2} = 𝔽_4`).
  With `ε = (1 + √5)/2`, `U(M′) = ±ε^{2ℤ}` for `M′ = O_E(1, −1)`, whose genus is the only admissible one
  and has one class (as in 6.2's Check). The three lattices of 4.9(d) are `O_E²` and its images under
  `ε²`, `ε⁴` acting on `U′`, one orbit with stabilizer `±ε^{6ℤ}` (`ε^6 = 5 + 8ε ≡ 1 mod 2`, while `ε²` is a
  cube root of unity in `O_E/2 = 𝔽_4`). The fibre measure on `U(U′)(ℝ) = {(x, x^{−1})}` normalized by
  `End(M′) = O_E` (covolume `√5`) and `Herm(M′) = ℤ` is `dx/(2√5|x|)` (the fibre of `(x, y) ↦ 2xy` over
  `2`), so the left side is `∫_1^{ε^6}dx/(2√5x) = 3 log ε/√5`. On the right, `∏_v #O(A_{M_v}) = 3` and
  `2·L(1, χ_5)·(L_2(1, η_2)β_2(M′))^{−1}(L_5(1, η_5)β_5(M′))^{−1} = 2·(2 log ε/√5)·(1/2)·(1/2) = log ε/√5`
  (`β_2(M′) = 3`, `L_2(1, η_2) = 2/3`, `β_5(M′) = 2`): both sides are `3 log ε/√5 ≈ 0.6456`.
- In the first Check the two formulas of (a) carry different weights. The covolume weight of the one
  orbit is `vol(Stab(Λ)\U(U′)(ℝ)) = β_∞(M′)/2 = π/(2√3)` (`β_∞(M′) = (2π/√3)/N(𝔳(M′)) = π/√3` by 6.1b), and
  the first formula gives `3·2·L(1, η)·(L_2(1, η_2)β_2(M′))^{−1}(L_3(1, η_3)β_3(M′))^{−1} =   3·2·(π/(3√3))·(1/2)·(1/2) = π/(2√3)` (`β_2(M′) = 3`, `L_2(1, η_2) = 2/3`, `β_3(M′) = 2`); the weight
  `1/|Stab(Λ)| = 1/2` is that of the second formula, `3·mass(𝒢(M)) = 3·(1/6)`. Covolume weights with the
  right side of the second formula would be off by the factor `β_∞(M′)`.
- `n′ ≥ 1` is needed for the constant `2`: for `U′ = 0` (so `V = U`), `𝒢l(M)` is `{M}` if `M` is
  unimodular and empty otherwise, with trivial stabilizer, so the sum is `1` or `0`. This agrees with the
  second formula of (a) read with the mass `1` of the zero lattice (5.5), whereas the closed form of (b)
  would give `2`, every other factor being `1`: the constant `2` is `τ(U(U′))` (6.0b), and the trivial group
  `U(0)` has Tamagawa number `1` (as in 6.3's Check for `n = 0`).

### 6.4b Total mass of the integral lattices of given discriminant

*Origin:* particular to this proof: an upper bound for the total mass of the integral lattices of a totally definite
Hermitian space with discriminant module of given order, from the mass of the genus of maximal lattices, in the form
`m_j·n^{(j+l)/2}` recorded below; the intermediate bound `B_j(U, n)` is this roadmap's own formulation.

*Method of the formal proof:* every integral `P` with `#A_P = n` lies in a maximal lattice `M` with
`n = #A_M·[M : P]²`; the pairs `P ⊆ M` are counted by orbits in two ways, which bounds `Σ_{[P]} 1/|U(P)|` by the number
of sublattices of index `[M : P]` of a lattice of rank `j` (4.10(c)) times the mass of the genus of maximal lattices,
and that mass is at most `m_j·(#A_M)^{j/2}` by the mass of 6.3(b), each local factor `(q^j − (−1)^j)/(q + 1)` being at
most `q^j`.

Let `F` be totally real of degree `d`, `E/F` a CM extension unramified at every finite place,
`l = log₂[E : ℚ]`, `U` a totally definite Hermitian space of dimension `j ≥ 1`, and `n ≥ 1`. Write `m_j`
for the mass `2·|d_F|^{j²/2}∏_{k=1}^{j}((k − 1)!/(2π)^k)^d∏_{k=1}^{j}L(k, η^k)` of the unimodular lattices of
rank `j` (6.3(c)), `S_odd(U)` for the inert places at which `val(det U_v)` is odd and
`n_U = ∏_{v ∈ S_odd(U)} q_v²`. Put `B_j(U, n) = m_j·∏_{v ∈ S_odd(U)}(q_v^j − (−1)^j)/(q_v + 1)·s_j(i)` if
`n = n_U·i²` for a positive integer `i`, where `s_j(i)` is the number of sublattices of index `i` of a
lattice of rank `j` (4.10(c)), and `B_j(U, n) = 0` otherwise. Prove that
`Σ_{[P]} 1/|U(P)| ≤ B_j(U, n) ≤ m_j·n^{(j+l)/2}`,
the sum over the classes (orbits of `U(U)(F)`) of the integral lattices `P ⊂ U` with `#A_P = n`; in
particular the sum is `0` unless `n/n_U` is the square of an integer. No condition is put on the
discriminant modules.

*The form of the formal proof* is the outer inequality `Σ_{[P]} 1/|U(P)| ≤ m_j·n^{(j+l)/2}` for `U` totally positive
definite, a case of the statement.

Route: the scale-maximal lattices of `U` (equal to the norm-maximal ones, 4.4(b)) form one genus
(4.4(e)), with `#A_M = n_U` (4.4(d): unimodular outside `S_odd(U)`, and `A_{M_v} = k_{E_v}` on it) and, by
6.3(b), mass `m_j·∏_{v ∈ S_odd(U)}(q_v^j − (−1)^j)/(q_v + 1)`. Every integral `P` lies in a scale-maximal
`M` (4.4(a)), and then `#A_P = #A_M·[M : P]²` (from `P ⊆ M ⊆ M^∨ ⊆ P^∨` and `[P^∨ : M^∨] = [M : P]`, the
duality of 4.0b as in the route of 4.11(b)), so `[M : P]² = n/n_U`: if `n/n_U` is not the square of an
integer there is no such `P`, and both inequalities hold with `B_j(U, n) = 0`. Otherwise, with
`i = [M : P]`, orbit counting on the pairs
`P ⊆ M`: `Σ_{[P]}1/|U(P)| ≤ Σ_{[P]}#{M ⊇ P}/|U(P)| = Σ_{[M]}#{P ⊆ M : [M : P] = i}/|U(M)| = s_j(i)·mass(M)`.
Finally `(q^j − (−1)^j)/(q + 1) ≤ q^{j−1}`, so the mass of the maximal genus is at most
`m_j·n_U^{(j−1)/2}`, and `s_j(i) ≤ i^{j+l}` with `i² = n/n_U` (4.10(c)); the product is at most
`m_j·n^{(j+l)/2}·n_U^{−(l+1)/2}`.

*Needs:* 4.0b, 4.4, 4.10, 5.5, 6.3.

**Checks.**

- `E = ℚ(ζ_12)`, `F = ℚ(√3)`, `𝔭` the inert prime of `F` of norm `2` (`q = 2`), `U = ⟨1, 1⟩`, `j = 2`,
  `n = 16`, `l = 2`. The integral lattices with `#A_P = 16` have `𝔳(P) = 𝔭²` and are of two Jordan types
  at `𝔭`, one genus each: `⟨1, ϖ²⟩` (`β_𝔭 = 9` by 6.1d(d)) and `⟨ϖ, ϖ⟩` (`β_𝔭 = 18`); by 6.3 their masses are
  `16·(9/8)/9·m_2 = 2m_2` and `16·(9/8)/18·m_2 = m_2`. The left side is `3m_2`; `n_U = 1`, `i = 4` and
  `B_2(U, 16) = s_2(4)·m_2 = 5m_2` (one prime of `E` of norm `4`, `[2 choose 1]_4 = 5`), and the last bound is
  `16²·m_2 = 256m_2`.
  The orbit count is exact here: `⟨1, ϖ²⟩` lies in one unimodular lattice and `⟨ϖ, ϖ⟩` in three (the
  isotropic lines of `k_E²` for the form `ϖ^{−1}h`), and `2·1 + 1·3 = 5`.
- In rank one over the same `E`, `U = ⟨1⟩` (`S_odd(U) = ∅`) and `n = 1`: the sum is the mass `m_1` of
  the unimodular lattices of `U`, and the bound `B_1(U, 1) = m_1·s_1(1) = m_1` is attained. The space must
  be specified: for `U = ⟨11⟩`, `11` splits in `F` (`3 ≡ 5² mod 11`) and both primes above it are inert
  in `E` (`11` has order `2` modulo `12`), so `n_U = 11^4`; `U` contains no unimodular lattice, the sum
  for `n = 1` is `0`, and so is `B_1(U, 1)`, as `1/11^4` is not the square of an integer.

### 6.4c Subspaces meeting a lattice in a given discriminant: a weighted count

*Origin:* particular to this proof: a polynomial bound for the weighted number of subspaces that meet the lattices of a
family in a lattice of given discriminant, from the gluing of lattices and the mass formula, in the form recorded below
for cyclic discriminant modules; the sharper exponent `(5s + 2 + 3l)/2` for every family is this roadmap's own
formulation.

*Method of the formal proof:* the pairs `(L, U)` are grouped by the orbit of `U` (at most `n^{1+l}` orbits, 5.9); for a
fixed `U`, whose stabilizer is `U(U) × U(U^⊥)`, the equivariant map `L ↦ (L ∩ U, L ∩ U^⊥)` and an orbit count bound
the contribution by the largest fibre, at most `(n·nN_0)^{2s+1}` by 4.11(c), times the total masses of the integral
lattices of `U` with `#A = n` and of `U^⊥` with `#A ≤ nN_0`, which 6.4b bounds.

Let `F`, `E`, `l` and `m_j` be as in 6.4b, `V` a totally definite Hermitian space of dimension `j + s`
with `j, s ≥ 1`, `𝒢` a `U(V)(F)`-stable set of integral lattices of `V` with `#A_L = N_0` for `L ∈ 𝒢`, and
`n ≥ 1`. Prove that
`Σ_{[L] ∈ U(V)(F)\𝒢} #{U ⊆ V : dim U = j, #A_{L∩U} = n}/|U(L)| ≤ m_j·m_s·n^{j/2}·(nN_0)^{(5s + 2 + 3l)/2}`,
the left side in `[0, ∞]`. No hypothesis on the discriminant modules of the lattices of `𝒢` is needed.

*The form of the formal proof:* for `V` totally positive definite and `𝒢` consisting of lattices with cyclic
discriminant module (`L^∨ = L + O_E x`), the left side is at most `m_j·m_s·n^{j/2}·(nN_0)^{(9s + 8 + 4l)/2}`. The bound
above implies it and is a sharpening proved by the route here.

Route: the pairs `(L, U)` are counted by orbits of `U(V)(F)`: grouping by the orbit of `U`, of which there
are at most `n^{(log₂[F:ℚ])/2} ≤ n^{l/2}` (5.9), the left side is the sum over these orbits of
`Σ_{L ∈ 𝒢 mod Stab(U)} [#A_{L∩U} = n]/|Stab(U) ∩ U(L)|`, `Stab(U) = U(U) × U(U^⊥)`. The map
`L ↦ (L ∩ U, L ∩ U^⊥)` is equivariant, so for a fixed `U` this is at most
`max #(fibre)·Σ_{[P]}1/|U(P)|·Σ_{[Q]}1/|U(Q)|`, over the classes of integral `P ⊂ U` with `#A_P = n` and of
integral `Q ⊂ U^⊥` with `#A_Q ≤ nN_0` (4.11(b)). By 4.11(c) the fibres have at most `(n·nN_0)^s`
elements; by 6.4b the first sum is at most `m_j·n^{(j+l)/2}` and the second at most
`Σ_{m ≤ nN_0} m_s·m^{(s+l)/2} ≤ m_s·(nN_0)^{(s+l+2)/2}`. Multiplying,
`n^{l/2}·n^{(j+l)/2}·(nN_0)^{(s+l+2)/2}·(n²N_0)^s ≤ n^{j/2}·(nN_0)^{(5s+2+3l)/2}`.
With `(n·nN_0)^{2s+1}` for the fibres and `n^{1+l}` for the orbits one obtains the exponent `(9s + 8 + 4l)/2` of the
form of the formal proof.

*Needs:* 4.9, 4.11, 5.5, 5.9, 6.4b.

**Checks.**

- `n = N_0 = 1`, `V ≅ ⟨1, …, 1⟩` and `𝒢` the unimodular lattices of `V` (one genus, 5.8): `L ∩ U` is
  unimodular exactly when `L = (L ∩ U) ⊥ (L ∩ U^⊥)`, only `U ≅ ⟨1, …, 1⟩` occurs, and the left side is
  `m_j·m_s`: the bound is attained.
- `E = ℚ(ζ_12)/ℚ(√3)` as in 6.4b, `j = s = 2`, `n = 16`, `N_0 = 1`, `𝒢` the unimodular lattices of
  `⟨1, 1, 1, 1⟩`: by 4.9 the `L` over a pair `(P, Q)` correspond to the anti-isometries `A_P → A_Q`, and `Q`
  has the Jordan type of `P` (4.9(e)); with the masses of 6.4b's Check and `#O(A) = (q + 1)q = 6` for
  `O_E/ϖ²`, `|U_2(𝔽_2)| = 18` for `(O_E/ϖ)²`, the left side is `(2m_2)²·6 + m_2²·18 = 42m_2²`, against the
  bound `16·16^9·m_2²`.

### 6.5 Siegel's main theorem

*Origin:* published for `2k < n`: Weil (1965), the mean-value form of Siegel's main theorem for the classical groups,
unitary groups included, (a) and the covolumes of stabilizers in (d), stated in MetaplecticAutomorphicForms §6.4b; in
the range `n ≤ 2k ≤ 2n − 2` they are adapted from it: the same identities, proved here by the same route. (b) and (c) are
its specialization to definite lattices, published for positive Hermitian forms over an imaginary quadratic
field by Braun (1941), Satz V, after Siegel (1935–1937) for quadratic forms. The clause of (d) on the stabilizer of a
flag and an anisotropic vector is particular to this proof.

*Method of the formal proof:* (a) and (d) for a CM extension and `2k < n` (the form recorded below), by induction on
the size of `T`: the tuples with Gram matrix `t ⊕ T_1` are fibred over their first vector, the sum over the remaining
vectors is replaced by its mean over the quotient of the stabilizer (unfolding and refolding), the induction hypothesis
evaluates that mean, and the one-vector identity of 6.0a is applied to the resulting function, the local fibre measures
factoring in the same way. The route written here unfolds once over the rational orbit and uses the equality of the
Tamagawa numbers of the group and of the stabilizer (6.0b), where the formal proof works with Haar measures normalised
by fundamental domains.

*Corollary of:* MetaplecticAutomorphicForms §6.4b (Weil's mean-value form of Siegel's formula for unitary groups and the
covolumes of stabilizers, for `T` of size `k` with `2k < dim V`), for (a) and the first part of (d) when `2k < n`.

(a) *Weil's form, for every space.* Let `E/F` be a quadratic extension of number fields, `V` any
nondegenerate Hermitian space of dimension `n` (no condition on signatures), `1 ≤ k ≤ n − 1`,
`T ∈ Herm_k(E)` nondegenerate, `X_T = {X ∈ V^k : T_X = T}`, and `Φ = Φ_∞ ⊗ ⊗_{v<∞}Φ_v` a
Schwartz–Bruhat function on `V(𝔸)^k` (AnalyticNumberTheoryPartII §5.3h) with `Φ_∞` a Schwartz function
on `(V ⊗_F F_∞)^k`, the archimedean places taken together. With `μ_{T,v}` the
fibre measure of `X ↦ T_X` on `X_T(F_v)` at the finite places and `μ_{T,∞}` that on `X_T(F_∞)`, for the
archimedean places together (6.1(f), normalized by a lattice `L` as in the Conventions), and `dg` the
Tamagawa measure of `U(V)(𝔸)`, prove that
`τ(U(V))^{−1}∫_{U(V)(F)\U(V)(𝔸)} Σ_{X ∈ X_T(F)} Φ(g^{−1}X) dg = ∫_{X_T(F_∞)} Φ_∞ dμ_{T,∞}·∏_{v<∞} ∫_{X_T(F_v)} Φ_v dμ_{T,v}`,
both sides converging absolutely; the left side is the mean value of the orbit sum. The identity holds,
in `[0, ∞]`, for every `Φ = Φ_∞ ⊗ ⊗_{v<∞}Φ_v` with nonnegative measurable factors, `Φ_v = 1_{L_v^k}` for
almost all `v`; hence for every such product whose factors have absolute values with a finite
right side, for instance `Φ_∞` continuous with `|Φ_∞(X)| ≤ C(1 + |X|²)^{−N}` for a large `N` and `Φ_v`
Schwartz–Bruhat at the finite places. For an arbitrary `Φ ∈ S(V(𝔸)^k)`, a finite sum of such products
(AnalyticNumberTheoryPartII §5.3h; when `F` has several archimedean places, `Φ` need not be a finite sum of products over all
places), the left side is `∫_{X_T(𝔸)} Φ dμ_T`, where `μ_T` is the restricted product of `μ_{T,∞}` and the
`μ_{T,v}` on `X_T(𝔸)` (with respect to the `X_T(F_v) ∩ L_v^k`, of masses `α_v(L, T)`).
(b) *Definite lattices.* Let `F, E, L` be as in 6.2(a) with `V` totally positive definite,
`1 ≤ k ≤ n − 1` and `T` totally positive definite. For a lattice `M`, let
`r(M, T) = #{X ∈ M^k : T_X = T}`. Prove that
`(1/mass(L))·Σ_{[M] ∈ cls(L)} r(M, T)/|U(M)| = α_∞(L, T)·∏_{v<∞} α_v(L, T)`.
For `k = n` and `T` the Gram matrix of a basis of `L` the same argument gives 6.2, with the factor
`2` and the convergence factors.
(c) *Primitive representations and primitive sublattices.* In the setting of (b), let `U` be a
totally positive definite Hermitian space of dimension `k`, `1 ≤ k ≤ n − 1`, and `N ⊂ U` a lattice. A
representation of `N` by `M` is an `O_E`-linear map `X : N → M` with `h(Xa, Xb) = h_U(a, b)`; it is
primitive if `X(N)` is a primitive sublattice of `M` (Conventions). Let `r^*(M, N)` be the number of
primitive representations, and for the genus `γ` of `N` in `U` let `s^*(M, γ)` be the number of
primitive sublattices of `M` isometric to a lattice of `γ`. Let `α_v^*(L, N)` be the fibre measure
(6.1(f)) of the set of primitive representations of `N_v` by `L_v`, and `α_∞(L, N)` the fibre measure
of the isometric embeddings `U ⊗_F F_∞ → V ⊗_F F_∞`, both normalized by the lattices `Hom(N, L)` and
`Herm(N)` (for `N = O_E^k` with Gram matrix `T`, `α_∞(L, N) = α_∞(L, T)` of 6.1b). Prove that
`(1/mass(L))·Σ_{[M] ∈ cls(L)} r^*(M, N)/|U(M)| = α_∞(L, N)·∏_{v<∞} α_v^*(L, N)` and
`(1/mass(L))·Σ_{[M] ∈ cls(L)} s^*(M, γ)/|U(M)| = mass(γ)·α_∞(L, N)·∏_{v<∞} α_v^*(L, N)`,
with `mass(γ) = Σ_{[N′] ∈ cls(N)} 1/|U(N′)|`; at every finite place at which `L_v` and `N_v` are
unimodular and `E_v/F_v` is unramified or split, `α_v^*(L, N) = α_v(L, N) = ∏_{i=n−k+1}^{n} L_v(i, η_v^i)^{−1}`.
(d) *Volumes of stabilisers.* In the setting of (a), assume `X_T(F) ≠ ∅`, fix `X_0 ∈ X_T(F)`, let `H ⊂ U(V)` be the
pointwise stabiliser of `X_0`, the unitary group of the orthogonal complement `W` of the span of `X_0`, and let `dg` be a
Haar measure on `U(V)(𝔸)`. Prove that `X_T(𝔸) = U(V)(𝔸)·X_0`; that there is exactly one Haar measure `dh` on `H(𝔸)` with
`∫_{U(V)(𝔸)} f(g) dg = ∫_{X_T(𝔸)} ∫_{H(𝔸)} f(g_Yh) dh dμ_T(Y)` for every measurable `f ≥ 0`, where `g_Y` is any element of
`U(V)(𝔸)` with `g_YX_0 = Y`; and that for this `dh`
`vol(H(F)\H(𝔸), dh) = vol(U(V)(F)\U(V)(𝔸), dg)`,
both sides finite. Hence the stabilisers of two tuples with nondegenerate Gram matrices, of sizes at most `n − 1`,
each with its measure `dh`, have the same covolume.
*The stabiliser of a flag and an anisotropic vector.* Let `e_1, …, e_a, f_1, …, f_a, z ∈ V` with
`h(e_i, e_j) = h(f_i, f_j) = 0`, `h(e_i, f_j) = δ_{ij}`, `z` orthogonal to all `e_i`, `f_j`, `h(z, z) ≠ 0` and `2a + 1 ≤ n − 1`; put
`X = ⟨e_1, …, e_a⟩`. Let `N ⊂ U(V)` be the unipotent radical of the stabiliser of the flag `⟨e_1⟩ ⊂ ⟨e_1, e_2⟩ ⊂ ⋯ ⊂ X`, the
group of `g` with `ge_b − e_b ∈ ⟨e_c : c < b⟩` for all `b` and `gv − v ∈ X` for all `v ⊥ X`; let `H` be the pointwise stabiliser
of the tuple `(e_1, …, e_a, z, f_1, …, f_a)`, whose Gram matrix is nondegenerate; and let `S` be the group of `g ∈ U(V)` with
`ge_b − e_b ∈ ⟨e_c : c < b⟩` for all `b` and `gz − z ∈ X`. Prove that `S = N ⋊ H`; that conjugation by `H(F_v)` preserves the
Haar measures of `N(F_v)` at every place, so that the image of a product of Haar measures of `N` and `H` under
`(n, h) ↦ nh` is a Haar measure of `S`, over `F_v`, over `𝔸_f` and over `𝔸`; and that `N(F)\N(𝔸)` is compact, so that `N(𝔸)`
has exactly one Haar measure with `vol(N(F)\N(𝔸)) = 1`.

*The form of the formal proof:* it uses (a), and (d), for a CM extension `E/F` and `2k < n` only, with `Φ_∞` smooth of
compact support; these are cases of (a) and (d).

Route: Weil's mean-value identity. If `X_T(F) = ∅`, then `X_T(F_v) = ∅` for some `v` (3.5(a)) and both
sides vanish. Otherwise `X_T(F)` is one `U(V)(F)`-orbit and `X_T(F_v)` one `U(V)(F_v)`-orbit at every
place (Witt extension, 1.1(b), split places included), with stabilizer `U(W)`, `W` the orthogonal
complement of the span of a point, `dim W = n − k ≥ 1`. At the places where
`L_v` and `T` are unimodular and `E_v/F_v` is unramified or split, `U(L_v)` acts transitively on
`X_T(F_v) ∩ L_v^k` (a unimodular sublattice splits off, and its complements are isometric by
4.2(a)), so the orbit map identifies `U(W)(𝔸)\U(V)(𝔸)` with `X_T(𝔸)`. Unfolding (first for `|Φ|`,
which gives the absolute convergence once the right side is finite; it uses only Tonelli's theorem,
so it holds for every product `Φ_∞ ⊗ ⊗_{v<∞}Φ_v` of nonnegative measurable factors), the left side is
`τ(U(W))/τ(U(V))·∫_{X_T(𝔸)} Φ` for the quotient of the Tamagawa measures; `τ(U(W)) = τ(U(V)) = 2`
(6.0b); by OrbitMeasuresOnAdelicGroups §2.6 *homogeneous-gauge-measure* (iii), (iv) (`A = V^k`,
`B = Herm_k`, `Φ(X) = T_X`, `X_T` the whole fibre, along which `dΦ` is onto because `T` is
nondegenerate; `U(V)` acts by `X ↦ gX` with determinant `N_{E/F}(det g)^k = 1`; `U(V)` and `U(W)` are
reductive, and their character modules agree because `dim W ≥ 1`, ReductiveGroups §9D.1) the quotient measure is
the restricted product of the local fibre measures, the archimedean ones taken together. The local
integrals are finite: at the finite places by compact support, and at the archimedean places because
the fibre measure `μ_T` on `X_T(F_∞)` has polynomial volume growth, `∫_{X_T(F_∞)}(1 + |X|²)^{−N}dμ_T < ∞`
for large `N`. Indeed, fibre integration (6.1(f)) of `(1 + |X|²)^{−N}` over the injective `X` gives
`∫_{X_S(F_∞)}(1 + |X|²)^{−N}dμ_S < ∞` for almost every nondegenerate `S ∈ Herm_k(E ⊗_F F_∞)`;
`A ↦ A^*TA` is a submersion at `A = 1` (its differential `Y ↦ Y^*T + TY` is onto because `T` is
invertible), so its image contains a neighbourhood of `T` and some such `S` is `A_0^*TA_0`; and
`X ↦ XA_0` carries `X_T(F_∞)` onto `X_S(F_∞)` and `μ_T` to a constant multiple of `μ_S` (it is linear
and `T_{XA_0} = A_0^*T_XA_0`), with `|XA_0| ≍ |X|`. The product of the local integrals converges
absolutely because for almost all `v` the
local factor is `α_v(L, T) = ∏_{i=n−k+1}^{n}L_v(i, η_v^i)^{−1}` with `n − k + 1 ≥ 2` (6.1a(a)); this is
also what makes the restricted product `μ_T` exist, and for `Φ = Φ_∞ ⊗ ⊗_{v<∞}Φ_v` the product of the
local integrals is `∫_{X_T(𝔸)}Φ dμ_T`, so the statement for an arbitrary `Φ` follows by linearity. For
`k = 1` and `n ≥ 3` this is the `T`-th term of 6.0a. (b) is (a) with `Φ` the indicator of
`∏_v L_v^k` at the finite places and `1` on the compact `X_T(F_∞)`: by 5.1 and 5.5 the left side is
`mass(L)^{−1}Σ_{[M]} r(M, T)/|U(M)|`, and the local factors are the `α_v(L, T)` (6.1, 6.1b). (c) is (a)
for `Hom(U, V)` in place of `V^k`, with `Φ_v`, at the finite places of a finite set `S` outside which
`L_v`, `N_v` are unimodular and `E_v/F_v` is unramified or split, the indicator of the primitive
`X ∈ Hom(N_v, L_v)` (an open compact set: primitivity is a condition on `X` modulo `𝔓`, componentwise
at a split place), `Φ_v = 1_{Hom(N_v, L_v)}` at the other finite places, where every representation is
primitive (its image is a unimodular sublattice, an orthogonal summand as in the route of 4.2(d)), and
`Φ_∞` a Schwartz function equal to `1` on the compact `X_N(F_∞)`; as in (b) the left side is
`mass(L)^{−1}Σ_{[M]} r^*(M, N)/|U(M)|` and the right side `α_∞(L, N)∏_v α_v^*(L, N)`. The primitive
sublattices of `M` isometric to `N` are the images of the primitive representations, on which `U(N)`
acts freely; the classes of `γ` are the isometry classes of lattices in `γ` (an isometry between
lattices spanning `U` extends to `U`), and the densities depend only on `γ` (they are local, and
`N(𝔳)` is constant on `γ`), so summing `r^*(M, N′)/|U(N′)|` over the classes `N′` of `γ` gives the second
identity. At the places outside `S` the value is 6.1a(a).

Route of (d): by Witt's theorem `X_T(F)` is one `U(V)(F)`-orbit and `X_T(F_v)` one `U(V)(F_v)`-orbit at every place, and at
almost all places `U(L_v)` is transitive on `X_T(F_v) ∩ L_v^k` (route of (a)), so the orbit map identifies
`U(V)(𝔸)/H(𝔸)` with `X_T(𝔸)`; `μ_T` is invariant under `U(V)(𝔸)`, which preserves the self-dual measures and the map
`X ↦ T_X`, and `U(V)(𝔸)`, `H(𝔸)` are unimodular, so `μ_T` is the quotient of `dg` by exactly one `dh`. For `Φ ≥ 0` as in (a)
with `0 < ∫_{X_T(𝔸)}Φ dμ_T < ∞`, unfolding over the single rational orbit gives
`∫_{[U(V)]} Σ_{X ∈ X_T(F)} Φ(g^{−1}X) dg = vol(H(F)\H(𝔸))·∫_{X_T(𝔸)}Φ dμ_T`, and by (a) the left side is
`vol(U(V)(F)\U(V)(𝔸))·∫_{X_T(𝔸)}Φ dμ_T`. For the flag: an element of `S` acts on `X` by a unitriangular matrix and fixes the
class of `z` in `X^⊥/X`, so it acts on the orthogonal complement of that class through an element `h` of `H`, and
`gh^{−1} ∈ N`; `H` fixes the `e_b`, so it normalises `N`, and it acts on the Lie algebra of `N` through its action on `W`,
with a determinant of norm one. `N(F)\N(𝔸)` is compact by induction along a central series of `N` with vector group
quotients, from the compactness of `F\𝔸`.

*Needs:* 1.1, 3.5, 4.2, 5.1, 5.5, 6.0a, 6.0b, 6.1, 6.1a, 6.1b; AdelicAlgebraicGroups §§2.2, 2.4 and OrbitMeasuresOnAdelicGroups §2.6
(*homogeneous-gauge-measure*); AnalyticNumberTheoryPartII §§5.3g, 5.3h; ReductiveGroups §9D.1.

**Checks.**

- `E = ℚ(√−3)`, `L = O_E²` (one class, `|U(L)| = 72`), `k = 1`, `T = 1`: `r(L, 1) = 12`, so the left
  side is `12`. The right side is `(4π²/3)·∏_{p≠3}(1 − p^{−2})·α_3 = (4π²/3)·(27/4π²)·(4/3) = 12`, with
  `α_3(L, 1) = 4/3` from the four points of `x² + y² = 1` over `𝔽_3`.
- `k = n` is excluded from the displayed form: there the stabilizer is trivial, `τ(1) = 1` replaces
  `τ(U(W)) = 2`, and the product of local densities needs the convergence factors.
- In (a) for an indefinite `V`, `X_T(F_∞)` is not compact: for `V` of signature `(1, 1)` over
  `ℚ(i)/ℚ`, `k = 1`, `T = 1`, it is the hyperboloid `|x_1|² − |x_2|² = 1` in `ℂ²`, and the archimedean
  factor is a genuinely convergent integral of `Φ_∞`.
- (c) for `E = ℚ(√−3)`, `L = O_E²` and `N = O_E` with `h(1, 1) = 4`: of the `84` vectors of `L` of
  length `4`, the `12` vectors `2y` with `h(y, y) = 1` are not primitive, so `r^*(L, N) = 72`. Locally at
  the inert prime `2`, `α_2^*(L, N) = 9/8` (the nine nonzero isotropic vectors of `⟨1, 1⟩` over `𝔽_4`,
  divided by `2³`), while `α_2(L, ⟨4⟩) = 9/8 + 2^{−2}·α_2(L, ⟨1⟩) = 9/8 + 3/16 = 21/16`; the other local
  factors and `α_∞` are those of `T = 4` in (b), whose product is `64`, and `64·9/8 = 72`, `64·21/16 = 84`.
- `E = ℚ(√−3)`, `L = O_E²`, `k = 1`, `T = 1`, `X_0 = (1, 0)`, `H = U(1)` on the second
  coordinate. With `dg` giving `Stab(L̂)·U(V)(ℝ)` the volume `1`, `vol([U(V)]) = mass(L) = 1/72`. The set of `Y ∈ X_T(𝔸)` with
  all finite components in `L_v` is one orbit of `Stab(L̂)·U(V)(ℝ)` and has `μ_T`-measure `12`, the product of the local
  densities of the first Check; so `dh` gives `U(1)(Ẑ)·U(1)(ℝ)` the volume `1/12`. `[U(1)]` is one class (the class
  number of `E` is one) with `6` units, so `vol([H]) = (1/12)·(1/6) = 1/72`.

### Examples

For `ℚ(i)/ℚ`, `τ(U(1)) = (4/π)·π·2/4 = 2` (6.0). Over `ℚ_3(√−3)`, `β_3(⟨1⟩) = 2`, `β_3(⟨1, 1⟩) = 8/3` and `β_3(⟨1, 2⟩) = 4/3` (6.1a). For `E = ℚ(√−3)` and `L = O_E^n` standard, the mass formula gives `1/(6^n n!)` for `n = 1, …, 5` and `13/235146240` for `n = 6` (6.3). For `L = O_E²` over `ℚ(√−3)`, `k = 1` and `T = 1`, both sides of Siegel's main theorem are `12` (6.5).

### Dependencies

Layers 0–5; AdelicAlgebraicGroups §§2.2, 2.4, 2.5, 3.1, 3.4 and OrbitMeasuresOnAdelicGroups §§2.6, 3.4a; ReductiveGroups §9D.1 (6.0b, 6.5); GeometryOfNumbersAndQuadraticArithmetic 3.1.3, 3.2.1, 3.2.2, §3.3; QuadraticFormInvariants Layer 1; AnalyticNumberTheoryPartI §2.17a; AnalyticNumberTheoryPartII §§5.3g, 5.3h; Mathlib's Haar measures, the Gamma function and Hilbert's Theorem 90.

## Layer 7: Hermitian theta series

### 7.1 Hermitian theta series

*Origin:* adapted from Cohen and Resnikoff (1978), the theta series of a lattice in a complex space with a positive
definite Hermitian form, in a Hermitian matrix variable, and their inversion law by Poisson summation, after Braun
(1941): here over a CM
field with a CM type, one variable `Z_τ` for each `τ ∈ Φ`, with the constant `(|d_E|^{n/2}N(𝔳(L)))^{−k}` and the dual
`𝔇_{E/ℚ}^{−1}L^∨`; this form, with the expansion and the invariances (a)–(c), is this roadmap's own formulation.

*Method of the formal proof:* [FormalProof] has no theta series of a Hermitian lattice in a matrix variable. Of this
section it has, for `k = 1` only: the summability of `Σ_{x ∈ L} exp(πiz·Tr_{E/ℚ} h(γ + x, γ + x))` for `γ ∈ V` and `z`
in the upper half-plane (the series of (a) with equal variables `Z_τ = z`, for a shifted lattice), by comparison with a
product of one-variable Gaussian series; and, in adelic form, the translation law and the inversion for the theta
function of a quadratic space over a totally real field with a Schwartz–Bruhat function at the finite places, the
factor of the inversion being left as a Gaussian integral: the test function is reduced to indicator functions of
cosets of a level lattice, and for each of them the inversion is Poisson summation for a Gaussian on a shifted
lattice, with the Fourier transform of the Gaussian computed by simultaneous diagonalisation of the real and imaginary
parts of the matrix variable. For general `k` it has only Poisson summation for a Gaussian in a symmetric matrix
variable. The Fourier expansion of (a), the invariances (b) and the explicit factor and constant of (d) are not
statements of [FormalProof]. The route written here computes the Fourier transform of the Hermitian Gaussian at
`Z = iY` and extends it to `ℋ_k^Φ` by the identity theorem.

*Corollary of:* ThetaSeries Layer 9 (9A: the Hermitian theta series `Θ_L^{(s)}` of degree `s` of a `ℤ`-lattice in a
complex space with a positive definite Hermitian form converges absolutely and locally uniformly on `ℋ_s` and is
holomorphic; 9B: `Θ_L^{(s)}(−Z^{−1}) = covol(L)^{−s}·det(Z/i)^r·Θ_{L^∨}^{(s)}(Z)`), when `F = ℚ`, for the convergence
and holomorphy in (a) and for (d).

Let `V` be totally positive definite over a CM extension `E/F` with CM type `Φ`, `L` a lattice and
`k ≥ 1`. Define the theta series `θ_L^{(k)} : ℋ_k^Φ → ℂ`,
`θ_L^{(k)}(Z) = Σ_{X ∈ L^k} e(Σ_{τ ∈ Φ} tr(τ(T_X) Z_τ))`. Prove:
(a) absolute and locally uniform convergence, holomorphy, and the Fourier expansion
`θ_L^{(k)}(Z) = Σ_T r(L, T) e(Σ_τ tr(τ(T)Z_τ))` over positive semidefinite `T ∈ Herm_k(E)`;
(b) `θ_{gL} = θ_L` for `g ∈ U(V)(F)`, `θ_{L ⊥ M} = θ_L θ_M`, and
`θ_L(τ(A) Z τ(A)^*) = θ_L(Z)` for `A ∈ GL_k(O_E)`;
(c) `θ_L(Z + B) = θ_L(Z)` for `B = (τ(B_0))_τ` with `B_0 ∈ Herm_k(E)` such that
`Tr_{F/ℚ} tr(T_X B_0) ∈ ℤ` for all `X ∈ L^k`;
(d) inversion: `θ_L(−Z^{−1}) = (|d_E|^{n/2} N(𝔳(L)))^{−k}·∏_{τ ∈ Φ} det(Z_τ/i)^n·θ_{L^#}(Z)`, where
`L^# = 𝔇_{E/ℚ}^{−1} L^∨` is the dual of `L` for the symmetric form `Tr_{E/ℚ} ∘ h` and
`|d_E|^{n/2}N(𝔳(L))` is the covolume of `L` for that form.

Route: (a), (b), (c) are formal from absolute convergence (the real part of the exponent is
`−2π Σ_τ tr(τ(T_X) Y_τ)`, a positive definite quadratic form in `X`). (d): Poisson summation for the
lattice `L^k` in the real inner product space `(V ⊗_ℚ ℝ)^k` with the form `Tr_{E/ℚ} ∘ h`
(ThetaSeries 1A), applied to the Hermitian Gaussian `X ↦ e(Σ tr(τ(T_X)Z_τ))`; its Fourier transform
is `∏ det(Z_τ/i)^{−n}` times the Gaussian of `−Z^{−1}`, proved for `Z = iY` by diagonalizing `Y` and
extended to `ℋ_k^Φ` by the identity theorem. The exponent `n` is an integer, so no branch of the
determinant is chosen.

*Needs:* 4.0; ThetaSeries 1A, 3A.

**Checks.**

- `k = 1` and `Z_τ = z` for every `τ`: `θ_L^{(1)}(z)` is ThetaSeries' `thetaSeries` (3A) of the
  real model of the `ℤ`-lattice `(L, Tr_{E/ℚ} ∘ h)` at `z`, since `e(z Tr_{F/ℚ} h(x, x)) =   exp(πiz·Tr_{E/ℚ}h(x, x))`.
- `E = ℚ(i)`, `L = ℤ[i]` with `x̄y`, `k = 1`: `θ_L(z) = (Σ_{m ∈ ℤ} e(m² z))²`; `𝔇_{E/ℚ} = (2)`, so
  `L^# = (1/2)ℤ[i]` and the covolume is `2`. At `z = i`, (d) reads `θ_L(i) = θ_{L^#}(i)/2`, the square
  of Jacobi's `Σ_m e^{−2πm²} = 2^{−1/2}Σ_m e^{−πm²/2}`.

### 7.2 Siegel's main theorem as a statement on theta series

*Origin:* this roadmap's own formulation: the genus average of the theta series of 7.1 and its Fourier coefficients,
over a CM field and with the densities in this roadmap's normalisation; for positive Hermitian forms over an imaginary
quadratic field the corresponding statement on representation numbers (6.5(b)) is Braun (1941), Satz V. The form of
the formal proof below is published: Weil (1965), the mean-value form of Siegel's main theorem (6.5(a)), here as the
identity for the mean of the rational points of a Gram fibre, in the setting of [FormalProof], a CM extension and
`2k < n`.

*Method of the formal proof:* the genus average is not a statement of [FormalProof], which has no theta series of a
Hermitian lattice in a matrix variable (7.1). [FormalProof] states the identity with the `T`-th coefficient of `Φ` on
one side, a Fourier transform of `Φ` along the Gram map `X ↦ T_X`, and the integral of `Φ` over the theta mean on the
fibre `X_T` on the other: the coefficient is computed for pure tensors by an approximate identity around `T` as the
archimedean fibre integral times the product of the local fibre measures, and the measure form 6.5(a) identifies that
product with the mean of the rational points with Gram matrix `T`. The form recorded below has the value `∫ Φ dμ_T` in
place of that coefficient, and the route written here reads it off 6.5(a).

*Corollary of:* MetaplecticAutomorphicForms §6.4b (Weil's mean-value form of Siegel's formula for unitary groups, for
`T` of size `k` with `2k < dim V`), for the form of the formal proof below.

Let `V`, `L` be as in 7.1 and `1 ≤ k ≤ n − 1`. Prove that the genus average
`Θ_gen^{(k)}(L)(Z) = mass(L)^{−1}Σ_{[M]} θ_M^{(k)}(Z)/|U(M)|` has, at every totally positive definite
`T`, the Fourier coefficient `α_∞(L, T)·∏_v α_v(L, T)`.

Route: 6.5(b) coefficientwise with 7.1(a).

*The form of the formal proof.* Let `E/F` be a CM extension, `V` a nondegenerate Hermitian space over `E` of dimension
`n`, `k ≥ 1` with `2k < n`, `T ∈ Herm_k(E)` nondegenerate and `Φ` a Schwartz–Bruhat function on `V(𝔸)^k`, with `X_T`,
`μ_T` and the Tamagawa measure `dg` as in 6.5(a). The mean over `U(V)(F)\U(V)(𝔸)` of the rational points of the Gram
fibre, `τ(U(V))^{−1}∫_{U(V)(F)\U(V)(𝔸)} Σ_{X ∈ X_T(F)} Φ(g^{−1}X) dg`, is `∫_{X_T(𝔸)} Φ dμ_T`: a case of 6.5(a), in
the setting recorded there as the form of the formal proof, and read off it.

*Needs:* 6.5, 7.1.

**Checks.**

- `E = ℚ(√−3)`, `L = O_E²`, `k = 1`: the coefficient of `e(z)` is `12` (6.5's Check) and equals
  `r(L, 1)` because the genus has one class.
- The statement is for totally positive definite `T` only; it does not extend to singular `T`, at which
  the densities of 6.1 (defined for nondegenerate `T`) do not exist. For `L = O_E²` over `ℚ(√−3)` and
  `k = 1` the constant coefficient (`T = 0`) is `1`, since `X = 0` is the only solution and
  `mass(L)^{−1}Σ_{[M]}1/|U(M)| = 1`; the expression of 6.1b vanishes at `T = 0` for `k < n` (factor
  `N_{F/ℚ}(det T)^{n−k}`), and the normalized counts of 6.1(a) for `T = 0` at the inert `2` (`5/4`, `11/8`,
  `23/16`, … for `N = 1, 2, 3, …`) are not eventually constant.

### Examples

For `E = ℚ(i)`, `L = ℤ[i]` and `k = 1`, `θ_L(z) = (Σ_{m ∈ ℤ} e(m²z))²`, and the inversion reads `θ_L(i) = θ_{L^#}(i)/2` (7.1). For `L = O_E²` over `ℚ(√−3)` and `k = 1`, the coefficient of `e(z)` of the genus average is `12` (7.2).

### Dependencies

Layers 4–6; ThetaSeries 1A, 3A.

## Downstream consumers

- ThetaLiftsForDefiniteUnitaryGroups: the conventions on sesquilinearity, definiteness and
  skew-Hermitian invariants, and the lattice notions of a skew-Hermitian space (Conventions, 1.0); the
  unitary group schemes (0.1) and the section of `det`, with `U(V) = SU(V) ⋊ U(1)` (0.2), and the integral
  models of lattice stabilizers (4.6); Witt's theorem, hyperbolic planes and Witt indices (1.1, 1.2, 2.3, 2.4);
  compactness and strong approximation (2.5); Landherr's theorem and isotropy (3.1, 3.5(b)); unimodular lattices and
  the local and global hyperbolic splittings, for Hermitian and skew-Hermitian lattices, for its
  complementary-space induction (4.2, 4.2(d), 4.7(b), 4.7(c)); lattices fixed by compact open
  subgroups (4.5, 4.5(c)); class sets, finiteness, Minkowski's bound and the mass (5.1, 5.2, 5.2(c),
  5.5); `τ(U(V)) = 2` (6.0b); theta series, their Fourier expansion and the dual `L^#` of their inversion (7.1,
  7.1(a), 7.1(d)) and Siegel's main theorem in the lattice form (6.5(b)). It
  uses these statements in the generality stated here.
- SlopesOfHermitianVectorBundles: localization and gluing of lattices over a Dedekind domain
  (4.0(f), (g)), and the index of two lattices over a discrete valuation ring with its additivity
  (4.0b), for the local indices in its Gram and comparison formulas (its 1.2, 1.2a), in the generality stated here.
- The roadmaps of this family on chains of theta lifts: local and global classification and existence with prescribed
  invariants (2.1, 2.3, 3.1, 3.2); gluing of lattices from local data in module form (4.0(g));
  unimodular lattices and compact open subgroups (4.2, 4.5); class sets, finiteness, stabilizers,
  Minkowski's bound and small levels (5.1, 5.2, 5.2(d)(ii)); neighbours (5.4); masses, the index formula and the
  dimension of spaces of algebraic modular forms (5.5–5.7); the Tamagawa number (6.0b); local
  densities (6.1, 6.1a) and the archimedean fibre measure on `U(V)(F_∞)` (6.1(f), in
  ThetaChainsAndFrobeniusPrimeSums §9.4); the
  mass formula for every signature (6.2(b)); its closed form and the mass of
  `O_E^n` (6.3, 6.3(c)); ratios of masses (6.4); discriminant forms, the local densities of integral
  lattices at split and unramified places through them, gluing along discriminant forms and the total
  weight of the unimodular lattices meeting a subspace in a given lattice (4.8, 4.9, 6.1d(d), 6.4a), for
  their mean value formula; the number of sublattices of given index, the integral lattices meeting two
  orthogonal subspaces, the classes of subspaces carrying an integral lattice of given discriminant,
  the total mass of the integral lattices of given discriminant and the weighted count of subspaces
  (4.10, 4.11, 5.9, 6.4b, 6.4c), for their mean count of pairs of rows; Siegel's main theorem in
  Weil's form for one nondegenerate Gram matrix in an indefinite space (6.5(a)), for their row
  statements, and the volumes of stabilisers (6.5 (d));
  the primes that divide the order of no finite unitary stabilizer (5.2 (e)); short vectors of duals and
  short generators (4.12 (b), 4.13); and, in their lattice arguments, projection–intersection duality
  and the dual index of a projected lattice (4.0a(b), (c), in CongruenceModulesOfThetaLifts §7.15 and
  GluedTargetAndDivisionInequality §8.20) and the index of two lattices, its uniformity on subspaces, the
  descent lemma and flat base change (4.0b, in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties
  §8.19a). These roadmaps use the forms of the formal proof where a target states one: CM extensions unramified at
  every finite place, and for masses and counts totally positive definite spaces and integral lattices; Landherr's
  theorem for CM fields (3.1); the signed index (4.0a(c)), the inequality of 4.0b(a) and the descent lemma through it;
  the bound `n^{1 + log₂[E : ℚ]}` for the orbits (5.9) and `(n·nN_0)^{2s+1}` for the fibres (4.11); the mass formula
  with an undetermined constant `c_1` and the masses of standard lattices as numbers (6.3); the compact-dual
  normalisation (6.2(c)); the gluing counts of 4.9(c), (d); the metric neighbour chain (5.4); the strict inequality
  `t(M_v) < n′` (4.9(e), 6.4a); the exponent `(9s + 8 + 4l)/2` with cyclic
  discriminant modules (6.4c); and `2k < n` (6.5(a), (d)).
- EndoscopicTransferAndUnitaryTraceComparisonPartII names two statements proved here as gaps: its
  `gap:hermitian-field-classification` is 2.1(a), (b) (every characteristic, dyadic and ramified extensions included),
  and its `gap:unramified-hermitian-lattice-orbits` is 4.1(a), (b) with 4.2(a) at an unramified place (diagonal Jordan
  representatives `ϖ^λ`, unique, and every unimodular lattice with an orthonormal basis).

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

**Owned here.** Hermitian and skew-Hermitian forms over a quadratic étale algebra, the split algebra
included (its decomposition and isometry group in characteristic `≠ 2` are consumed from
MetaplecticAutomorphicForms §3.2a), and their base change (Layer 1); the group schemes `U(V)`, `SU(V)` of an
arbitrary Hermitian space, their reductive structure, the section of `det` and the centre of `U(V)` (Layer 0; for a
field `E` of characteristic `≠ 2` the clauses of the structure that ReductiveGroups §9D.1 states are corollaries of
it) and the integral models of lattice stabilizers (4.6); the forms
stated in Layers 2–3 of the classification of Hermitian spaces over nonarchimedean local fields and over number
fields, of Landherr's theorem in both directions, of the coherence criterion in dimension one and of the Hasse
principle for representations and isotropy, whose general theorems are GeometryOfNumbersAndQuadraticArithmetic
§§2.9.4a, 2.9.4b and 2a.1–2a.4; the local classification in positive characteristic; compactness of local unitary
groups (Layers 2–3); lattices over a Dedekind domain in module form (gluing from local data,
4.0(f), (g)), duality under orthogonal projection and intersection and the dual index of a projected
lattice for forms over a Dedekind domain with involution (4.0a), the index of two lattices over a
discrete valuation ring with its API, its uniformity on subspaces and the descent lemma (4.0b);
Hermitian lattices over the integers of a number field or local field, their invariants, Jordan
splittings at nondyadic and unramified places, unimodular lattices, the two notions of maximal lattice
and their comparison, hyperbolic splittings and the relative position of unimodular lattices, discriminant forms of
integral lattices over a Dedekind domain with
involution and the gluing of unimodular lattices along them (4.8, 4.9), the number of sublattices of
given index (4.10), the integral lattices meeting two orthogonal subspaces (4.11), short vectors of the
dual of a lattice over a CM field (4.12) and short generators of a lattice with a short spanning family
(4.13) (Layer 4); genera,
class sets, the bound for the classes of the norm-one torus at the congruence levels of a unimodular lattice (5.3),
neighbours, the Hermitian instances of the mass and dimension formulas for
algebraic modular forms, stabilizer bounds, unimodular genera and the classes of subspaces carrying an
integral lattice of given discriminant (Layer 5); the Tamagawa numbers of the norm-one torus and of
unitary groups, Weil's rank-one identity for unitary groups, local densities at every place for the
lattices of 6.1a, the local densities of integral lattices through their discriminant forms at the
places where the trace is onto (6.1d), the total weight of the unimodular lattices meeting a subspace in
a given lattice (6.4a), the mass formula for every signature and its closed forms, the bound for the
total mass of the integral lattices of given discriminant and the weighted count of subspaces (6.4b,
6.4c), Siegel's main theorem in Weil's form for every space, in the lattice form for definite spaces and
for primitive representations, and the volumes of stabilisers (Layer 6); Hermitian theta series of definite lattices
and their transformation laws (7.1), and the Fourier coefficients of their genus averages (7.2) (Layer 7). 2.1(a)
is the local classification that
EndoscopicTransferAndUnitaryTraceComparisonPartII asks of GeometryOfNumbersAndQuadraticArithmetic, and
3.1–3.2 are the Hasse classification and existence of global Hermitian spaces that
SelmerIwasawaCohomologyPartII and PELModuliPartII ask of AdelicAlgebraicGroups: GeometryOfNumbersAndQuadraticArithmetic
§2.9.4a (in characteristic zero) and §§2a.1, 2a.2 state them, and 2.1(a), 3.1 and 3.2 are their forms here.

**Consumed, not restated.**
[GeometryOfNumbersAndQuadraticArithmetic](../../GeometryOfNumbersAndQuadraticArithmetic/README.md) owns the carrier
`IntegralHermitianLattice` of integral Hermitian lattices (4.0(e) compares), the invariant factors
(§§2.5, 2.7), `SignedHermitianSpace` and the signed Witt groups over odd residue characteristic
(§2.9), the Hermitian counts over finite fields (§3.1), the unramified local densities, Siegel
polynomials and Siegel series (§3.2), and the quadratic rank-one Weil operators, fibre distributions
and rank-one Siegel–Weil identity (§3.3), which 6.0a applies to the trace form, and the orders of the
finite orthogonal groups (§3.3). [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md) owns adelic points, Tamagawa measures and the
invariance of Tamagawa numbers under restriction of scalars, Siegel sets and their covering of
`G(F)\G(𝔸)` (§3.4), class-number finiteness, strong approximation and torsors; [OrbitMeasuresOnAdelicGroups](../OrbitMeasuresOnAdelicGroups/README.md)
owns the measure of a top form on a smooth variety, the quotient of Tamagawa measures on a homogeneous
space, the Tamagawa measure and number of a group with a unipotent radical, `τ(G_m) = 1` and the
Tamagawa numbers of quotients by central induced tori (§§2.6, 3.4a).
[AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md)
owns algebraic modular forms on groups compact at infinity, their class-set decomposition and
sufficiently small levels (7.4, 7.5); [DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md) owns the mass of a level, the
dimension formula and the duality of lattices of class-sum forms (§§7.5a, 7.5c); 5.5–5.7 are their
instances for `U(V)`.
[AnalyticNumberTheoryPartII](../../AnalyticNumberTheoryPartII/README.md) owns adelic Schwartz–Bruhat functions and Poisson summation.
[MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md) owns the split
ε-Hermitian spaces over `F × F` in characteristic `≠ 2`, their decomposition `A ⊕ A^∨` and their
isometry group `GL(A)` (§3.2a); 0.1 consumes them and adds characteristic two and the isomorphism of
group schemes.

**General theorems in their homes.** What is owned here is the form of each statement given here. The general
theorems of which sections here are corollaries (their `*Corollary of:*` lines), or which they cite for the theorem
they state (1.3, 1.5, 4.3, 4.6 and 5.3), are owned by their homes: ReductiveGroups §9D.1;
ReductiveGroupsPartII §RG2.3.5a; GeometryOfNumbersAndQuadraticArithmetic §§2.2.6, 2.4.7, 2.4.8, 2.5.7, 2.7.4–2.7.7,
2.9.2, 2.9.3, 2.9.3a–2.9.3c, 2.9.4a, 2.9.4b, 2.9.6, 2a.1–2a.5, 3.1.3, 3.2.8, 3.2.9 and 4.4.13; AdelicAlgebraicGroups
§§1.5a, 3.4a, 4.1a, 4.2a, 4.5a; MetaplecticAutomorphicForms §§3.2a, 6.4b; AutomorphicFormsOnReductiveGroups §7.5;
FiniteGroupInvariants §10.2a; ThetaSeries Layer 9; PotentialAutomorphyDworkMotivesPartII §0.7.

**Outside this roadmap.** The quadratic analogues (GeometryOfNumbersAndQuadraticArithmetic §§2.4, 3.3,
IntegralLattices, OrthogonalTamagawaAndLatticeMass), among them the quadratic discriminant form `q_L` of
an even `ℤ`-lattice, even overlattices and Nikulin's existence theory (IntegralLattices, Layers 1 and 5);
for `R = ℤ` the bilinear statements of 4.8 and 4.9 are Tau Ceti's (the discriminant bilinear module and
the gluing of even lattices, `TauCeti.IntegralLattice.discriminantBilinearModule`,
`TauCeti.IntegralLattice.glueAlongDiscriminant`) and are compared in 4.8 and 4.9, not proved again.
Quaternionic Hermitian forms
(GeometryOfNumbersAndQuadraticArithmetic §2.8) and Hermitian forms over central simple algebras with
an involution of the second kind. Global function fields: Layer 3 follows GlobalQuadraticForms, and
Layer 6 follows AdelicAlgebraicGroups, AnalyticNumberTheoryPartII and
GeometryOfNumbersAndQuadraticArithmetic §3.3, all of which are over number fields. Local fields of
characteristic two beyond Layer 1, 2.1 and 2.4. The classification of lattices at dyadic ramified
places beyond 4.3 and the conjugacy of norm-maximal lattices (4.4(c)), and local densities there
beyond the general statement 6.1 (6.1d excludes them).
Hermitian modular forms
as a theory on the Hermitian half-space: Layer 7 states theta series, their transformation laws and
their genus averages only. The theta correspondence: Weil representations, adelic theta
kernels and the identification of genus averages of theta series with Siegel Eisenstein series (the Siegel–Weil
formula) belong to MetaplecticAutomorphicForms and ThetaLiftsForDefiniteUnitaryGroups. The comparison
of the Hermitian spaces of PELModuli M0.22 (`HermitianSpace`, `HermitianSpace.unitaryGroup`,
`HermitianSpace.coordinate`; linear in the first variable, over CM orders) with those here is
the flip of 1.0, stated by the roadmaps that use both. Hermitian K-theory and Witt groups of rings
(GeometryOfNumbersAndQuadraticArithmetic Layer 6, HermitianKTheoryOfPoincareCategories). The mass of
the unimodular positive-definite Hermitian lattices over an imaginary quadratic field of class number
one, the unitary mass formula for them and the growth of their total mass in the rank are
AbelianSchemesAndArithmeticModuliPartII F5.7's; 5.5 and 6.2–6.3 are kept as the general forms, for
every CM extension, every lattice and, in 6.2(b), every signature.

## Exact supplier contracts

### From Mathlib

`LinearMap.IsSymm` (for `σ`-sesquilinear forms `M →ₛₗ[σ] M →ₗ[R] R`), `LinearMap.Nondegenerate`,
`LinearMap.IsOrthoᵢ`, `LinearMap.flip`, `LinearMap.baseChange`, `TensorProduct.lift`,
`LinearMap.isSymm_iff_isHermitian_toMatrix`, `Matrix.IsHermitian`, `Matrix.PosDef`,
`Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `Algebra.IsQuadraticExtension`,
`Algebra.Etale`, `Algebra.TensorProduct`, `Algebra.trace`, `traceForm_nondegenerate` (the trace form of a
finite separable field extension is nondegenerate, used in 1.6), `Algebra.norm`, `Submodule.IsLattice`,
`IsLocalization`, `IsDedekindDomain`, `IsDedekindDomain.HeightOneSpectrum`, `Module.Projective`,
`Module.Flat`, `Module.length`, `Submodule.exists_smith_normal_form_of_le` (Smith normal form over a
principal ideal domain, used in 4.0b, 4.7(a′) and 4.8), `DoubleCoset`, `NumberField.IsCMField`,
`NumberField.dedekindZeta`, `NumberField.dedekindZeta_residue`, `MeasureTheory.Measure.addHaar`,
`Complex.Gamma`; `groupCohomology.exists_div_of_norm_eq_one` (Hilbert 90 for a cyclic extension, used
in 5.3 and 6.0); `LinearMap.BilinForm.dualSubmodule`, `LinearMap.BilinForm.dualSubmodule_dualSubmodule_of_basis`
and `LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip_of_basis` (the dual of a submodule for a
bilinear form and double duality for lattices with a basis, compared in 4.0a).

### From Tau Ceti

The integral-lattice library over `ℤ` (the native labels 1C–1F of IntegralLattices), for the case
`R = ℤ`, `c = id`, `ε = 1` of 4.8 and 4.9, which is compared with these declarations and not proved
again:
- `TauCeti.IntegralLattice.DiscriminantGroup` (`L^∨/L`), `discriminantPairing` (the pairing `H(x, y)`
  modulo `ℤ`), `discriminantBilinearModule`, `isNondegenerate_discriminantBilinearModule`,
  `Isometry.discriminantBilinearIsometry` (`LinearAlgebra/IntegralLattice/Discriminant/Group.lean`,
  `Discriminant/Bilinear.lean`): 4.8(a) for `ℤ`-lattices.
- `TauCeti.IntegralLattice.glueAlongDiscriminant`, `isUnimodular_glueAlongDiscriminant`,
  `mem_glueAlongDiscriminant_left_iff`, `exists_eq_glueAlongDiscriminant` (`Overlattice/Graph.lean`:
  even lattices glued along an isometry `q_L → −q_M` of the quadratic discriminant forms are even
  unimodular and meet the two summands in the given lattices, and every such overlattice arises so;
  Nikulin 1.6.1), `integralIntermediateCarrierOrderIsoIsotropicSubgroup` (`Overlattice/Isotropic.lean`:
  integral overlattices correspond to bilinear-isotropic subgroups) and
  `IntermediateCarrier.IsIntegral.isUnimodular_toIntegralLattice_iff_isLagrangian`
  (`Overlattice/Dual.lean`): 4.9(a)–(c) for `ℤ`-lattices.

`ZLattice.exists_basis_gauge_le` and `ZLattice.exists_basis_gauge_le_max_one_mul` (a basis of controlled gauge of a
lattice with short independent vectors, Cassels Ch. V, Lemma 8; listed by SuccessiveMinima): named in the `*Origin:*`
label of 4.13.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

- 0.2.5 `dual_projection_comap`: `(π(Δ))^* = Δ^* ∩ W^⊥` for `ℤ`-submodules of a real inner-product
  space, the real form of the first identity of 4.0a(b) (compared there).
- 2.2.3 `IntegralQuadraticLattice.le_iff_local`, 2.2.4 `IntegralQuadraticLattice.mem_iff_local`,
  2.2.5 (descent between lattices and completed lattices over a discrete valuation ring): statements
  about full lattices in a `K`-space over a Dedekind domain, which use no form; 4.0(f), (g).
- 2.5.2, 2.5.3, 2.5.4, 2.7.3: the invariant factors of `L^∨/L` over a discrete valuation ring, their
  uniqueness (the number of exponents `≥ m` is `dim π^{m−1}M/π^mM`), and `t(L)`, `val(L)` (4.1's Check;
  in 4.8(b) they are the scales of the Jordan constituents of positive scale).
- 2.7.1 `IntegralHermitianLattice.ofCarrier`, 2.7.2 `IntegralHermitianLattice.dual`: the carrier
  (conjugate-linear in the first argument) and the dual `L^∨ = {x : H(x, L) ⊆ R}` of an integral
  lattice over a Dedekind domain with involution, with its double duality; compared in 4.0(e) and
  4.0a.
- §2.9 `SignedHermitianSpace E V ε` and `signedHermitianAdjoint`; 2.9.2 the determinant class;
  2.9.3, 2.9.5 twisting by a scalar; 2.9.6 `signedHermitianTransfer`. These are statements about field
  forms (2.9.6 for a field extension with extending involutions); 1.6 is proved directly for every
  quadratic étale `E`; for a field `E` its clause (a) and the nondegeneracy in (b) are corollaries of 2.9.3 and 2.9.6
  (its `*Corollary of:*` line).
- 3.1.3 `finite_hermitian_isometry_formula`: the number of injective isometries over
  `𝔽_{q²}/𝔽_q`, giving `|U_n(𝔽_q)|` and the embedding counts.
- 3.2.1, 3.2.2 `hermitianLocalDensity`, `hermitian_count_stabilizes`,
  `primitive_hermitian_smooth_count`: normalized counts and densities over an unramified quadratic
  extension, smoothness of the Gram map at a self-dual target including residue characteristic two.
- §3.3, for a nondegenerate quadratic form `Q` of rank `m > 4` over a number field, the statements
  (not their proofs): `quadraticWeilOperators`, the rank-one Weil operators (multiplication by
  `ψ(bQ)`, normalized dilation `|a|^{m/2}φ(a·)`, Fourier transform), their rational splitting, their
  commutation with `O(Q)(𝔸)` and the invariance of `Θ(φ) = Σ_{x ∈ V(K)}φ(x)`; `quadraticFiberDistribution`
  and `quadraticFiberFourier`, the local and adelic fibre measures with gauge `dx/dQ` on the nonzero
  vectors, their positivity, orthogonal invariance, scaling `F_{φ∘a}(t) = |a|^{−m+2}F_φ(a²t)`,
  continuity in `t` and Fourier transform `b ↦ ∫φ(x)ψ(bQ(x))dx`, with local factors `1 + O(q^{−2})`;
  `rankOneSiegelWeil`, the identity `∫_{[SO(Q)]}Θ(φ(g^{−1}·))dg = φ(0) + Σ_{t∈K}F_φ(t)` with the
  right side (the rank-one Eisenstein distribution) absolutely convergent and continuous in `φ`. Used
  in 6.0a, 6.0b for `Q = q_h`.
- §3.3 `finiteOrthogonalOrder`: `|SO^±_{2r}(𝔽_q)| = q^{r(r−1)}(q^r ∓ 1)∏_{i=1}^{r−1}(q^{2i} − 1)` and
  `|SO_{2r+1}(𝔽_q)| = q^{r²}∏_{i=1}^{r}(q^{2i} − 1)`, with the orders of the disconnected orthogonal
  groups; used in 6.1a(b)–(d).
- 4.4.13 `euclidean_dual_transference_upper`: `λ_i(L)λ_{n+1−i}(L^*) ≤ n` for a full Euclidean lattice of
  rank `n` (transference); used in 4.12, and the general theorem of which 4.12 is a corollary.
- 2.9.3c (Jacobson's theorem, characteristic `≠ 2`): stated, as used by 3.1, in 1.3.
- 2.7.5 (d) (the splitting of a lattice at a dyadic ramified place into modular lattices of rank one or two): stated
  in 4.3.
- The general theorems of which sections here are corollaries, each named in the section's `*Corollary of:*` line:
  2.9.3a (Witt's theorems over a field with involution, 1.1), 2.9.3b (the Witt decomposition, 1.2), 2.9.2 (the
  determinant class, 1.4), 2.9.3 and 2.9.6 (twist and transfer, 1.6), 2.9.4a (the classification over a
  nonarchimedean local field of characteristic zero, 2.1), 2.9.4b and 2a.3 (the Witt index and the normalized sign,
  coherent collections; 2.4, 3.4), 2a.1, 2a.2, 2a.4, 2a.5 (Landherr's theorem, existence, embeddings, subspaces; 3.1,
  3.2, 3.5, 5.9), 2.2.6 and 2.7.4 (gluing, the invariants of a Hermitian lattice; 4.0), 2.5.7 (the index of two
  lattices, 4.0b), 2.7.5 (Jordan splittings, 4.1), 2.7.6 (unimodular lattices and the classification by Jordan type;
  4.2, 4.8), 2.7.7 (norm-maximal lattices, 4.4), 2.4.7 and 2.4.8 (special genera, neighbours; 5.3 cites the first for
  its (a)–(c), 5.4), 3.2.8 and 3.2.9 (local densities and their values; 6.1, 6.1a, 6.1d).

### From TauCetiRoadmap.QuadraticFormInvariants

Layer 1 (Witt's extension theorem), used over finite fields in 6.1a(d).

### From TauCetiRoadmap.PotentialAutomorphyDworkMotivesPartII

§0.7: every nondegenerate Hermitian form over a quadratic extension of finite fields has an orthonormal basis, so any
two are isometric; used in 1.5.

### From TauCetiRoadmap.GlobalQuadraticForms

4.1: the Hilbert-symbol product formula `hilbertSymbol_productFormula` and the sign prescription
`TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite` (O'Meara 71:19a). 6.3: the
Hasse–Minkowski theorem for isometry of regular quadratic forms over a number field.

### From TauCetiRoadmap.ClassFieldTheory

§6.1 (`localArtinEquiv`): local reciprocity, `[F^× : N_{E/F}(E^×)] = 2` for a separable quadratic extension of
nonarchimedean local fields of any characteristic. §13.1: `cyclicHasseNorm`,
`isGlobalNorm_iff_isLocalNormEverywhere`.

### From TauCetiRoadmap.GlobalNumberFields

Layer 1: `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (signs at real places and finite
places prescribed simultaneously), used in 2.5(e), (f) and 3.2. Layer 6:
`IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap` (additive strong approximation), used in
4.7(b).

### From TauCetiRoadmap.AdelicAlgebraicGroups

§1.5 (compact open subgroups of adelic points); §2.2 *quotient-measure* (existence, uniqueness of
invariant measures on a coset space); §2.4 invariant top forms, the Haar measure of a gauge form over
a local field, the orders of connected reductive groups over finite fields (used in 6.1a), Tamagawa
measures, *convergence-factors*, independence of the gauge form and the Tamagawa number; §2.5
*tamagawa-restriction-scalars* (used in 6.0); §3.1 Iwasawa integration; §3.4 adelic Siegel sets
`𝔖(T′, ω) = {pak : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) − T′) > 0 for β ∈ Δ_0}` with `ω` a compact subset of
`N_0(𝔸)M_0(𝔸)^1` (the window in `M_0(𝔸)^1` included) and *Siegel sets cover* (`G(𝔸) = G(F)𝔖(T′, ω)` for
some `T′`, `ω`), used in 6.0a for `U(V)` and for `SL_2`; the component decomposition of a level
quotient, finite volume, the compactness of
`F^×\𝔸_F^1` and *class-number-finite*; §4.1 torsors over a field and their classes; §4.2
*strong-approximation-sufficiency*; §4.4 *rational-stabilizer-finite*. The general theorems of which sections here are
corollaries: §1.5a *lattice-stabilizers* (4.5); §3.4a *tamagawa-multiplicative-group* and §4.1a
*tamagawa-quadratic-norm-torus* (6.0); §4.2a *strong-approximation-any-places* (2.5(d)); §4.5a *class-set-integration*
(5.5, 5.6).

### From OrbitMeasuresOnAdelicGroups, a sub-roadmap of this family

§2.6 *top-form-measure* (the measure `|ω|` of a nowhere vanishing top form on a smooth quasi-affine
variety over a local field of characteristic zero, with its fibre formula for smooth morphisms; used in
6.1), *tamagawa-measure-unipotent-radical* (`X^*(M ⋉ N) = X^*(M)`, the Tamagawa measure of `M ⋉ N` with
the convergence factors of `M`; used in 6.0b) and *homogeneous-gauge-measure* ((i) the line of invariant
forms on an orbit `X = H\G` and `ω_G = ω_H ⊗ ω_X`, (ii) the local quotient measure `= |ω_X|`, (iii) the
quotient of the Tamagawa measures `= |d_F|^{−dim X/2}∏_v|ω_X|_v` on `H(𝔸)\G(𝔸)` when the restriction
`X^*(G) → X^*(H)` of geometric characters is injective with finite cokernel, (iv) residue forms and fibre
measures on a `G`-stable open subvariety of a fibre `Φ^{−1}(t)`, all for `G` and `H` unimodular; used in
6.0b, 6.1(f), 6.5); §3.4a *tamagawa-multiplicative-group* (`τ(G_m) = 1`),
*tamagawa-number-unipotent-radical* (`τ(M ⋉ N) = τ(M)`) and *tamagawa-central-induced-quotient*
(`τ(G_2/T_1) = i·τ(G_2)/τ(T_1)` for a central induced torus `T_1` of a connected reductive `G_2`), used in
6.0, 6.0b.

### From TauCetiRoadmap.ReductiveGroups

Layer 6: reductive, semisimple and simply connected groups. §9D.1: the unitary group `U(V)` of a nondegenerate
Hermitian or skew-Hermitian space over a separable quadratic field extension in characteristic `≠ 2` is a connected
reductive form of `GL_n`, `SU(V)` a simply connected semisimple form of `SL_n`, `det` smooth and surjective with
`X^*(U(V)) ≅ ℤ` and the Galois action by `−1`; used in 0.2 (its `*Corollary of:*` line), in 2.5(d), in the
Conventions and in the routes of 6.0b and 6.5.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.0a *weil-restriction-group-scheme* and *norm-torus*; RG2.3.1 *schematic-closure* over a discrete
valuation ring; RG2.3.5a *hermitian-lattice-stabilizer-models* (the integral points of the schematic closure are the
stabilizer, and the model is reductive at unramified and split places for a unimodular lattice), the first two
statements of 4.6.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

§3.2a: for a field `F` of characteristic `≠ 2` and `E = F × F` with the exchange involution, every
ε-Hermitian space (`ε = ±1`) is `A ⊕ A^∨` with the pairing `h((x, ℓ), (y, k)) = (ℓ(y), εk(x))`, in the
convention conjugate-linear in the first variable, and its isometry group is `GL(A)`, acting by
`(g, (g^{−1})^∨)`; used in 0.1 and, through 0.1, in 1.4 and 2.3, and the general theorem of which 2.3 is a corollary.
§6.4b (Weil's mean-value form of Siegel's formula for unitary groups and the covolumes of stabilizers,
`2k < dim V`): the general theorem of which the terms `t ≠ 0` of 6.0a (c), 6.5 (a) and (d) for `2k < n`, and 7.2 are
corollaries.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

7.4 `IsAlgebraicModularForm` (Gross's rational model); 7.5 `equivSum`, `stabilizer_finite`,
`IsSufficientlySmall`, `stabilizer_trivial` (`S(J, M) ≃ ⊕_i M^{Γ_i}`; trivial stabilizers at a level
whose projection to one finite place is torsion-free). This roadmap states their instances for `U(V)`
(5.2, 5.7); 7.5 is the general theorem of which 5.7(a) is a corollary.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

§7.5a, the class-set integration formula, `mass J = Σ_i |Γ_i|^{−1}`, `vol(G(F)\G(𝔸)) = vol(G_∞ J)·mass J`
and `mass J' = [J : J']·mass J`; §7.5c, the dimension formula
`dim S(J, M) = Σ_i |Γ_i|^{−1}Σ_{γ ∈ Γ_i} tr ρ_i(γ)` and `dim S(J', M) = [J : J']·mass J·dim M` at a level
with trivial stabilizers, for a group compact at infinity. This roadmap states their instances for
`U(V)` (5.5, 5.6, 5.7).

### From TauCetiRoadmap.FiniteGroupInvariants

10.2: `minkowskiBound`, `card_dvd_minkowskiBound`, used in 5.2(c). 10.2a: for a number field `F ⊆ ℂ` and an odd
prime `ℓ` with `[F(ζ_ℓ) : F] > n`, no element of `GL_n(F)` has order `ℓ`; the general theorem of which 5.2(e) is a
corollary.

### From TauCetiRoadmap.RepresentationTheory.ClassicalGroups

Layer 5: the Weyl dimension formula for `GL_n`.

### From TauCetiRoadmap.ThetaSeries

1A: Poisson summation for a full lattice in a finite-dimensional real inner product space. 3A:
the theta series `thetaSeries L` of a lattice, for the Check of 7.1. Layer 9 (9A, 9B): the Hermitian theta series of
degree `s` of a `ℤ`-lattice in a complex space with a positive definite Hermitian form, its convergence and its
inversion; the general theorem of which 7.1 is a corollary when `F = ℚ`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

§2.17a: `L_f(1, η) = κ_E/κ_F`, identifying the residue quotient used here with the Hecke `L`-value
(Conventions; 6.0a).

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

§§5.3g–5.3h: local characters, self-dual measures, the adelic Schwartz–Bruhat space `S(V_𝔸)` (the
union over lattice pairs `L_2 ⊆ L_1` of the archimedean Schwartz space of `V ⊗_F F_∞` tensored with
the functions on `L_1/L_2`, so every element is a finite sum of functions `φ_∞ ⊗ ⊗_{v<∞}φ_v`, while the
finite combinations of functions factorizable over all places are only dense), the
Fourier transform for a nondegenerate pairing and Poisson summation (including the dilated form for
ideles acting by scalars), and the volume one of `V(F)\V_𝔸` for the self-dual measure; used in 6.0a
and 6.5.

## References

- [Landherr] W. Landherr, *Äquivalenz Hermitescher Formen über einem beliebigen algebraischen
  Zahlkörper*, Abh. Math. Sem. Univ. Hamburg 11 (1936). 3.1, 3.2, located through [Kirschmer],
  Theorem 2.4.1 and Remark 3.4.2 (3); through them 3.4, 3.5, 5.8, 5.9.
- [Jacobson] N. Jacobson, *A note on hermitian forms*, Bull. Amer. Math. Soc. 46 (1940). §2, the
  Theorem and formula (7), p. 267 (1.3).
- [Jacobowitz] R. Jacobowitz, *Hermitian forms over local fields*, Amer. J. Math. 84 (1962).
  Theorem 11.4, the classification of lattices at dyadic ramified places (4.3), as quoted in
  [Kirschmer], Theorem 3.3.18, p. 38; the local classification of Hermitian spaces and lattices behind 2.1, 2.4, 4.1,
  4.2, 4.8 and 5.8.
- [Scharlau] W. Scharlau, *Quadratic and Hermitian Forms*, Grundlehren 270, Springer (1985).
  Chapter 7, Witt's theorem in 1.1, the Witt decomposition (1.2) and Witt's extension theorem (5.9); Chapter 10,
  Landherr's theorem (3.1), as cited in [Kirschmer], Theorem 2.4.1, with 3.2, 3.5 and 5.9; the determinant class
  (1.4).
- [Knus] M.-A. Knus, *Quadratic and Hermitian Forms over Rings*, Grundlehren 294, Springer (1991).
  1.1, 1.2 over rings and in every characteristic.
- [Shimura64] G. Shimura, *Arithmetic of unitary groups*, Ann. of Math. 79 (1964). Proposition 4.13,
  the norm-maximal lattices form one genus (4.4), and Theorems 5.24 and 5.27, the special genera in a
  genus (5.3), as quoted in [Kirschmer], Lemma 3.5.2, p. 43, and Theorem 5.4.14, p. 89; unimodular
  lattices (4.2).
- [Shimura97] G. Shimura, *Euler Products and Eisenstein Series*, CBMS Regional Conference Series 93,
  AMS (1997). 6.1b, 6.2, 6.3, 6.4.
- [Minkowski] H. Minkowski, *Zur Theorie der positiven quadratischen Formen*, J. reine angew. Math.
  101 (1887). 5.2(c), through FiniteGroupInvariants 10.2, which locates the bound in its source; 5.2(d)(i), (iii).
- [Tate] J. Tate, *Fourier analysis in number fields and Hecke's zeta-functions*, thesis (1950), in
  J. W. S. Cassels and A. Fröhlich (eds.), *Algebraic Number Theory*, Academic Press (1967). 6.0
  (through `τ(G_m) = 1`, OrbitMeasuresOnAdelicGroups §3.4a).
- [Ono] T. Ono, *On the Tamagawa number of algebraic tori*, Ann. of Math. 78 (1963). 6.0 (through the
  quotient formula of OrbitMeasuresOnAdelicGroups §3.4a).
- [Weil61] A. Weil, *Adeles and Algebraic Groups*, Institute for Advanced Study (1961); Progress in
  Mathematics 23, Birkhäuser (1982). Tamagawa numbers of classical groups and gauge forms on
  homogeneous spaces: 6.0b, 6.1, 6.2.
- [Weil65] A. Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, Acta Math. 113
  (1965). 6.0a, 6.0b, 6.5, 7.2.
- [Siegel] C. L. Siegel, *Über die analytische Theorie der quadratischen Formen* I–III, Ann. of Math.
  36–38 (1935–1937). 6.1b, 6.5, the quadratic originals of the archimedean densities and of Siegel's main theorem.
- [Braun] H. Braun, *Zur Theorie der hermitischen Formen*, Abh. Math. Sem. Hansischen Univ. 14
  (1941). For Hermitian forms over an imaginary quadratic field: the local and archimedean densities (6.1, 6.1b),
  the main theorem, Satz V (6.5, 7.2), and theta series (7.1).
- [GanYu] W. T. Gan and J.-K. Yu, *Group schemes and local densities*, Duke Math. J. 105 (2000).
  Theorem 7.3, the local densities at the places of 6.1a(a), (b) and 6.1d(d) through smooth models,
  and §10, the mass formula (6.2), as quoted in [Kirschmer], Theorems 4.2.4 and 4.2.3, pp. 51–52; smooth models
  of lattice stabilizers (4.6), local densities (6.1).
- [Hironaka] Y. Hironaka, *Local zeta functions on Hermitian forms and its application to local
  densities*, J. Number Theory 71 (1998). Local densities of Hermitian lattices at unramified places,
  6.1a, 6.1d.
- [Nikulin] V. V. Nikulin, *Integral symmetric bilinear forms and some of their applications*, Math.
  USSR-Izv. 14 (1980). Discriminant forms and the gluing of `ℤ`-lattices along them, the quadratic models
  of 4.8, 4.9 and 4.11.
- [GHY] W. T. Gan, J. P. Hanke and J.-K. Yu, *On an exact mass formula of Shimura*, Duke Math. J. 107
  (2001). 4.4, 6.1a(d), 6.3, 6.4.
- [Cho] S. Cho, *Group schemes and local densities of ramified hermitian lattices in residue
  characteristic 2, Part I*, Algebra & Number Theory 10 (2016). Scope of 4.3 and 6.1.
- [HashimotoKoseki] K. Hashimoto and H. Koseki, *Class numbers of definite unimodular hermitian forms
  over the rings of imaginary quadratic fields*, Tôhoku Math. J. 41 (1989). Checks of 6.3.
- [Feit] W. Feit, *Some lattices over Q(√−3)*, J. Algebra 52 (1978). The second and fourth Checks of
  6.3.
- [Rapinchuk] A. S. Rapinchuk, *On strong approximation for algebraic groups*, arXiv:1207.4425v1 (2012).
  Theorem 2.3, p. 12, the strong approximation theorem of Kneser and Platonov for any finite set of places (2.5(d)).
- [Kneser] M. Kneser, *Klassenzahlen definiter quadratischer Formen*, Arch. Math. 8 (1957). 5.4, the
  neighbour method, in the Hermitian form of [Kirschmer], Proposition 5.2.5, p. 76.
- [Schiemann] A. Schiemann, *Classification of Hermitian forms with the neighbour method*, J.
  Symbolic Comput. 26 (1998). 5.4.
- [Kirschmer] M. Kirschmer, *Definite quadratic and hermitian forms with small class number*,
  Habilitationsschrift, RWTH Aachen (2016). Definition 2.1.3 (5) (1.4); Theorem 2.1.4 (1.1); Definition 2.3.3
  (4.0); Theorem 2.4.1, p. 20 (3.1); Theorem 3.2.3 and
  Corollary 3.2.4, pp. 29–30 (2.1, 2.4); Algorithm 3.3.2, Theorem 3.3.3 and Proposition 3.3.5, pp. 31–33
  (4.1, 4.2, 4.3, 4.8, 5.8); Theorem 3.3.6 (4.2); Theorem 3.3.18, p. 38 (4.3); Corollary 5.1.4 (5.3); Remark 3.4.2 (3), p. 40 (3.2); Definition 2.3.3 (7), p. 18,
  and Lemmas 3.5.2, 3.5.3, p. 43 (4.4); Definition 5.2.1 and Propositions 5.2.4, 5.2.5, pp. 75–76 (5.4);
  Theorem 5.4.14, p. 89 (5.3); Definition 4.2.2, pp. 50–51 (6.1); Theorem 4.2.3, p. 51 (6.0b, 6.2);
  Theorem 4.2.4 and Lemma 4.2.5, pp. 52–53 (6.1a, 6.1d); Definition 4.2.6 and Lemma 4.2.9, pp. 53–56
  (6.1a); Proposition 4.2.7 (3), pp. 54–55 (6.3).
- [Gross] B. H. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999). 5.5, 5.7.
- [CohenResnikoff] D. M. Cohen and H. L. Resnikoff, *Hermitian quadratic forms and Hermitian modular
  forms*, Pacific J. Math. 76 (1978). 7.1.
- [OMeara] O. T. O'Meara, *Introduction to Quadratic Forms*, Grundlehren 117, Springer (1963). The
  quadratic analogues of 4.1 and 5.4; §§81–82, lattices over a Dedekind domain, their invariants and double duality
  (4.0, 4.0a); Hilbert's reciprocity law (2.4).
- [PlatonovRapinchuk] V. Platonov and A. Rapinchuk, *Algebraic Groups and Number Theory*, Academic Press (1994);
  second edition: V. Platonov, A. Rapinchuk and I. Rapinchuk, *Algebraic Groups and Number Theory*, Volume I, second
  edition, Cambridge Studies in Advanced Mathematics 205, Cambridge University Press, 2023. §2.3.3 and Proposition
  2.35 (3), the unitary groups as forms of `GL_n` and `SL_n` (0.2); Proposition 2.36, Hermitian spaces as torsor
  classes (3.3); Chapter 7, weak approximation (2.5(f)).
- [HKS] M. Harris, S. Kudla, W. J. Sweet, *Theta dichotomy for unitary groups*, J. Amer. Math. Soc. 9 (1996),
  941–1004. The normalized sign (2.4).
- [Kudla] S. S. Kudla, *Central derivatives of Eisenstein series and height pairings*, Ann. of Math. 146 (1997),
  545–646. The terms coherent and incoherent (3.4).
- [Stacks] The Stacks Project, Commutative Algebra, §10.121 *Orders of vanishing*,
  <https://stacks.math.columbia.edu/tag/02MB>. Definition 10.121.5 and Lemmas 10.121.6, 10.121.7, the index of two
  lattices over a discrete valuation ring (4.0b).
- [Borel] Armand Borel, *Some finiteness properties of adele groups over number fields*, Publications mathématiques
  de l'IHÉS 16 (1963), pp. 5–30. Lattice stabilizers (4.5); §2.1 and Proposition 2.3, lattices from their
  localizations and the classes in the genus of a rational quadratic form as double cosets, adapted in 5.1; Theorem
  5.1, finiteness of class numbers (5.2(a)).
- [Tits] J. Tits, *Reductive groups over local fields*, in *Automorphic Forms, Representations and L-functions*
  (Corvallis 1977), Proc. Sympos. Pure Math. 33, Part 1, AMS 1979, 29–69. 1.15,
  3.8.1, 3.9 and 3.9.1, integral models of lattice stabilizers (4.6).
- [BruhatTits] Bruhat and Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local II:
  groupes unitaires*, Bull. Soc. Math. France 115 (1987), 141–195. 4.6.
- [Satake] Satake, *Theory of spherical functions on reductive algebraic groups over p-adic fields* (1963). The
  Cartan decomposition (4.7(a), (a′)).
- [Banaszczyk] Wojciech Banaszczyk, *New bounds in some transference theorems in the geometry of numbers*,
  Mathematische Annalen 296 (1993), 625–635. Theorem 2.1, transference (4.12).
- [Cassels] J. W. S. Cassels, *An Introduction to the Geometry of Numbers*, Grundlehren 99, Springer (1959). Chapter V,
  Lemma 8, after Mahler and Weyl (4.13).
- [Serre07] J.-P. Serre, *Bounds for the orders of the finite subgroups of G(k)*, in *Group representation theory*,
  EPFL Press (2007), 405–450. §2.2, Theorem 2′ (5.2(e)).
- [LiZhang] C. Li and W. Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, arXiv:1908.01701 (2019).
  Lemma 9.1.1, from an almost self-dual lattice to a self-dual lattice of one more dimension (4.4).
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for
  Dirichlet L-functions announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. The file paths given above are relative to the
  directory `src/` of the first commit of that repository, the source as published:
  <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src>.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.

# Roadmap: theta kernels for unitary dual pairs

**Summary.** Let `E/F` be a quadratic extension of local or global fields, or the split algebra `F × F` at a place, `V` a Hermitian and `W` a skew-Hermitian space over `E`. The isometry groups `U(V)` and `U(W)` form a dual pair in the symplectic group of `V ⊗ W`, and a choice of splitting characters `χ_V`, `χ_W` lifts the pair to the metaplectic cover, so that the Weil representation `ω` becomes a representation of `U(V) × U(W)`. This roadmap develops the theta theory of these unitary dual pairs on which the theta lifts between definite unitary groups rest: the action of `ω` on a Siegel parabolic subgroup and on orthogonal sums; persistence, the stable range and bump vectors; the unramified correspondence; the Fock model, compact dual pairs and the archimedean correspondence of discrete series; local matching of the two theta quotients attached to a complementary datum `δ⁻¹W ≅ V ⊕ V′(−1)` at split, unramified inert and real places; the global Weil representation of a unitary pair and its characterisation; and, for theta integrals, Weil's convergence criterion, regularised convergence, constant terms along an isotropic line through cone maps, local multiplicity bounds, the Siegel–Weil and Rallis inner product formulas in Weil's convergent range, and the unramified doubling integral.

The headline theorems are these. (1) *The unramified correspondence.* Let `F` be nonarchimedean, `dim V = n ≤ d = dim W`, `χ_V`, `χ_W` unramified, and either `E/F` unramified quadratic of odd residue characteristic, `ψ` of conductor `𝒪_F` and `V`, `W` with self-dual lattices, or `E = F × F`. If unramified representations `π` of `U(V)` and `π′` of `U(W)` satisfy `Hom_{U(V)×U(W)}(ω, π ⊗ π′) ≠ 0` and `π` has Satake parameter `(α_1, …, α_n)`, then `π′` has parameter `(cα_1, …, cα_n, χ_V(ϖ)q^{(d−n−1)/2}, χ_V(ϖ)q^{(d−n−3)/2}, …, χ_V(ϖ)q^{−(d−n−1)/2})` with `c = χ_V(ϖ)/χ_W(ϖ)`; and the small theta lift `θ(π)` of an unramified `π` is unramified whenever it is nonzero. (2) *Local matching at split places.* Let `F` be nonarchimedean, `E = F × F`, `V`, `V′` Hermitian of dimensions `a > a′`, `W` skew-Hermitian of dimension `N = a + a′` with `δ⁻¹W ≅ V ⊕ V′(−1)`, and `β`, `α` unitary characters with `β|_{F^×} = ω_{E/F}^a`, `α|_{F^×} = ω_{E/F}^{a′}`, `ν = α/β`. If `ν` is ramified, or unramified with `ν(ϖ) ≠ 1`, then the theta quotients `Θ` and `Θ′` of the trivial representations of `U(V)` and `U(V′)` are irreducible and both isomorphic to the normalised parabolic induction `α_w ∘ det_a × β_w ∘ det_{a′}` of `U(W) ≅ GL_N(F)`. (3) *Weil's criterion and Siegel–Weil.* For a unitary dual pair over a quadratic extension of number fields with `dim V = m` and `V` of Witt index `r`, if `r = 0` or `m − r > (dim W)/2`, then `∫_{[U(V)]} θ(g, h; φ) dg` converges absolutely for every Schwartz function `φ`, locally uniformly in `h`; and for `W` split of dimension `2n` in the setting of GQT, if `r > 0` and `m − r > d(n)`, the Siegel Eisenstein series `E(g, s, Φ_φ)` is holomorphic at `s₀` and `E(g, s₀, Φ_φ) = c · τ(U(V))⁻¹ ∫_{[U(V)]} θ(g, h; φ) dh` with an explicit constant `c`. (4) *The Rallis inner product formula for anisotropic targets.* Let `π` be a cuspidal automorphic representation of `U(V)`, `dim V = n`, `W′` anisotropic of dimension `m`, `χ` the splitting character attached to `W′`, `S` a finite set of places outside which all data are unramified, and `F₁, F₂ ∈ π`, `φ₁, φ₂` factorizable, spherical and lattice vectors outside `S`. Then `⟨θ(F₁, φ₁), θ(F₂, φ₂)⟩` is `[E : F]/c` (`c = 1` for `s₀ > 0`, `c = 2` for `s₀ ≤ 0`, Tamagawa measures) times the value at `s₀ = (m − n)/2` of `L^S(s + ½, BC(π) ⊗ χ⁻¹)/d^S(s) · ∏_{v ∈ S} Z_v(s)`, with `Z_v` the local doubling integrals of the data at `v` against the conjugated matrix coefficient, an expression holomorphic at `s₀`.

The roadmap builds on [MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md), which provides the Heisenberg groups and Schrödinger models, the Weil representation and the unitary splittings, theta modules, theta kernels and lifts, and the Siegel–Weil and Rallis identities that the targets here extend; on [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md) and [LocalFactorsOfTwistsAndTypes](../LocalFactorsOfTwistsAndTypes/README.md) for Satake parameters, segments and the Zelevinsky classification; on [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md) for reduction theory and strong approximation; and on [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) for unimodular lattices and Siegel's main theorem. In the family [RiemannHypothesisForDirichletLFunctions](../README.md) its statements are used by the theta lifts of [ThetaLiftsForDefiniteUnitaryGroups](../ThetaLiftsForDefiniteUnitaryGroups/README.md) and by the theta-chain roadmaps.

Layer 3 fixes the normalisations of the Weil representation on Siegel parabolic subgroups and orthogonal sums, proves persistence, bump vectors and the unramified correspondence, builds the Fock model, treats compact dual pairs and the archimedean correspondence of discrete series, and proves local matching for complementary data at split, inert and real places, with three lemmas on functionals at split places. Layer 4 constructs the global Weil representation of a unitary pair and characterises it. Layer 5 expresses theta integrals of cusp forms of discrete-series type, proves Weil's convergence criterion, regularised convergence and archimedean vanishing, the constant-term formula along an isotropic line with the cone maps, the local multiplicity bounds that let the cone maps descend to matching data, and the archimedean cone lemma. Layer 6 proves the Siegel–Weil formula in Weil's convergent range, the unramified doubling integral with its region of absolute convergence, the Rallis inner product formula in Weil's range and for anisotropic targets, the integrability statements of the doubling method, and a local doubling integral with a tame twist on a block.

## Conventions

Notation and conventions not restated here are those of MetaplecticAutomorphicForms: its Conventions, and, for the Heisenberg law and the Schrödinger model, split étale Hermitian spaces, unitary dual pairs and their splitting characters, the big theta module, the type-II model, the adelic Weil representation, the theta kernel, the global theta lift and the doubling method, MetaplecticAutomorphicForms §§0.1, 0.15, 3.2a, 3.3, 3.4, 3.14, 4.5, 5.1, 5.6, 6.10 and 6.11. Hermitian spaces and lattices are those of HermitianFormsAndLattices.

`E/F` is a quadratic étale algebra over a local field or a number field: a quadratic field extension, or `E = F × F`. Its conjugation is `x ↦ x̄`, and `ω_{E/F}` (written `η` in the global statements) is the quadratic character attached to it. `V` is an ε-Hermitian and `W` a (−ε)-Hermitian space over `E`; in most statements `V` is Hermitian and `W` skew-Hermitian. Their isometry groups `U(V)` and `U(W)` act on the left, and `V ⊗ W` carries the trace-symplectic form of MetaplecticAutomorphicForms §3.3. For skew-Hermitian `W` and a trace-zero `δ ∈ E^×`, `W^♭ = δ⁻¹W` is the Hermitian space with the form `δ⁻¹⟨·,·⟩_W`. `H` is a hyperbolic plane and `W_r = W₀ ⊕ H^r` a Witt tower. `ψ` is a nontrivial unitary character of `F` (of `𝔸_F/F` in the global statements), and the measures on `F`, `E` and their adeles are self-dual. Hermitian and skew-Hermitian forms are conjugate-linear in the first variable and linear in the second. A normalisation with forms linear in the first variable, the symplectic form `−Tr(⟨·,·⟩_V⟨·,·⟩_W)` and the additive character `e^{−2πix}` at the real places has, for the same signatures of `V` and of `W^♭`, the complex conjugate Weil representation: there every infinity type and every weight at a real place is the negative of the one stated here.

Splitting characters are those of MetaplecticAutomorphicForms §3.3: unitary characters `χ_V`, `χ_W` of `E^×` (Hecke characters of `𝔸_E^×/E^×` in the global statements) with `χ_V|_{F^×} = ω_{E/F}^{dim V}` and `χ_W|_{F^×} = ω_{E/F}^{dim W}`; `χ_V` governs the `U(W)`-factor and `χ_W` the `U(V)`-factor. For a character `χ` of `E^×` trivial on `F^×`, `χ̃` is the character of the norm-one group with `χ̃(x/x̄) = χ(x)`; for `V = 0` the oscillator line of `U(W)` is `h ↦ χ̃_V(det h)`, with `det h` the determinant of the left-acting isometry `h` of `W`. At a real place a splitting character is `z ↦ (z/|z|)^m`, and `m` is its infinity type. `ω` (or `ω_{ψ, χ_V, χ_W}`) is the Weil representation of `U(V) × U(W)` attached to `ψ`, `χ_V`, `χ_W`, `S(X)` the Schwartz(–Bruhat) space of a Lagrangian `X`, and `Θ(π)`, `θ(π)` the big and the small theta lift.

In Layers 5–6 the parameters `m`, `n`, `r`, `d(n)` and `s₀` are those of GQT, as in the Conventions of MetaplecticAutomorphicForms; in 6.11 and 6.13a, as in MetaplecticAutomorphicForms §§6.10–6.14, `n` is the dimension of the undoubled space.

A paragraph headed *The form of the formal proof* records the form, with its hypotheses and ranges, in which the formal proof that the family follows (FormalProof, References) has a statement; a wider statement beside it is marked as published or as this roadmap's own. A paragraph headed *Status* names the clauses of a target that are this roadmap's own and are not on the path of that proof.

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal proof:*` how [FormalProof] proves it. Every target of this roadmap carries both labels: [FormalProof] has a statement of each, in the form recorded with it (the paragraph *The form of the formal proof*, or the sentence that attributes a statement to that proof); what in a target is this roadmap's own formulation is recorded in those paragraphs, in *Status* and in the `*Origin:*` label.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not cover
the whole section. The general theorem is proved in the roadmap that states it, and what the line covers is deduced from
it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only that case, not the general theorem in full:
the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the statement when
that proof has a narrower one. Where the route given with the section is not the deduction, it is a second proof,
[FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists what that route needs, and the
deduction needs the section that the `*Corollary of:*` line names.

## Layer 3: Fock model and local theta correspondence for unitary pairs

This layer works over a local field. It fixes the action of the Weil representation of a unitary pair on a Siegel parabolic subgroup and on orthogonal sums, proves persistence, the stable range and the unramified correspondence, builds the Fock model with the theta correspondence of compact dual pairs and of discrete series, and proves local matching of the two theta quotients of a local complementary datum at split, unramified inert and real places.

### 3.3b The left-action form of the Siegel-parabolic normalisation, and orthogonal sums

*Origin:* published: Kudla (1994), Theorem 3.1, the splittings of the metaplectic cover over unitary dual pairs, with the Levi and unipotent formulas on the Siegel parabolic subgroup as Gan and Ichino (2014), §7.4, write them, and with the explicit cochain from which (a) of *Orthogonal sums* follows when the space of the acting group is split; Harris, Kudla and Sweet (1996), Appendix, Corollary A.3, p. 998, (b) of *Orthogonal sums*, and (a.22)–(a.24), p. 997, the splitting for a non-split space defined by doubling it, which reduces (a) to the case of a split space of the acting group; MetaplecticAutomorphicForms §3.3d states (a) and (b). The left-action form with its dictionary to matrices acting on columns is this roadmap's own formulation.

*Method of the formal proof:* at a finite place the representation of the split unitary group is built directly from explicit operators for the Siegel parabolic subgroup and for the Weyl element (a constant times the Fourier transform), the relation on the big cell being checked by a Gauss integral of the Hermitian quadratic character, and is extended to the whole group by Weil's lemma on maps that are multiplicative on a large subset (a construction by generators and relations, which Gutiérrez Frez and Vera-Gajardo, arXiv:1606.03346, carry out for `U(n, n)` over finite fields, and Gutiérrez, Pantoja and Soto-Andrade, arXiv:1009.0877, over involutive rings); in the doubled global model the Levi formula, as a law, comes from the uniqueness of the functional invariant under the diagonal Heisenberg translations. Of this section the formal proof has the Levi formula, as a law for the functionals invariant under Heisenberg translations, and, in the doubled global model, the restriction to the first factor; (a) and (b) of *Orthogonal sums* rest on MetaplecticAutomorphicForms §3.3d, and their split cases also on the route. The route written here instead derives the Levi and unipotent formulas from the splittings of MetaplecticAutomorphicForms §3.3 and proves the orthogonal sums only in their split cases.

*Corollary of:* MetaplecticAutomorphicForms §3.3d (the compatibility of the unitary splittings with orthogonal sums of the acting group's own space and of the other member's space), for (a) and (b) of *Orthogonal sums*.

This target extends MetaplecticAutomorphicForms §3.3b, which compares the Hermitian Weil operators of four sources with Layer 2 of that roadmap, by two statements: the left-action form of the Siegel-parabolic normalisation, and the compatibility of the splittings with orthogonal sums.

*The left-action form of the Siegel-parabolic normalisation.* Prove the following. In
the conventions of MetaplecticAutomorphicForms §3.3 (isometry groups acting on the left; `χ_V` the splitting character governing `U(W)`), let `W` be
split over the local field with a basis `y_1, …, y_k, y^*_1, …, y^*_k`, `⟨y_i, y_j⟩_W = ⟨y^*_i, y^*_j⟩_W = 0`,
`⟨y_i, y^*_j⟩_W = δ_{ij}`, `Y = span(y_i)`, `Y^* = span(y^*_j)`; for `A ∈ GL_k(E)` and Hermitian `B` let `m(A)`, `n(B)` be the
isometries with `m(A)y_j = Σ_i (A⁻¹)_{ji} y_i`, `m(A)y^*_j = Σ_i Ā_{ij} y^*_i`, `n(B)y_j = y_j − Σ_i B_{ji} y^*_i`, `n(B)y^*_j = y^*_j`,
which generate the stabiliser of `Y^*`. In the Schrödinger model of the polarisation `(V ⊗ Y) ⊕ (V ⊗ Y^*)`, on functions
of `x = Σ_j x_j ⊗ y_j ∈ V ⊗ Y` with Gram matrix `T_x = (⟨x_i, x_j⟩_V)` and `n = dim V`,
`ω(m(A))φ(x) = χ_V(det A)⁻¹ |det A|_E^{n/2} φ(xA)` and `ω(n(B))φ(x) = ψ(tr(B T_x)) φ(x)`.
Intrinsically, a Levi element `h` acts by `χ_V(det(h|_Y))` times the modulus `|det(h|_Y)|_E^{−n/2}` times substitution.
Since `det h = x/x̄` with `x = det(h|_Y)`, whenever `χ_V` is trivial on `F^×` (for even `n`, and for every `n` at a place
split in `E`, where `ω_{E/F} = 1`) this character is `χ̃_V(det h)`, the character of the case `V = 0` (MetaplecticAutomorphicForms §3.3, Check) composed
with the determinant of the acting isometry; for odd `n` at a place not split in `E` the character `χ̃_V` of the norm-one
group is not defined (Check), and only `χ_V(det(h|_Y))` is. The intrinsic formula `χ_V(det(h|_Y))` holds in every case.
*Dictionary to matrices acting on columns.* In the basis `(y^*_1, …, y^*_k, y_1, …, y_k)` the isometry `m(A)` has the matrix
`diag(a, ᵗā⁻¹)` with `a = Ā`, and the formula reads `ω(m(a))φ(x) = χ_V(det a)|det a|_E^{n/2}φ(xā)`; a source whose matrices
act on the right has, for the same matrix, the inverse operator `φ(x) ↦ χ_V(det a)⁻¹|det a|_E^{−n/2}φ(xā⁻¹)`: the character,
the modulus and the substitution are all inverted.

*Orthogonal sums.* Prove the compatibility of the splittings with orthogonal sums, in two forms. All splittings here are into the scalar covers of
MetaplecticAutomorphicForms §3.3 (the circle extensions of MetaplecticAutomorphicForms §1.3), and for `𝕎 = 𝕎′ ⊕ 𝕎″` with Lagrangians `X = X′ ⊕ X″` the map from the product of the
scalar covers of `𝕎′`, `𝕎″` to that of `𝕎` is the tensor product of operators on `S(X) = S(X′) ⊗ S(X″)`. Let `W = W′ ⊥ W″`.
- (a) *The other member decomposed.* If `χ_{W′}`, `χ_{W″}` are splitting characters for `W′`, `W″` (restrictions
  `η^{dim W′}`, `η^{dim W″}` to `F^×`), then `χ_{W′}χ_{W″}` is one for `W`, and the splitting of `U(V)` for `V ⊗ W` attached to
  `χ_{W′}χ_{W″}` is the product of the splittings for `V ⊗ W′` and `V ⊗ W″` attached to `χ_{W′}` and `χ_{W″}`; so the Weil
  representation of `(V, W)` restricted to `U(V)` is the tensor product of those of `(V, W′)` and `(V, W″)`.
- (b) *The group's own space decomposed.* For a splitting character `χ_V` of `V`, the restriction to `U(W′) × U(W″) ⊂ U(W)`
  of the splitting of `U(W)` for `V ⊗ W` attached to `χ_V` is the product of the splittings of `U(W′)` for `V ⊗ W′` and of
  `U(W″)` for `V ⊗ W″` attached to the same `χ_V`: `ω_{V,W}(h′, h″) = ω_{V,W′}(h′) ⊗ ω_{V,W″}(h″)` on `S(X′) ⊗ S(X″)`.
Both hold likewise with the roles of `V` and `W` exchanged. The conventions are those of this target: isometry groups
acting on the left, `χ_V` governing `U(W)`, the Levi formula above.

*Route.* The unipotent formula is the action of `Sp` on the Lagrangian `V ⊗ Y^*` in the Schrödinger model
(MetaplecticAutomorphicForms §2.5 at a finite place; at a real place the Levi and unipotent formulas are part of this
target, proved from the covariance of MetaplecticAutomorphicForms §1.3 and the Schrödinger model of
MetaplecticAutomorphicForms §0.15), with
`B(x, (n(B) − 1)x)` computed from the Gram matrix; the Levi formula is the substitution `φ ↦ φ(m(A)⁻¹x) = φ(xA)` times the
modulus and the character of the splitting of MetaplecticAutomorphicForms §3.3 on the Levi subgroup (Gan–Ichino §7.4, p. 35, the Levi formula of
the splittings that Gan–Ichino §4.1, p. 12, fixes and MetaplecticAutomorphicForms §3.3 follows, read in the left-action convention: `det(m(A)|_Y) = det A⁻¹`, and `χ_V(det A⁻¹) = χ̃_V(det m(A))` for even `n`).
The formal proof states the Levi formula, as a law, under the isometries stabilising a subspace `Y′ ⊂ W`, for the
functionals invariant under the Heisenberg translations by `V ⊗ Y′`, in
`Development/AbelianVarietyTheory/Definitions/Divisors/HilbertNinetyQuotientHomEqIff.lean`
(`GlobalTheory.WeilM.SiegelRule`); the unipotent formula rests on the route above.
Orthogonal sums: route not given here; the statement is that the splitting of a product of unitary groups of orthogonal
pieces is the product of the splittings of the pieces, with the characters as in (a) and (b). MetaplecticAutomorphicForms
§3.3d states (a) and (b), to be read in the normalisation of MetaplecticAutomorphicForms §3.3 with the conventions just stated. The special case of (b) in which
`W′` and `W″` are both split follows from the Levi formula: two continuous liftings of `U(W′) × U(W″)` differ by a continuous
character, which factors through the determinants (the derived groups of split unitary groups of dimension `≥ 2` are their
special unitary groups); for `Y = Y′ ⊕ Y″` the element `m(diag(A′, A″))` acts on `S(V ⊗ Y′) ⊗ S(V ⊗ Y″)` by the tensor product of
the two Levi formulas, and `det m(A′) = det Ā′/det A′` exhausts the norm-one group, so the character is trivial. (a) for split
`V` follows in the same way from the Levi formula of the exchanged pair. The quaternionic analogue is
MetaplecticAutomorphicForms §3.28.

*Needs:* MetaplecticAutomorphicForms §§0.15, 1.3, 2.5, 3.3 and 3.3b.

**Checks.**

- `m(A)` and `n(B)` preserve `⟨·,·⟩_W` (`n(B)` exactly when `B` is Hermitian), and `tr(B T_x) ∈ F`; for `A` unitary at a real
  place the character `χ_V(det A)⁻¹` equals `det(Ā)^{m_V}`, for even `n` the value of `χ̃_V ∘ det` on `m(A)`. Reading the
  character as `χ_V(det A)` (the determinant of `A` instead of that of the isometry) would invert every splitting character.
- Odd `n` at a real place: `χ_V(z) = (z/|z|)^{m_V}` with `m_V` odd, so `χ_V(−1) = −1 ≠ χ_V(1)` while `1` and `−1` have the same
  image `1` under `x ↦ x/x̄`; no character `χ̃_V` of the norm-one group with `χ̃_V(x/x̄) = χ_V(x)` exists, and the Levi
  character is `χ_V(det(h|_Y))`. At a split place, by contrast, `χ_V|_{F^×} = ω_{E/F}^n = 1` for odd `n` as well, and the Levi
  character is `χ̃_V(det h)` (the split law of 4.4a).
- (b) for split `W′ = Ey′ ⊕ Ey′^*`, `W″ = Ey″ ⊕ Ey″^*`: `m(diag(a′, a″))` acts on `φ′ ⊗ φ″` by
  `χ_V(a′a″)⁻¹|a′a″|_E^{n/2}φ′(x′a′)φ″(x″a″)`, the product of the Levi formulas of `W′` and `W″` with the same `χ_V` on both
  factors (in (a) it is the characters of the two pieces that multiply).
- `k = 1`, `W = Ey ⊕ Ey^*`: for `g` fixing `V ⊗ y^*` pointwise, `gu = u + c(u)` and `ω(g)φ(u) = ψ(−½B(u, cu))φ(u)` (MetaplecticAutomorphicForms §§0.15,
  1.3); with `B(x ⊗ y, −bx ⊗ y^*) = −2b⟨x, x⟩` this gives `ω(n(b))φ(x) = ψ(b⟨x, x⟩)φ(x)`, with no convention entering.

### 3.9a Unitary persistence, the stable range and bump vectors

*Origin:* published: Kudla (1996), III.4, persistence and the stable range for symplectic–orthogonal Witt towers, and Mœglin, Vignéras and Waldspurger (1987) for type-I pairs over a `p`-adic field, unitary pairs included; Li (1989), the stable range, and Li (1992), §§3–5, bump vectors with their integral identity; Mínguez (2008), Théorème 1, for `E = F × F`.

*Method of the formal proof:* the bump vector at a finite place is the translate of the lattice vector by a Heisenberg element `ϖ^{−k}x₁`, `x₁` an integral matrix of isotropic rows with a right inverse; it is fixed by the principal congruence subgroup of level `k`, and for an element of `U(V)` outside that subgroup two lattice Heisenberg translations related by the element act on it by different scalars, which forces the matrix coefficient to vanish there. In place of (i) and (ii) the formal proof has the global nonvanishing of the paragraph *The form of the formal proof*, which combines these vectors at finitely many places with the inner product formula and a bound for the contribution of the remaining places.

*Corollary of:* MetaplecticAutomorphicForms §3.9a (persistence, the stable range and the existence of bump vectors for unitary pairs), for (i), (ii) and the first sentence of (iii).

Prove persistence, the stable range and the existence of bump vectors for unitary pairs. This is the unitary analogue
of MetaplecticAutomorphicForms §3.9 (orthogonal–symplectic pairs), with bump vectors added. Let `F` be a
nonarchimedean local field of characteristic zero, `E/F` a quadratic field extension or `E = F × F`,
`V` a nondegenerate Hermitian space of dimension `n`, `W₀` a nondegenerate skew-Hermitian space and
`W_r = W₀ ⊕ H^r` its Witt tower, with splitting characters as in MetaplecticAutomorphicForms §3.3 (and MetaplecticAutomorphicForms §3.2a when `E` is split).
For an irreducible admissible `π` of `U(V)`:

- (i) *Persistence.* If `Θ_{W_r}(π) ≠ 0` then `Θ_{W_{r+1}}(π) ≠ 0`.
- (ii) *Stable range.* If `W_r` contains an isotropic subspace of dimension `n` (for `E = F × F`: if
  `dim W_r ≥ n`), then `Θ_{W_r}(π) ≠ 0` for every `π`; the central characters match automatically
  for unitary pairs.
- (iii) *Bump vectors.* Under the hypothesis of (ii), for every open neighbourhood `H` of `1` in
  `U(V)` there are an open subgroup `H₀ ⊂ H` and a vector `φ` of the Weil representation such that
  the matrix coefficient `g ↦ ⟨ω(g)φ, φ⟩` on `U(V)` is nonnegative, supported in `H` and equal to
  `‖φ‖² > 0` on `H₀`. Consequently, for every `v ∈ π` fixed by `H`,
  `∫_{U(V)} ⟨ω(g)φ, φ⟩⟨π(g)v, v⟩ dg = c·‖v‖²` with `c = ∫_H ⟨ω(g)φ, φ⟩ dg ≥ vol(H₀)‖φ‖² > 0`, the
  integral being over a compact set.

*The form of the formal proof.* The formal proof has no local statement of (i) or (ii), which rest on the sources cited
below; in their place it has the global nonvanishing of the theta lift for pairs definite at every real place with
`2 dim V ≤ dim W`, built from bump vectors and the inner product formula (FormalProof,
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/ThetaKernels/GalTPDefs.lean`
(`UpperTheory.TP.NonVan_k`; the bump vectors are `UpperTheory.TP.BumpAny_k` there)).
(iii) follows from the formal proof, from these bump vectors.

*Route.* Choose `W_r = Y ⊕ W′ ⊕ Y*` with `Y` isotropic of dimension `n` and use the mixed model
`S(V ⊗ Y*) ⊗ ω_{V,W′}`, in which `U(V)` acts on the first factor linearly, up to the character
`χ_W(det)` and a modulus, and on the second through the Weil representation of the smaller pair.
(iii): take `φ = 1_{x₀ + ϖ^k L} ⊗ φ′` with `x₀ : Y → V` an isomorphism onto `V` (so the stabiliser of
`x₀` in `U(V)` is trivial), `L` a lattice and `φ′` fixed by a small open subgroup; shrinking `H` so that
`χ_W(det g) = 1` and `φ′` is fixed on `H`, for `k` large the first factor of the matrix coefficient is the
nonnegative volume `vol((x₀ + ϖ^kL) ∩ g(x₀ + ϖ^kL))`, supported in a small neighbourhood of `1` and constant
on the principal congruence subgroup of level `k`, and the second factor is `‖φ′‖²` there. (ii) follows
from (iii) and the nonvanishing of the integral, which gives a nonzero element of
`Hom_{U(V)}(ω, π)`. (i) is Kudla's argument with the Jacquet filtration of MetaplecticAutomorphicForms §3.12 in its unitary form.
For `E = F × F` use the type-II model of MetaplecticAutomorphicForms §3.2a, in which `GL_n` acts on `n × dim W` matrices and a
full-rank `x₀` has trivial stabiliser.

(Kudla96, III.4, Propositions 4.1, 4.3–4.5, pp. 45–49, there for symplectic–orthogonal Witt towers; C. Mœglin, M.-F. Vignéras,
J.-L. Waldspurger, *Correspondances de Howe sur un corps p-adique*, Lecture Notes in Math. 1291 (1987), for type-I pairs,
unitary pairs included; J.-S. Li, *Singular unitary representations of classical
groups*, Invent. Math. 97 (1989), for the stable range, and *Nonvanishing theorems for the cohomology of certain arithmetic
quotients*, J. reine angew. Math. 428 (1992), §§3–5, for (iii).) *Needs:* MetaplecticAutomorphicForms §§3.2a, 3.3, 3.4, 3.6, 3.12;
SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.3.1.

**Checks.**

- `n = 0`: (ii) says the oscillator character of `U(W_r)` is nonzero; (iii) is vacuous.
- For `E` a field, `W` anisotropic of dimension `2` and `n = 1`, the hypothesis of (ii) fails for
  `r = 0` (no isotropic line) and holds for `r = 1`.
- In (iii) the stabiliser condition is needed: if `x₀` had a nontrivial stabiliser `S`, the matrix
  coefficient would be supported on a neighbourhood of `S`, not of `1`.

### 3.21a The unramified unitary theta correspondence

*Origin:* published: Howe (1979), (i), the spherical vectors of the oscillator representation; Rallis (1982), the Hecke map and the Satake parameters of (ii)–(iii) for orthogonal–symplectic pairs, and, for unitary pairs, Liu (2021), Theorem 1.1, crediting Liu (2011), Appendix, (i)–(iii) at an inert place for `V` and `W` of even dimension, `W` split and trivial splitting characters, as MetaplecticAutomorphicForms §3.22a states them; Mínguez (2008), Théorème 1, the split case. (ii)–(iii) at inert places outside that case of Liu (2021), and (iv) at inert places, are this roadmap's own formulation.

*Method of the formal proof:* (i) at an inert place: in the lattice model the space is a sum of lines indexed by matrices modulo integral ones, and a vector fixed by one hyperspecial subgroup is reached from translates of the lattice vector under the other group by induction on the index of the lattice spanned by its support, invariance forcing an integral Gram matrix and the vector fixed by a suitable self-dual lattice having its leading term on the given orbit. At a split place the functions invariant under `GL_n(𝒪_F)` are combinations of `GL_d(F)`-translates of `1_{M_{n×d}(𝒪_F)}`, by inversion over a finite partially ordered set of row lattices, and for `d > 2n` the Satake parameter of the lift is read off from its identification with a parabolically induced representation.

Prove the unramified theta correspondence for unitary pairs. Let `F` be nonarchimedean, `V`, `W` of dimensions `n ≤ d` with unramified
splitting characters `χ_V`, `χ_W`, and suppose one of the following:

- (inert case) `E/F` is unramified quadratic, the residue characteristic is odd, `ψ` has conductor `𝒪_F`, `L ⊂ V`
  and `M ⊂ W` are self-dual lattices (for the Hermitian form of `V` and the skew-Hermitian form of `W`),
  `K = Stab(L)`, `K′ = Stab(M)` (hyperspecial), and `φ₀` is the lattice vector of `L ⊗ M` (MetaplecticAutomorphicForms §2.6a);
- (split case) `E = F × F`, of any residue characteristic, and `ψ` of any conductor; through MetaplecticAutomorphicForms §3.2a,
  `U(V) ≅ GL_n(F)`, `U(W) ≅ GL_d(F)` and the Weil representation is the type-II model on `S(M_{n×d}(F))` of
  MetaplecticAutomorphicForms §3.14, written in bases of lattices `Λ ⊂ P`, `Λ′ ⊂ Q` (`V = P ⊕ P^∨`, `W = Q ⊕ Q^∨` as in MetaplecticAutomorphicForms §3.2a); `K = GL_n(𝒪_F)`,
  `K′ = GL_d(𝒪_F)` (the stabilisers of the self-dual lattices `Λ ⊕ Λ^∨`, `Λ′ ⊕ Λ′^∨`), and `φ₀ = 1_{M_{n×d}(𝒪_F)}`,
  which is the lattice vector of the `ψ`-self-dual lattice formed by `M_{n×d}(𝒪_F)` and its `ψ`-dual in the
  complementary Lagrangian, for the lift `q(x + y) = ψ(−½B(x, y))` (no lift `q = 1` is needed, and MetaplecticAutomorphicForms §2.6a is not
  used).

Let `ℋ`, `ℋ′` be the spherical Hecke algebras of `(U(V), K)` and `(U(W), K′)`.

- (i) The `K × K′`-fixed vectors of `ω` are `ℋ·φ₀ = ℋ′·φ₀`; moreover the `K`-fixed vectors of `ω` form the
  `U(W)`-module generated by `φ₀`.
- (ii) There is an algebra homomorphism `ξ : ℋ′ → ℋ` with `ω(1, T)φ₀ = ω(ξ(T)^∨, 1)φ₀`, where `T ↦ T^∨`
  is the anti-involution induced by `g ↦ g⁻¹`.
- (iii) In Satake terms (SmoothRepresentationsOfLocalGroups §§SR.4.3–SR.4.4, unitary normalisation,
  base-change parameters at inert places), if `π` and `π′` are unramified with
  `Hom_{U(V)×U(W)}(ω, π ⊗ π′) ≠ 0`, and `π` has parameter `(α_1, …, α_n)`, then `π′` has parameter
  `(c α_1, …, c α_n, χ_V(ϖ) q^{(d−n−1)/2}, χ_V(ϖ) q^{(d−n−3)/2}, …, χ_V(ϖ) q^{−(d−n−1)/2})`,
  `c = χ_V(ϖ)/χ_W(ϖ)`, with `q` the residue cardinality of `E` at the place (of `E_w` at a split
  place) and `ϖ` a uniformiser there. Equivalently, `Sat(ξ(T))(β) = Sat(T)(cβ⁻¹, segment)`, the
  inversion coming from `T ↦ T^∨` in (ii).
- (iv) For every unramified `π` with `θ(π) ≠ 0`, `θ(π)` is unramified, so (iii) applies to it; when `W`
  contains an isotropic subspace of dimension `n` (in particular for `d ≥ 2n + 1`), `θ(π) ≠ 0` for every
  `π` by 3.9a(ii).

State the inert and the split case separately; the split case is the unramified case of the
type-II correspondence of MetaplecticAutomorphicForms §3.14, and for `d = n` (and the data of Li–Liu 2021, Definition 6.8, pp. 30–31) (ii) is the Hecke map of MetaplecticAutomorphicForms §3.22.
This is the unitary analogue of MetaplecticAutomorphicForms §3.21 (Rallis' parameters for orthogonal–symplectic pairs).

*The form of the formal proof.* In the inert case the formal proof has no Hecke map `ξ` and no Satake parameter, and
(ii)–(iii) there, outside the case of Liu (2021) (even dimensions, `W` split, trivial splitting characters;
MetaplecticAutomorphicForms §3.22a), and (iv) there are this roadmap's own, proved by the route below ((ii)–(iii) by
Rallis' computation, published for orthogonal–symplectic pairs; (iv) from (i)); for the trivial representation it has
equal spherical functionals on the translates of the two lattice vectors (FormalProof,
`Development/WeilBound/ThetaLifts/SphericalLattices/HoweInert.lean` (`PositivityTheory.Sph.SphFun`)).
The formal proof states the inert case of (i) in `Development/WeilBound/ThetaLifts/SphericalLattices/HoweInert.lean`
(`PositivityTheory.Sph.HoweInert`), and, in the case used, the action and, for `d > 2n`, (iii) of the split case (it has no statement of the Hecke map of (ii)) in
`Development/WeilBound/ThetaLifts/LatticeBasics/ThConstInv.lean` (`GlobalTheory.ThK.Dbl.TC.SplitModel`),
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/SatakeLifts/CompUnit.lean`
(`UpperTheory.Gal.TP.Loc.LiftSatU`), `Development/AbelianVarietyTheory/Definitions/Foundations/NormEulerPolySubOneLe.lean`
(`GlobalTheory.LFun.seg`).

*Route.* (i) is Howe's theorem on the generation of the spherical vectors of the oscillator (lattice
model, MetaplecticAutomorphicForms §2.6a, in the inert case; route not given here; the statement is that the vectors fixed by the stabilisers of
the two self-dual lattices are the Hecke translates of the lattice vector and generate, over `U(W)`, the vectors fixed by
the first stabiliser; R. Howe, *θ-series and invariant theory*, 1979). In the split case write `V = P ⊕ P^∨`, `W = Q ⊕ Q^∨` with `U(V) ≅ GL(P)`, `U(W) ≅ GL(Q)`
through the components at one factor of `E = F × F` (MetaplecticAutomorphicForms §3.2a); on `S(P ⊗ Q) = S(M_{n×d}(F))` the pair acts by
`φ ↦ φ(g⁻¹ · x · ᵗh⁻¹)` (on `S(P^∨ ⊗ Q^∨)` by `φ ↦ φ(ᵗg · x · h)`) times the unramified characters `χ_{W,w}(det g)χ_{V,w}(det h)`
(components at the chosen factor `w`; this is `χ̃_W(det g)χ̃_V(det h)` for the isometries) of the split law (4.4a) and the
moduli, with no dependence on `ψ` or on the residue characteristic. In rank one `(t, t⁻¹)` acts by
`(χ_W/χ_V)(t)`, so a quotient `π ⊗ π′` has `π′ = π · χ_V/χ_W`, the parameter `cα` of (iii); the substitution `φ(g⁻¹xh)` would
give `π′ = π⁻¹` up to the characters, which is the relation for the dual identification of one of the two groups. The
`K × K′`-fixed vectors are the locally constant compactly supported functions on `M_{n×d}(F)` invariant under
`GL_n(𝒪) × GL_d(𝒪)`: functions of the elementary divisors with bounded support that are constant near each matrix of lower
rank (they are not finite combinations of indicators of double cosets: `1_{M_{n×d}(𝒪)}` meets the double cosets of all
divisors `≥ 0` in every rank); (i)–(iii) are statements about these functions, proved by the same computation. (ii)–(iii) are Rallis' computation: the action of the generators of `ℋ′` on `φ₀`
through the Siegel-type parabolic of the doubled or split model and the modulus of its Levi, read
through the Satake transform; the parameter of `θ(π)` is that of MetaplecticAutomorphicForms §3.18 in its unramified form,
`φ_π ⊗ χ_Vχ_W⁻¹ ⊕ χ_V ⊗ (segment)`, with no contragredient on `φ_π`. If `π ⊗ π′` is a quotient, taking
`K × K′`-invariants (exact for compact groups) shows that the image of `φ₀` is nonzero, by (i). (iv): a
nonzero `ω → π ⊗ θ(π)` restricts to a surjection `ω^K → π^K ⊗ θ(π)` of `U(W)`-modules; by the second
clause of (i) its value at `φ₀` is nonzero, and `φ₀` is `K′`-fixed.

(S. Rallis, *Langlands' functoriality and the Weil representation*, Amer. J. Math. 104 (1982), there for orthogonal–symplectic pairs;
R. Howe, *θ-series and invariant theory*, Proc. Sympos. Pure Math. 33 (1979); Y. Liu, *Theta correspondence for almost
unramified representations of unitary groups*, arXiv:2105.14223 (2021), Theorem 1.1 and Remark 1.4, the inert case for even
dimensions and trivial splitting characters (MetaplecticAutomorphicForms §3.22a), crediting the unramified case to Y. Liu,
*Arithmetic theta lifting and L-derivatives for unitary groups I*, Algebra Number Theory 5 (2011), Appendix; Mínguez08, Théorème 1, p. 718, for the
split case, stated for the action `Φ(g⁻¹xh)` of Mínguez08 (1.4), p. 721, which differs from the one here by `h ↦ ᵗh⁻¹`.) *Needs:* 3.9a; MetaplecticAutomorphicForms §§2.6a, 3.2a, 3.3, 3.14, 3.18 (conventions for the characters);
SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.4.

**Checks.**

- `n = 0`: `ω` is the character `χ̃_V ∘ det` of `U(W)` (`χ̃_V(x/x̄) = χ_V(x)`; at a split place `χ_{V,w} ∘ det` on `GL_d(F)`,
  whereas `χ_V ∘ det` would be its square) and (iii) gives the segment alone, `χ_V(ϖ)(q^{(d−1)/2}, …, q^{−(d−1)/2})`, the
  parameter of that character.
- `n = d = 1`, split: a character `π` of parameter `α` pairs (`Hom(ω, π ⊗ π′) ≠ 0`) with `π′` of parameter
  `cα`; a theta lift `∫ θ(g, h; φ)F(g) dg` linear in `F ∈ π` pairs `ω` with `π^∨ ⊗ π′`, so its parameter is
  `cα⁻¹`. Placing the inversion in (iii) instead would contradict MetaplecticAutomorphicForms §3.18.
- The segment `q^{(d−n−1)/2 − i}`, `0 ≤ i < d − n`, written in the arithmetic normalisation of `GL_d`
  (shift by `(d − 1)/2`), has exponents `(d − n − 1)/2 − i + (d − 1)/2`; for `d = n + t` these are
  `(n + 2t − 2)/2 − i`, `0 ≤ i < t`.
- At a dyadic split place the lift `q = 1` of the lattice formed by `M_{n×d}(𝒪)` and its dual does not exist when
  `½B` is not integral on it (`q = 1` is a lift only if `ψ(½B(a, a′)) = 1` on the lattice), while `1_{M_{n×d}(𝒪)}` is the
  lattice vector for `q(x + y) = ψ(−½B(x, y))`; the split case of (i)–(iv) is stated with that vector.

### 3.45 The Fock model and the infinitesimal Weil representation

*Origin:* published: Bargmann (1961), the Fock space and the Bargmann transform of (i), and Bargmann (1967), the transforms of tempered distributions in (iv); Kashiwara and Vergne (1978) and Howe (1989), the Fock model of the oscillator representation, its `K`-finite vectors and its infinitesimal action, (ii)–(iii). The formula for `T(B⁻¹P)` through the jet of `ϑ_T` at `0` in (iv) is this roadmap's own formulation.

*Method of the formal proof:* in place of (i) the formal proof has an injective map from the holomorphic polynomials into the Schwartz space intertwining the infinitesimal Heisenberg operators, built algebraically: the infinitesimal Heisenberg operators give commuting creation and annihilation operators, a Gaussian is the vector killed by the annihilation operators, unique up to a scalar, a polynomial is sent to the same polynomial in the creation operators applied to the Gaussian, and the map is injective because its kernel is stable under partial derivatives and contains no nonzero constant; (ii) and (iii) follow from the statements cited in the paragraph *The form of the formal proof*. (i) rests on the sources cited and (iv) on the route written here. The route written here goes instead through the Bargmann kernel, its unitarity by a Gaussian integral, and the Hermite basis.

*Corollary of:* MetaplecticAutomorphicForms §§1.5, 2.5a (the Fock model of the real Heisenberg and Weil representations: the Fock space and the Bargmann transform, the polynomial Fock vectors, the transforms of tempered distributions, the `K`-finite vectors and the infinitesimal Weil representation), for (i)–(iii), and for (iv) except the formula for `T(B⁻¹P)` through the jet of `ϑ_T` at `0`.

Construct the Fock model. Let `W` be a real symplectic space of dimension `2N` with a compatible complex
structure `J` (`ω(Jx, Jy) = ω(x, y)`) that is positive, `ω(x, Jx) > 0` for `x ≠ 0`, and `ψ_ℝ(x) = e^{2πix}`.
Write `H(x, y) = ω(x, Jy) − iω(x, y)` for the Hermitian form of `(W, J)`, linear in the first variable, with
`H(x, x) = ω(x, Jx)` and `Im H = −ω`.

- (i) The *Fock space* `𝓕(W, J)`: holomorphic functions on `(W, J)` square-integrable for the Gaussian
  probability measure `e^{−π H(z,z)} dz`, with inner product `⟨F, G⟩_𝓕` conjugate-linear in `F`; the
  *Bargmann transform* `B : L²(X) → 𝓕(W, J)` for a Lagrangian `X`, unitary and intertwining the
  Schrödinger action of the Heisenberg group (MetaplecticAutomorphicForms §0.15, with the law of MetaplecticAutomorphicForms §0.1) with the action
  `(t, w) ↦ ψ_ℝ(t)U_w`, `U_w G(z) = G(z + w) exp(−πH(z, w) − πH(w, w)/2)`, on `𝓕`.
- (ii) The space `ℂ[W]_J ⊂ 𝓕` of holomorphic polynomials on `(W, J)` is the space of `K`-finite vectors for
  `K = U(W, J)~` (the preimage in `Mp(W)` of the unitary group of `(W, J)`), and `k ∈ K` acts by
  `G ↦ det_J(k)^{−1/2} · G ∘ k⁻¹`, where `det_J` is the determinant of `(W, J)` and `det_J^{−1/2}` the genuine
  character of `K` whose square is `det_J⁻¹`: on the polynomials of degree `k` this is `det_J^{−1/2}` tensored with
  `Sym^k` of the dual of `(W, J)`. In particular `exp(θJ)` acts on the polynomials of degree `k` by
  `e^{−i(k + N/2)θ}`. The constant `1` is the *vacuum*, the image of the Gaussian, and `B(P · Gaussian)` is a
  polynomial for every polynomial `P` on `X`. The *polynomial Fock vectors* `B⁻¹(ℂ[W]_J)`, the products of polynomials
  on `X` with the Gaussian, are dense in the Schwartz space `S(X)` for its Fréchet topology.
- (iii) The *infinitesimal Weil representation*: `𝔰𝔭(W)` acts on the Schwartz space `S(X)` by the
  second-order operators attached to the quadratic Hamiltonians (Weyl quantisation), this action is
  the derivative of the Weil representation of MetaplecticAutomorphicForms §2.4c on smooth vectors, and in the Fock model
  `𝔨 = 𝔲(W, J)` acts by first-order operators `z_i ∂_j` plus scalars and `𝔭^±` by multiplication by
  `z_iz_j` and by `∂_i∂_j`.
- (iv) *Bargmann transforms of distributions and jets.* For a tempered distribution `T` on `X` there is a
  unique entire function `ϑ_T` on `(W, J)` with `|ϑ_T(z)| ≤ C(1 + |z|)^M e^{πH(z,z)/2}` and
  `T(B⁻¹G) = ⟨ϑ_T, G⟩_𝓕` for every polynomial `G`. In coordinates `z_j` orthonormal for `H`,
  `⟨F, z^κ⟩_𝓕 = κ! π^{−|κ|} conj(f_κ)` for `F = Σ f_κ z^κ`, so for every polynomial `P`
  `T(B⁻¹P) = conj((P^♮(π⁻¹∂_z)ϑ_T)(0))`, with `P^♮` the polynomial with conjugate coefficients. For
  `T = ∫ f ·` with `f ∈ S(X)`, `ϑ_T = B(f̄)`.

*The form of the formal proof.* The formal proof has no Bargmann transform on `L²(X)` and no counterpart of (iv); in
place of (i) it has an injective map from the holomorphic polynomials on `(W, J)` into the Schwartz space intertwining
the infinitesimal Heisenberg operators (FormalProof,
`Development/WeilBound/CoreStatements/GaussianSeminormBounds/RealSeminormFiltration/RLFock.lean`
(`PositivityTheory.RL.Fock.Heis.exists_fockMap`)). (i) rests on the sources cited below, (iv) on the route below.
(ii) and (iii) follow from the formal proof, `Development/AbelianVarietyTheory/Proofs/DivisorProofs/IsFockMap.lean`
(`GlobalTheory.RealLift.FockEx`), `Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.Model.Pol`).

*Route.* The Bargmann kernel and its unitarity from the Gaussian integral; the Heisenberg relations by
completing squares (`U_wU_{w′} = e^{−πi Im H(w, w′)}U_{w+w′} = ψ_ℝ(½ω(w, w′))U_{w+w′}`, the law of MetaplecticAutomorphicForms §0.1, because
`Im H = −ω`); `K`-finite vectors through the Hermite basis (OrthogonalL2Bases Part A, A2–A3, and Part D, the
multidimensional Hermite basis), whose expansions of a Schwartz function
converge in the Schwartz topology (the Hermite coefficients decay rapidly because the harmonic oscillator acts on
`S(X)` by a positive operator with eigenvalues `k + N/2`), which gives the density; the action of `K`: the
covariance `ω(k)U_wω(k)⁻¹ = U_{kw}` of MetaplecticAutomorphicForms §1.3 determines `ω(k)` up to a scalar (Schur's lemma for the irreducible
Fock model), and `G ↦ G ∘ k⁻¹` satisfies it because `H` is `k`-invariant, so `ω(k)G = c(k) · G ∘ k⁻¹`; `c = det_J^{−1/2}` because the vacuum is an eigenvector of `dω(J)` with
eigenvalue `−iN/2` (Check below, in each of `N` orthogonal coordinates); the Lie algebra action by
differentiating the operator formulas of MetaplecticAutomorphicForms §2.5 on the generators and comparing on the Hermite span. (iv):
`ϑ_T = Σ_κ conj(T(B⁻¹e_κ))e_κ` for the orthonormal basis `e_κ = (π^{|κ|}/κ!)^{1/2}z^κ`; the bound from
`|B⁻¹e_κ|` and the growth of the Bargmann kernel; termwise integration against `e^{−πH(z,z)}`. For `W = V ⊗ ℝ²`, `V`
quadratic, the identification of (ii)–(iii) is HodgeClassesForJacquetLanglands §4.2 in coordinates.

(V. Bargmann, Comm. Pure Appl. Math. 14 (1961), and, for (iv), Comm. Pure Appl. Math. 20 (1967); R. Howe, *Transcending classical invariant theory*,
J. Amer. Math. Soc. 2 (1989); M. Kashiwara, M. Vergne, Invent. Math. 44 (1978).) *Needs:* MetaplecticAutomorphicForms §§0.1, 0.15, 0.17,
0.18, 2.4c, 2.5; OrthogonalL2Bases Part A (A2–A3) and Part D.

**Checks.**

- `N = 1`, `W = ℝe ⊕ ℝf`, `ω(e, f) = 1`, `X = ℝe`: the vacuum is `2^{1/4}e^{−πu²}`, the Heisenberg element
  `ae + bf` acts by `U_{a + ib}`, the positive complex structure is `Je = f` (`ω(e, Je) = 1 > 0`), and the
  Bargmann kernel is `2^{1/4}e^{2πuz − πu² − πz²/2}`.
- *The sign of the action of `K`.* In the same example, MetaplecticAutomorphicForms §0.15 gives `dρ(e) = d/du` and `dρ(f) = 2πiu`. The Gaussian is
  killed by `d/du + 2πu = dρ(e − if)`, and `e − if` spans the `+i`-eigenspace of `J`. The operator
  `dω(J) = −i(−(1/4π)d²/du² + πu²)` satisfies `[dω(J), dρ(w)] = dρ(Jw)` and has eigenvalue `−i/2` on the Gaussian.
  By covariance `exp(θJ)` multiplies the annihilation operator `dρ(e − if)` by `e^{iθ}` and the creation operator
  `dρ(e + if)` by `e^{−iθ}`, so it acts on the Hermite function of degree `k` by `e^{−i(k + 1/2)θ}`, as (ii) says. An
  action by `det_J^{1/2}` tensored with `Sym^k(W, J)` would give `e^{+i(k + 1/2)θ}`.
- In (iv) the distribution matters: for `N = 1`, `T = δ_0` has `ϑ_T(z) = 2^{1/4}e^{−πz²/2}`, and for `P = z²`,
  `T(B⁻¹P) = (B⁻¹z²)(0) = −2^{1/4}/π`, the nonzero value at `0` of the Hermite function of degree two,
  which is `conj((π⁻²∂²ϑ_T)(0))`; the jet `(∂²1)(0) = 0` of the transform `1` of the Gaussian is not it.
- The centre `±1` of `Mp` acts on degree-`k` polynomials by `±1` through `det_J^{−1/2}`, not trivially.

### 3.46 Compact dual pairs `(U(n), U(p, q))`

*Origin:* published: Howe (1989), the decomposition (i) through joint harmonics and, in (iii), the `(GL_n, GL_d)`-duality on polynomials in matrices; Kashiwara and Vergne (1978) and Paul (1998), the occurring `σ` and the lowest `K`-types of (ii). The determinant twists by the infinity types `m_V`, `m_W` of the splitting characters in (ii) and (iii), in the normalisation of 3.45, are this roadmap's own formulation.

*Method of the formal proof:* on the polynomial Fock space of the pair the compact parts of both Lie algebras preserve the degree and the noncompact parts raise or lower it by two, adjointly for the Fischer inner product; orthogonal projection for that inner product splits each degree into the joint kernel of the lowering operators and the image of the raising operators; and the joint highest weight vectors among the harmonics are classified by reduction to blocks of the coordinate matrix, where a polynomial killed by the row and column raising operators is determined by its restriction to diagonal matrices and is a product of powers of leading principal minors. The formal proof has the structure of the polynomial Fock space used in (ii) and the types of (iii), for all signatures of both spaces; (i) rests on the sources cited.

*Corollary of:* MetaplecticAutomorphicForms §3.7a (Howe duality for the compact dual pairs `(U(n), U(p, q))` on the polynomial Fock space, and, for both members compact, the `(GL_n, GL_d)`-duality restricted to `U(n) × U(d)`), for (i), the sentence of (ii) on the vacuum, and (iii) except the values of the twists `a`, `b` and the statement on the leading principal minors.

Prove the theta correspondence of compact dual pairs. Over `ℂ/ℝ`, let `V` be a definite Hermitian space of dimension `n` and `W` a
skew-Hermitian space, with `W^♭ = δ⁻¹W` for `δ` with `δ⁻¹ ∈ iℝ_{>0}` of signature `(p, q)`; the symplectic
form on `V ⊗ W` is `B(v ⊗ w, v′ ⊗ w′) = Tr_{ℂ/ℝ}(⟨v, v′⟩⟨w, w′⟩)`, the Fock model is that of 3.45 for the
positive complex structure `J`, and the splitting characters have infinity types `m_V`, `m_W` (MetaplecticAutomorphicForms §3.3). The
group `U(V)` is identified with `U(n)` through an orthonormal basis, and `σ_λ` has highest weight `λ`.

- (i) The restriction of the Weil representation to `U(n) × U(p, q)` on the polynomial Fock space
  decomposes discretely as `⊕_σ σ ⊗ θ(σ)` over the irreducible representations `σ` of `U(n)` that
  occur, each `θ(σ)` an irreducible unitary `(𝔤, K)`-module, with `σ ↦ θ(σ)` injective (Howe; this is the archimedean
  Howe duality of MetaplecticAutomorphicForms §3.7 for the compact member `U(n)`, whose isotypic parts are unitarizable,
  hence semisimple).
- (ii) The occurring `σ` and the lowest `K`-type of `θ(σ)` are given by the Kashiwara–Vergne formula,
  with the determinant twists coming from `m_V`, `m_W`; the lowest `K`-type is spanned by the joint
  harmonics of the corresponding degree. For `σ` the character by which `U(n)` acts on the vacuum, the lowest
  `K`-type of `θ(σ)` is spanned by the vacuum; for another character of `U(n)` it is spanned by the vacuum times
  powers of determinants of square blocks of the coordinates (3.47b).
- (iii) *Both groups compact* (`W^♭` definite, `d = p + q` with `pq = 0`): let `ε = −sgn(V)·sgn(W^♭)`. Since
  `B(x, ix) = −2 Im(δ)·h(x, x)` for the Hermitian form `h` of `V ⊗ W^♭` and `Im δ < 0`, the positive complex
  structure is `J = −ε·i`: `ℂ` acts on `(V ⊗ W, J)` through the identity for `ε = −1` and through conjugation
  for `ε = +1`. The polynomial Fock space is `ℂ[M_{n×d}]` in the coordinates that are holomorphic for `J` (the
  matrix of coordinates of `V ⊗ W` in orthonormal bases for `ε = −1`, its complex conjugate for `ε = +1`), and
  its degree-`k` part is `⊕_μ σ_{ι_ε(μ^{(n)} + a)} ⊗ σ_{ι_ε(μ^{(d)} + b)}` over partitions `μ` of `k` with at most `min(n, d)`
  nonzero parts, `μ^{(m)}` denoting `μ` written with `m` entries (for `n ≤ d`: `σ_{ι_ε(μ + a)} ⊗ σ_{ι_ε((μ, 0^{d−n}) + b)}`), where
  `a = (d + εm_W)/2`, `b = (n + εm_V)/2`, `ι_{+1}(λ) = λ` and `ι_{−1}(λ) = (−λ_n, …, −λ_1)`; each summand is irreducible and
  the summands are pairwise non-isomorphic. The product of leading principal minors `∏_{i ≤ min(n,d)} Δ_i^{μ_i − μ_{i+1}}` of the
  coordinate matrix is a joint highest weight
  vector of the summand of `μ` for `ε = +1` and a joint lowest weight vector for `ε = −1`.

*The form of the formal proof.* The formal proof has no statement that `θ(σ)` is irreducible, and (i) rests on the
sources cited below. It has, for all signatures of both spaces, the structure of the polynomial Fock space used in (ii):
the degrees and adjointness of the operators, each pair of types of the shape of 3.46a, route (1), exactly once among
the joint harmonics and no other pair, and generation by the harmonics under the raising operators (FormalProof,
`Formalism/PeriodIntegrals/JointBlockShapes/MinusPart.lean` (`FockH1Action.H1`) and
`Formalism/PeriodIntegrals/FockDegreeTwoParts.lean` (`PI.FockDegreeTwoParts.JointMult`,
`PI.FockDegreeTwoParts.HarmSplit`)).
(ii) and the types in (iii) follow from the formal proof, `Formalism/LocalRingCardinality/DataTheta.lean`
(`Formalism.BasicNotions.TH.JointShape`),
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/SchurStep.lean`
(`UpperTheory.TP.IsLiftWt`).

*Route.* (i) Howe's theory of joint harmonics: the `U(𝔤′)`-module generated by the `U(n)`-harmonics is
the whole polynomial Fock space (3.45(iii)). (ii) Kashiwara–Vergne's computation of the harmonics.
(iii) By 3.45(ii), `U(n) × U(d)` acts on the polynomials by `G ↦ det_J^{−1/2} · G ∘ k⁻¹`. For `ε = −1` (`J = i`)
the polynomials of degree `k` are `Sym^k` of the dual of `ℂⁿ ⊗ ℂ^d`, and `det_J^{−1/2}` restricts to `det^{−d/2}` on
`U(n)` and `det^{−n/2}` on `U(d)`; for `ε = +1` (`J = −i`) the space `(V ⊗ W, J)` is the complex conjugate of
`ℂⁿ ⊗ ℂ^d`, the polynomials are `Sym^k(ℂⁿ ⊗ ℂ^d)` and the twists are `det^{d/2}`, `det^{n/2}`: in both cases
`det^{εd/2}` and `det^{εn/2}`. The splitting characters add `det^{m_W/2}` on `U(n)` and `det^{m_V/2}` on `U(d)` (MetaplecticAutomorphicForms §3.3).
Apply the `(GL_n, GL_d)`-duality of TensorInductionAndFiniteGroupInputs §7.1, to `Sym^k(ℂⁿ ⊗ ℂ^d)` for `ε = +1` and to its
dual for `ε = −1`; in the second case the minors, highest weight vectors for the action `P(ᵗgXh)`, are lowest
weight vectors for `P(g⁻¹Xh^{−ᵗ})`. The orthogonal–symplectic analogue of (i)–(ii) is ModularityAndLanglandsExtensions
§3.1 (real `O(k) × Mp_{2n}`).

(Kashiwara–Vergne 1978; Howe 1989; A. Paul, *Howe correspondence for real unitary groups*, J. Funct.
Anal. 159 (1998).) *Needs:* 3.45; MetaplecticAutomorphicForms §§3.3, 3.7; TensorInductionAndFiniteGroupInputs §7.1; RepresentationTheory/CompactGroups
Layers 4–5; AutomorphicFormsOnReductiveGroups §§2.1, 2.4.

**Checks.**

- `n = 0`: the Fock space is a line on which `U(d)` acts by `det^{εb} = det^{m_V/2}`, the character
  `χ̃_V ∘ det` of MetaplecticAutomorphicForms §3.3's Check `V = 0` (`χ_V ∘ det` would be `det^{m_V}`), for either sign.
- `n = d = 1`, `V` and `W^♭` positive (`ε = −1`, `J = i`): `ℂ[z] = ⊕_k ℂ z^k`, `U(1) × U(1)` acting on `z^k` by
  `(t, s) ↦ (ts)^{−1/2}(ts)^{−k}t^{m_W/2}s^{m_V/2} = t^{−k−a}s^{−k−b}`, `a = (1 − m_W)/2`, `b = (1 − m_V)/2`. With `V`
  negative (`ε = +1`, `J = −i`, holomorphic coordinate `z̄`): `(t, s)` acts on `z̄^k` by `t^{k+a}s^{k+b}` with
  `a = (1 + m_W)/2`, `b = (1 + m_V)/2`. In both cases the weight of the first factor determines `k`, hence the
  weight of the second; this Check does not see the sign, the `U(d)`-weight `w + (m_V − m_W)/2` paired in `ω` with a
  `U(n)`-weight `w` being the same for both (the linear lift `∫θ(g, h; φ)F(g) dg` of a form of weight `w`, which pairs `ω`
  with the contragredient, has weight `−w + (m_V − m_W)/2`).
- *Holomorphy detects the sign.* Let `V` be positive definite of dimension `n` and `W` of dimension `2` with
  `W^♭ = ℓ₊ ⊕ ℓ₋` of signature `(1, 1)`. The vacuum of `(U(V), U(W))` is the tensor product of the vacua of the
  compact pairs `(V, ℓ₊)` (`ε = −1`) and `(V, ℓ₋)` (`ε = +1`), so by (iii) with `d = 1`, `μ = 0`, the group
  `U(ℓ₊) × U(ℓ₋)` acts on it by `k₊^{(m_V − n)/2}k₋^{(m_V + n)/2}`. Independently, write `W = Ey ⊕ Ey^*` with
  `⟨y, y^*⟩ = 1`, `n(X)y = y − Xy^*`, `m_t y = ty`, use the Schrödinger model on `V ⊗ y` and the Gaussian
  `e^{−π⟨u, u⟩}` (the vacuum for the positive line `E(y − (i/2)y^*)`): for a lattice `L ⊂ V`,
  `Σ_{x ∈ L} ω(n(X)m_t)φ(x) = (t/|t|)^{m_V}|t|^{−n} ϑ(Z)` with `ϑ(Z) = Σ_{x ∈ L} e^{2πiZ⟨x, x⟩}`, `Z = X + i/(2|t|²)`,
  `E(y − Zy^*)` the image of the base line. The factor is `det(g)^{(m_V + n)/2}J(g)^{−n}` with `J(g)` the scalar by
  which `g` maps `y − Z₀y^*` to a multiple of `y − (gZ₀)y^*`, holomorphic in `Z` and equal to `k₊` on `U(ℓ₊) × U(ℓ₋)`;
  since `ϑ` is a holomorphic modular form of weight `n`, the type is `det^{(m_V + n)/2}k₊^{−n} = k₊^{(m_V − n)/2}k₋^{(m_V + n)/2}`,
  as found. With `ε = +sgn(V)sgn(W^♭)` the type would be `k₊^{(m_V + n)/2}k₋^{(m_V − n)/2}`, for which the same holomorphic
  `ϑ` would have to be modular for the antiholomorphic factor.
- In the arithmetic form, for `ε = +1`: `2λ′_k = 2λ_k − d − m_W + n + m_V` for `k < n` and `2λ′_k = n + m_V`
  for `n ≤ k < d`, where `λ = μ + a`, `λ′ = (μ, 0) + b`.

### 3.46a Archimedean theta correspondence of discrete series, both members non-compact

*Origin:* adapted from Li (1990): the theta lift `θ(π_λ) = π_{λ′}` of a discrete series of `U(p, q)` whose parameter has entries of absolute value at least `(t + 1)/2`, stated here on the explicit Fock module `𝒫`, with the joint harmonic `Φ` and its zeta integral, multiplicity one, occurrence, and non-occurrence below first occurrence. The paragraph *Other normalisations* is this roadmap's own formulation.

*Method of the formal proof:* under (G), the lowest-`K̃`-type coefficient of `π_λ` on `exp(𝔭)` is identified with a `K̃`-average of products of powers of leading principal minors by comparing Taylor jets at the identity; its positivity makes the zeta integral of `Φ` nonzero; the lift is identified through its lowest `K̃`-type and the eigenvalue of a Casimir operator; and an equivariant map that vanishes on `Φ` is shown to be zero, by the classification of joint harmonics, which gives the uniqueness in (a), (b) and multiplicity one. Ichino (2020), §7.4, Lemma 7.7, obtains the nonvanishing of such a zeta integral from Flensted-Jensen's function of the lowest `K`-type (the normalised trace of the representation on that type; Flensted-Jensen (1980), §7) and the proof of Li (1990), Theorem 4.1, and Li (1990) identifies the lift with a module `A_𝔮(λ)` of Vogan and Zuckerman (1984) when the infinitesimal character is sufficiently regular (Ichino (2020), §1); the formal proof, in the argument under (G), uses instead the comparison of Taylor jets, the eigenvalue of the Casimir operator and the classification of joint harmonics.

*Setting.* Let `p, q, r, s ≥ 0` with `n = p + q ≥ 1` and `n′ = r + s = n + t`, `t ≥ 1`. Let `G = U(p, q)` be the unitary
group of `diag(1_p, −1_q)`, `G̃ = {(g, z) : z² = det g}` its determinant-square-root cover, `K̃` the preimage of
`U(p) × U(q)`, `𝔤_ℂ = 𝔤𝔩_n(ℂ)` with matrix units `E_{ab}`, `a, b ∈ I = I₊ ⊔ I₋` (`|I₊| = p`, `|I₋| = q`), and `𝔭_ℂ` the span of
the `E_{ab}` with `a`, `b` of different signs; likewise `G′ = U(r, s)`, `G̃′`, `K̃′`, `I′ = I′₊ ⊔ I′₋`. A pair
`(a, c) ∈ I × I′` is *even* if `a` and `c` have the same sign and *odd* otherwise. The *Fock module* `𝒫 = 𝒫(p, q; r, s)` is
`ℂ[z_{ac} : a ∈ I, c ∈ I′]` with the inner product for which the monomials are orthogonal and `‖z^κ‖² = κ!`, and with the
commuting actions

`E_{ab} ↦ Σ_{c ∈ I′} R_{ac}L_{bc} + (n′/2)δ_{ab}` of `𝔤𝔩_n(ℂ)`, `E_{cd} ↦ Σ_{a ∈ I} R_{ac}L_{ad} + (n/2)δ_{cd}` of `𝔤𝔩_{n′}(ℂ)`,

where `R_{ac} = z_{ac}`, `L_{ac} = ∂/∂z_{ac}` for even and `R_{ac} = −∂/∂z_{ac}`, `L_{ac} = z_{ac}` for odd `(a, c)`. It is a
dense subspace of its completion `𝓕`, which carries a unitary representation `ω` of `G̃ × G̃′`: the restriction
of an oscillator representation of the determinant-square-root cover of `U(pr + qs, ps + qr)` (the square root on the
image of `(g, h)` being `z_g^{n′}z_h^{n}`), whose polynomial Fock vectors (3.45), the vectors finite under the maximal
compact subgroup of that cover, are `𝒫`, and whose derivative on `𝒫` is given by the two actions above; the vacuum `1` has weight
`(r − s)/2` on `I₊` and `(s − r)/2` on `I₋`, and the variables of even pairs have positive weights (the paragraph *Other
normalisations* below relates this to 3.45–3.46). Inner products are linear in the first variable throughout this target.
A *module* of `G̃` is a `𝔤𝔩_n(ℂ)`-module that is locally finite under
`𝔤𝔩_p × 𝔤𝔩_q` and a sum of weight spaces for the diagonal matrices with rational weights; it is *unitarizable* if it has a
positive definite Hermitian form for which `𝔲(p, q)` acts by skew-Hermitian operators. Highest weights are taken for
the upper triangular matrices of each block (`E_{ab}`, `a` before `b` in the same block, are the raising operators),
with each of `I₊`, `I₋` ordered.

A *parameter* of `G̃` is `λ = (λ_a)_{a ∈ I}` with pairwise distinct entries in `½ℤ` and integral differences, written
`(λ₊ | λ₋)` with each block decreasing; `π_λ` is the discrete series of `G̃` with Harish-Chandra parameter `λ`, `d(π_λ)`
its formal degree, `π_λ^{K}` its Harish-Chandra module and `Λ(λ) = λ + ρ_n − ρ_c` the highest weight of its lowest
`K̃`-type (`ρ_n`, `ρ_c` the half-sums of the noncompact and of the compact roots that are positive on `λ`).

*Data.* Four strictly decreasing sequences `α, γ` of positive and `β, δ` of negative numbers, pairwise distinct, all in
`(t + 1)/2 + ℤ` and of absolute value at least `(t + 1)/2`, with `|α| + |β| = p`, `|γ| + |δ| = q`. Put
`σ_t = ((t − 1)/2, (t − 3)/2, …, −(t − 1)/2)`, `λ = (α, β | γ, δ)`, and

- case (+): `(r, s) = (|α| + |δ| + t, |γ| + |β|)`, `λ′ = (α, σ_t, δ | γ, β)`;
- case (−): `(r, s) = (|α| + |δ|, |γ| + |β| + t)`, `λ′ = (α, δ | γ, σ_t, β)`.

(The positive entries of `λ` keep their block, the negative ones change block, and the string `σ_t` is inserted in one
block.) *Gap hypothesis* (G): any two entries of `λ` in different blocks differ by more than `(n + t)³` and by at least
`120·n·min(p, q)^{3/2}`, and any two entries of `λ′` in different blocks differ by more than `(n + t)³`.

Prove that, in both cases:

- (a) *From the larger to the smaller member.* For every unitarizable module `M` of `G̃` and every nonzero
  `(𝔤 ⊕ 𝔤′)`-equivariant map `f : 𝒫 → M ⊗ π_{λ′}^{K′}` there is a submodule `N ⊂ M` isomorphic to `π_λ^{K}` with
  `f(𝒫) = N ⊗ π_{λ′}^{K′}`; `f(Φ) ≠ 0` for the joint harmonic `Φ` of (d); and an equivariant `f′ : 𝒫 → M ⊗ π_{λ′}^{K′}` with
  `f′(Φ) = f(Φ)` is equal to `f`.
- (b) *From the smaller to the larger member.* The same with the two groups exchanged: for every unitarizable module
  `M′` of `G̃′` and every nonzero equivariant `f : 𝒫 → π_λ^{K} ⊗ M′` there is `N′ ⊂ M′`, `N′ ≅ π_{λ′}^{K′}`, with
  `f(𝒫) = π_λ^{K} ⊗ N′`; `f(Φ) ≠ 0`; and `f` is determined by `f(Φ)`.
- (c) *Non-occurrence below first occurrence.* (c1) For `1 ≤ i ≤ min(r, s)` and every module `M′` of the cover of
  `U(r − i, s − i)`, every equivariant map `𝒫(p, q; r − i, s − i) → π_λ^{K} ⊗ M′` is zero. (c2) If `(t + 1)/2` and
  `−(t + 1)/2` are not both entries of `λ`: for `1 ≤ i ≤ min(p, q)` and every module `M` of the cover of `U(p − i, q − i)`,
  every equivariant map `𝒫(p − i, q − i; r, s) → M ⊗ π_{λ′}^{K′}` is zero.
- (d) *The joint harmonic and its zeta integral.* Up to a scalar of modulus one there is exactly one `Φ ∈ 𝒫` of norm
  one that is annihilated by the degree-lowering components of the operators of `𝔭_ℂ` and `𝔭′_ℂ` and is a highest weight
  vector of weight `Λ(λ)` for `𝔨_ℂ` and `Λ(λ′)` for `𝔨′_ℂ`. For a unit highest weight vector `v` of the lowest `K̃`-type of
  `π_λ`, the function `g ↦ ⟨ω(g, 1)Φ, Φ⟩·conj⟨π_λ(g)v, v⟩` is integrable on `G̃`. If moreover `g ↦ ⟨π_λ(g)v, v⟩` is
  integrable on `G̃` (it is under (G)), then
  `∫_{G̃} ⟨ω(g, 1)Φ, Φ⟩·conj⟨π_λ(g)v, v⟩ dg = ‖P_vΦ‖²/d(π_λ) > 0`, where
  `P_v := ∫_{G̃} d(π_λ)·conj⟨π_λ(g)v, v⟩·ω(g, 1) dg` is the orthogonal projection of `𝓕` onto the closure of the span of
  the vectors `T(v)`, `T ∈ Hom_{G̃}(π_λ, 𝓕)`. If `G′` is compact (`rs = 0`), then `P_vΦ = Φ` and the integral is `1/d(π_λ)`.
- (e) *Multiplicity one.* The equivariant maps `𝒫 → π_λ^{K} ⊗ π_{λ′}^{K′}` form a line.
- (f) *Occurrence.* Under the integrability hypothesis of (d), there is a `G̃ × G̃′`-equivariant isometric embedding of
  the Hilbert tensor product `π_λ ⊗ π_{λ′}` into `𝓕` whose image is not orthogonal to `Φ`.

*Other normalisations.* Complex conjugation of polynomials carries `𝒫` to the module `𝒫̄` with all weights negated,
and `π_λ` to `π_{−λ}` (entries negated, each block reordered); it preserves every notion above, so (a)–(f) hold for
`𝒫̄` with `(−λ, −λ′)` in place of `(λ, λ′)`: there the entries below `0` keep their block. In the normalisation of 3.45
and 3.46 (`ψ_ℝ(x) = e^{2πix}`; for `V` of signature `(p, q)` and `W^♭` of signature `(r, s)`) the polynomial Fock space of
the pair `(U(V), U(W))` with splitting characters of infinity types `m_V`, `m_W` is `𝒫̄` twisted by `det^{m_W/2}` on `U(V)`
and `det^{m_V/2}` on `U(W)`; so there the statements hold for the discrete series of `U(V)(ℝ)` and `U(W)(ℝ)` with
parameters `−λ + m_W/2` and `−λ′ + m_V/2`: the parameter of `U(W)` is that of `U(V)` shifted by `(m_V − m_W)/2`, with the
string of length `t` centred at `m_V/2` inserted, the entries of the parameter of `U(V)` below `m_W/2` keeping their
block and those above `m_W/2` changing block.

*The form of the formal proof.* The formal proof has (a)–(f) for data satisfying (G), both parts of (c) included; the
route of (c) does not use (G). Without (G), (a), (b) and (e) rest on J.-S. Li's identification (Remark), and (c), (d)
and (f) on the route below. In FormalProof (G) is `Formalism/LocalRingCardinality/DataTheta.lean`
(`Formalism.BasicNotions.TH.HypG`, `Formalism.BasicNotions.TH.HypGm`), (a)–(f) are
`Formalism/SharpRestriction/Divisibility/SchurIrreducible.lean` (`Formalism.MainNotions.SchurIrreducible.ArchimedeanRallisFirst`
to `Formalism.MainNotions.SchurIrreducible.ArchimedeanRallisFifth`), and they are proved in
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/ExistsRealDiscreteSeriesDataThetaProperties.lean`
(`GlobalTheory.RealPlaceTheta.exists_record_theta_all`), from the two published inputs it assumes
(`GlobalTheory.Published.DiscreteSeriesCover`, `GlobalTheory.Published.HarishChandraModules`).
The uniqueness of `Φ` in (d) follows from the formal proof,
`Development/AbelianVarietyTheory/Proofs/TwistedOperators/FockModelJointHarmonicsFormNormalisationUniqueneStatement.lean`
(`GlobalTheory.T.fockModel_jointHarmonics_form_normalisation_uniqueness`).

*Status.* The paragraph *Other normalisations* is this roadmap's own and is not on the path of the formal proof.

*Route.* (1) *The Fock module:* `𝔨_ℂ`, `𝔨′_ℂ` preserve the degree and `𝔭_ℂ`, `𝔭′_ℂ` have components of degree `±2`, adjoint to
each other up to sign; a `K̃`-type of highest weight `μ` occurs only in degrees at least `Σ_{a ∈ I₊}|μ_a − (r − s)/2| + Σ_{a ∈ I₋}|μ_a + (r − s)/2|`; the joint harmonics contain a pair of types `(μ, μ′)` at most once, exactly when
`μ − ((r − s)/2 | (s − r)/2) = (a, 0, b | c, 0, d)` and `μ′ − ((p − q)/2 | (q − p)/2) = (a, 0, d | c, 0, b)` for sequences of
integers `a, c > 0 > b, d`; and `𝒫` is generated by the harmonics under the degree-raising operators (3.46 for the
compact case; Kashiwara–Vergne, Howe). (2) *The discrete series:* Blattner's formula (the lowest type has multiplicity
one and every `K̃`-type is `Λ(λ)` plus a sum of noncompact roots positive on `λ`) and the Casimir eigenvalue
`|λ|² − |ρ|²`; consequently the lowest type has least degree in the sense of (1). The pairs `(Λ(λ), Λ(λ′))` of the data
are of the shape of (1), and `|λ′|² − |ρ_{n′}|² = |λ|² − |ρ_n|² − nn′(n′ − n)/4`, the relation between the two Casimir
operators on `𝒫`. (3) *(d):* the integrability of the product is that of the local doubling zeta integral at `s = t/2`
for a discrete series of the smaller member (Ichino20, §7.2, p. 30, by Lemma 7.1, p. 29); when the lowest-type coefficient of
`π_λ` is integrable (under (G) it is), `P_v` is the projector of the statement and the integral is `⟨P_vΦ, Φ⟩/d(π_λ)`; `P_vΦ ≠ 0` because both coefficients are nonnegative on `exp(𝔭)` and
positive at `1`. (4) *(f):* `P_vΦ` is a `K̃′`-highest weight vector of weight `Λ(λ′)` in the `π_λ`-isotypic part of `𝓕`, on
which the Casimir operator of `𝔤′` acts by the eigenvalue of `π_{λ′}`; under (G) a unitary representation generated by
such a vector contains `π_{λ′}`; in general the `π_λ`-isotypic part of `𝓕` is `π_λ ⊗ 𝓜` for a unitary representation `𝓜`
of `G̃′`, the projection of `𝒫` to it is nonzero on `Φ`, and (b) identifies its image. (5) *(a), (b), (e):* a nonzero
equivariant map is nonzero on a joint harmonic carrying a type of least degree of the discrete series, hence on `Φ`;
`f(𝒫) = N ⊗ π_{λ′}^{K′}` with `N` a unitarizable, hence semisimple, quotient of the big theta lift of `π_{λ′}`, so `N` is
the small theta lift `θ(π_{λ′})` (Howe duality, MetaplecticAutomorphicForms §3.7), and `θ(π_{λ′}) = π_λ^{K}`: under (G)
because the module generated by the first factor of `f(Φ)` has the lowest type and the Casimir eigenvalue of `π_λ`, and
in general by J.-S. Li's identification `θ(π_λ) = π_{λ′}` for these data (Remark); uniqueness by applying this to
`f′ − f`; (e) is at most one-dimensional by Howe duality and nonzero by that identification. (6) *(c):* an equivariant map from the Fock module of the lowered pair would
be nonzero on a joint harmonic carrying the lowest type of the discrete series, but that type is not the member of a
pair of the shape of (1) for the lowered pair; for (c2) this is where the hypothesis enters. Steps (3), (4) and (5)
are outlines: the proofs of the integrability and the value of the zeta integral in (3), of the embedding in (4) and
of the uniqueness in (5) are not given here.

*Remark.* (G) is a hypothesis of the Casimir route only, which uses the Casimir operator in place of the infinitesimal
character. The identification `θ(π_λ) = π_{λ′}` for these data is J.-S. Li's (J.-S. Li 1990): its hypothesis, that the
entries of `λ` have absolute value at least `(t + 1)/2`, is the bound in the data above, under which Li's theorem gives
Ichino20, Theorem 4.1 (i), p. 7 (Ichino20, Remark 4.2, p. 8). Without that bound Ichino20, Theorem 4.1 determines the
theta lifts of all discrete series, conditionally on Arthur's multiplicity formula for unitary groups (Ichino20, §1,
p. 2); A. Paul determined the correspondence in the equal and the almost equal rank cases (Ichino20, §1, p. 1), the
latter being `t = 1` here. The clauses on the explicit Fock module `𝒫` and its joint harmonic are not taken from a
publication: the route above is their proof.

*Needs:* 3.45, 3.46; MetaplecticAutomorphicForms §3.7; AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 2.4.

**Checks.**

- `U(1) × U(1, 1)`, `t = 1`: `𝒫 = ℂ[z₁, z₂]` (`z₁` even, `z₂` odd); `U(1)` acts on `z₁^iz₂^j` with weight `i − j`, the torus of
  `U(1, 1)` with weights `(i + ½ | −j − ½)`, and `𝔭′_ℂ` by `z₁z₂` and `−∂₁∂₂`. For `k ≥ 1` the weight-`k` part is spanned by the
  `z₁^{k+j}z₂^j`; it is the irreducible lowest weight module generated by the harmonic `Φ = z₁^k/√(k!)` of type
  `(k + ½ | −½) = Λ((k | 0))`: this is case (−) with `α = (k)`, `λ′ = (k | 0)`. For `k ≤ −1` the harmonic is
  `z₂^{|k|}/√(|k|!)` of type `(½ | k − ½) = Λ((0 | k))`: case (+) with `β = (k)`, `λ′ = (0 | k)`, the negative entry having
  changed block. `k = 0` is excluded by `|k| ≥ (t + 1)/2`. In (d), `G̃` is compact, `P_vΦ = Φ` and the integral is the
  volume of `G̃`, which is `1/d`. In (c1), `𝒫(1, 0; 0, 0) = ℂ` has `U(1)`-weight `0 ≠ k`. (G) asks `|k| > 8`: it is not
  necessary.
- *The hypothesis of (c2) is needed.* `t = 1`, `λ = (1 | −1)` on `U(1, 1)`, case (+): `(r, s) = (3, 0)` and
  `λ′ = (1, 0, −1 | ∅) = ρ`, the trivial representation of `U(3)`. The lowered pair is `U(0, 0) × U(3)`, whose Fock module
  is the trivial line; so a nonzero map exists. Here both `(t + 1)/2 = 1` and `−1` are entries of `λ`. (The lowest type
  of `π_λ` is `(3/2 | −3/2)`, the weight of the vacuum of `𝒫(1, 1; 3, 0)`, as it must be by 3.46.)
- *Both members compact* (`q = s = 0`): `λ = α`, `λ′ = (α, σ_t)`; with `α_k = μ_k + (t + 1)/2 + n − k` for a partition `μ`
  these are the parameters of the summand of `μ` in 3.46 (iii) for `ε = −1` after negation, and (d) gives `1/d(π_λ)`,
  Schur orthogonality on `U(n)`.
- (a) does not say that the coinvariants of `𝒫 ⊗ (π_{λ′}^{K′})^∨` under `𝔤′` are irreducible: it identifies their
  unitarizable quotients.

### 3.47 Local complementary data and local matching at split places

*Origin:* adapted from Kudla and Sweet (1997), the theta quotients of the trivial representations of complementary spaces, and Mínguez (2008), Théorème 1, the theta correspondence for general linear groups: local complementary data and local matching data, here at split places, with the matching realised by two zeta integrals of Godement–Jacquet type (Godement and Jacquet (1972)). The bullets on the dependence of the zeta integrals on the data and on self-dual lattices for every conductor of `ψ` are this roadmap's own formulation.

*Method of the formal proof:* both maps to the matched quotient are zeta integrals of Godement–Jacquet type with values in the representation of `GL_N(F)` induced from `α_w ∘ det_a ⊗ β_w ∘ det_{a′}`, in the unramified case normalised by the inverse `L`-factor so that both lattice vectors go to the function equal to `1` on `GL_N(𝒪_F)`; they are onto because this induced representation is irreducible, being unitarisable and admissible with a Jacquet module that admits, up to scalars, one map to the inducing character when `a ≠ a′`. The route written here computes the coinvariants by the filtration by rank, proves the irreducibility by Zelevinsky's criterion for segments, and treats the unramified case by spherical vectors and Satake parameters.

Define a *local complementary datum*. Over a local field `F` of characteristic zero and a quadratic étale
`E/F`: Hermitian spaces `V`, `V′` of dimensions `a > a′`, a skew-Hermitian `W` of dimension `N = a + a′` with
an isometry `δ⁻¹W ≅ V ⊕ V′(−1)`, unitary characters `β`, `α` of `E^×` with `β|_{F^×} = ω_{E/F}^a`,
`α|_{F^×} = ω_{E/F}^{a′}`, the Weil representations `ω` of `U(V) × U(W)` with splitting data `(β, β/α)` and
`ω′` of `U(V′) × U(W)` with `(α, α/β)` (MetaplecticAutomorphicForms §3.3, §3.2a), and `ν = α/β`. The *theta quotients* are
`Θ = ω_{U(V)}` and `Θ′ = ω′_{U(V′)}` (coinvariants, MetaplecticAutomorphicForms §3.4 for the trivial representation) at a finite place,
and at a real place the coinvariants of the polynomial Fock spaces (3.45) under `(𝔲(V), K_V)` and
`(𝔲(V′), K_{V′})`, as `(𝔲(W), K_W)`-modules. *Local matching data* `(Π, p, p′)`: a nonzero irreducible
`U(W)`-module (a `(𝔲(W), K_W)`-module at a real place) `Π` with only scalar endomorphisms and surjections
`p : Θ → Π`, `p′ : Θ′ → Π`, such that `Θ` (resp. `Θ′`) has a unique maximal proper submodule, namely `ker p` (resp.
`ker p′`). Then `p` and `p′` are unique up to scalars, every nonzero map from `Θ` or `Θ′` to `Π` is a multiple of
them, and every semisimple quotient of `Θ` or `Θ′` is a quotient of `Π`.

*The form of the formal proof.* The complementary data used have `a + a′` even, `a′ ≥ 2` and `(a − a′)/2 ≥ 2`; they
are local components of global data over a CM extension `E/F` with `E` Galois over `ℚ`, unramified at every finite
place, at split places, at
unramified inert places of odd residue characteristic and residue cardinality greater than `3`, and at real places in
the range of 3.47b. For complementary data the formal proof has 3.47 (for the irreducibility see *Status* below), 3.47a,
3.47b, 5.7c (c), (d) and 5.7d in this setting only; their statements here for every local complementary datum rest on the
routes written at those targets and on the published sources cited there. It has 5.7a, 5.7b (i), (iii), 5.7c (L), (U),
(i), (ii) and 5.7e for the unitary pairs over such a CM extension, with the standard additive character and one
signature at all real places, and with no condition of a complementary datum, their wider statements here resting
likewise on those routes and sources; and lemmas 2 and 3 of 3.47c and the second assertion of 5.7b (ii) as local
statements with no standing hypothesis. In FormalProof these data are
`Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.IsTriple`), 3.47 and 3.47a are
`Development/WeilBound/CoreStatements/CompactAveragingSplitting/EigenvectorLifting/FinSplit.lean` (`PositivityTheory.ThK.FinRam`,
`PositivityTheory.ThK.FinSplit`, `PositivityTheory.ThK.FinInert`), and lemmas 2 and 3 of 3.47c are
`Development/WeilBound/ThetaLifts/EigenvalueEndgame/CuspidalAverages/KeyThree.lean` (`PositivityTheory.ThKEnd.Cusp.LocThree`,
`PositivityTheory.ThKEnd.Cusp.LocTwo`).

Prove local matching at split places: let `E = F × F`, so that `U(W) ≅ GL_N(F)` and `Θ`, `Θ′` are the coinvariants of the
type-II Weil representations of `(GL_a, GL_N)` and `(GL_{a′}, GL_N)` on `S(M_{a×N}(F))`, `S(M_{a′×N}(F))`,
twisted by the splitting characters (MetaplecticAutomorphicForms §§3.2a, 3.14). Then:

- if `α`, `β` are unramified (any `ψ`, any residue characteristic), local matching data exist, `Π` is the spherical
  constituent common to `Θ` and `Θ′`, `Θ` and `Θ′` are generated by their spherical lines, which are
  one-dimensional and spanned by the images of the lattice vectors `1_{M_{a×N}(𝒪)}`, `1_{M_{a′×N}(𝒪)}` of 3.21a (split
  case), and these vectors correspond;
- if `ν` is ramified and `ψ` is unramified, local matching data exist with `p`, `p′` realised by two zeta integrals of
  Godement–Jacquet type, in the following models. Write `V = R ⊕ R^∨`, `V′ = R′ ⊕ R′^∨`, `W = Q ⊕ Q^∨` (MetaplecticAutomorphicForms §3.2a), with
  `U(V) ≅ GL(R)`, `U(V′) ≅ GL(R′)`, `U(W) ≅ GL(Q) = GL_N(F)` through the components at one factor `w` of `E = F × F`, and
  `α_w`, `β_w`, `ν_w` the components of the characters there (so `χ̃(det h) = χ_w(det(h|_Q))`). Realise `ω` on
  `S(R ⊗ Q) = S(M_{a×N}(F))` and `ω′` on `S(R′^∨ ⊗ Q^∨) = S(M_{a′×N}(F))`, in a basis of `Q`, its dual basis of `Q^∨` and
  bases of `R` and `R′^∨` (the pairs act on these Lagrangians by `x ↦ gxᵗh` and `y ↦ ᵗg′⁻¹yh⁻¹`); by MetaplecticAutomorphicForms §3.2a (the evaluation at `0`
  transforms by `χ̃_W(det g)χ̃_V(det h)` times a positive factor, the split law restated in 4.4a),
  `(ω(g, h)Φ)(x) = ν_w(det g)⁻¹β_w(det h)|det g|^{−N/2}|det h|^{−a/2}Φ(g⁻¹xᵗh⁻¹)` and
  `(ω′(g′, h)Φ′)(y) = ν_w(det g′)α_w(det h)|det g′|^{N/2}|det h|^{a′/2}Φ′(ᵗg′yh)`. With `X₀ = [1_a | 0]` and `Y₀ = [0 | 1_{a′}]`
  (the row space of `Y₀` in `Q^∨` is the annihilator of that of `X₀` in `Q`), put
  `P(Φ)(h) = Σ_{m ∈ ℤ} ∫_{val det g = m} (ω(1, h)Φ)(gX₀) ν_w(det g)|det g|^{N/2} dg` over `GL_a(F)`, with the Haar measure `dg`
  giving `GL_a(𝒪_F)` volume one (a finite sum of shell
  integrals: the shells with `m` very negative miss the support, and those with `m` large vanish because `ν` is
  ramified; it is the value of the continuation in the exponent, the integral itself converging absolutely only when
  `N/2 > a − 1`, that is for `a − a′ = 1`), and `P′(Φ′)(h) = ∫_{GL_{a′}(F)} (ω′(1, h)Φ′)(gY₀) ν_w(det g)|det g|^{N/2} dg` (absolutely
  convergent, `N/2 > a′ − 1`), with the Haar measure giving `GL_{a′}(𝒪_F)` volume one. Then `P` is `U(V)`-invariant, `P′` is `U(V′)`-invariant, both intertwine `ω(1, h)`, `ω′(1, h)`
  with right translation, and for `p = [[A, B], [0, D]]` in the parabolic subgroup `P_{(a,a′)}` (blocks `a`, `a′`) both
  satisfy `f(ph) = α_w(det A)|det A|^{a′/2}β_w(det D)|det D|^{−a/2}f(h)`: they factor through `Θ`, `Θ′` and are nonzero
  `U(W)`-maps into the normalised induction `α_w ∘ det_a × β_w ∘ det_{a′}`, hence isomorphisms of `Θ` and of `Θ′` onto it
  (*irreducibility*), and
  `(Φ, Φ′)` match exactly when `P(Φ) = P′(Φ′)`;
- *dependence of the zeta integrals on the data*: replacing `Y₀` by `g₀Y₀`, `g₀ ∈ GL_{a′}(F)`, multiplies `P′` by
  `ν_w(det g₀)⁻¹|det g₀|^{−N/2}`, and replacing `X₀` by `g₁X₀`, `g₁ ∈ GL_a(F)`, multiplies `P` by `ν_w(det g₁)⁻¹|det g₁|^{−N/2}`;
  changing the basis of `R` by `k₁ ∈ GL_a(F)` multiplies `P` by `ν_w(det k₁)⁻¹|det k₁|^{−N/2}`, changing that of `R′` by
  `k′ ∈ GL_{a′}(F)` (and the dual basis of `R′^∨` with it) multiplies `P′` by `ν_w(det k′)|det k′|^{N/2}`, and changing the
  basis of `Q` by `k ∈ GL_N(F)` (and the dual basis of `Q^∨` with it, `X₀`, `Y₀` kept as matrices) replaces `P` and `P′` by
  `β_w(det k)|det k|^{−a/2}` and `α_w(det k)|det k|^{a′/2}` times their translates by `k⁻¹`, which multiplies the matching
  relation by `ν_w(det k)|det k|^{N/2}`. The two Haar measures are part of the data: rescaling the measure of `GL_{a′}(F)`
  alone rescales `P′` alone, with all bases fixed, and changes the matching relation by that factor; this is why they are
  fixed above. So if the models are written in `𝒪_F`-bases of lattices `Λ ⊂ R`, `Λ′ ⊂ R′`, `Λ_W ⊂ Q` (and the dual bases),
  with `X₀`, `Y₀` and the measures as above, another such choice changes the matching relation by an element of the finite
  group `ν(𝒪_E^×) = ν_w(𝒪_F^×)` (`ν` is trivial on `F^×`; all the moduli `|det|` are `1` for integral changes). With the same action of `GL_N(F)` on both models, or with row spaces that
  do not annihilate each other, the two functions are equivariant under parabolic subgroups of different types and do
  not define a matching (Check);
- *self-dual lattices for every conductor of `ψ`* (for the maps of 5.7c): for `c ∈ F^×`, `(V, V′, cW)` is again a local
  complementary datum (at a split place every Hermitian space is determined by its dimension), with the same groups, and the
  Weil representations of `(𝕎, cB)` for `ψ` and of `(𝕎, B)` for `ψ(c ·)` are the same representation (the Heisenberg groups are
  identified by `(t, w) ↦ (t/c, w)`); the maps of 5.7c for the pair `(x, y)` of `W` and for the pair `(x, cy)` of `c⁻¹W` differ
  by nonzero scalars depending on `c`, the character and the exponent (the coordinate along the line is divided by `c`, and
  the self-dual measure is rescaled). No identification of the maps is needed: 5.7c(d) holds for a lattice of `W` self-dual
  for `ψ ∘ Tr ∘ ⟨·,·⟩_W` and a hyperbolic pair adapted to it, for every conductor of `ψ` at a split place, in the form "the cone
  and the dual cone carry the lattice vector to a nonzero multiple of the lattice vector of `(X₁, W₁)`, and `e₀` likewise";
  the multiple is the unramified Tate value times a value of `μ` on the ideal of the line and a power of the residue
  cardinality;
- *irreducibility*: if `ν` is ramified, or unramified with `ν(ϖ) ≠ 1`, then
  `Θ` and `Θ′` are irreducible and both isomorphic to the normalised parabolic induction
  `α_w ∘ det_a × β_w ∘ det_{a′}` from the parabolic subgroup of type `(a, a′)` of `GL_N(F)` (`α_w`, `β_w` the
  components of `α`, `β` at the factor of `E = F × F` that the identification `U(W) ≅ GL_N(F)` selects); the twisted
  coinvariants of the functions of full rank are this induced representation and map isomorphically onto `Θ`, resp. `Θ′`;
  so `Π = Θ = Θ′`, and every `U(W)`-equivariant linear map out of `Θ` or `Θ′` factors through `Π`.

*Status.* The bullets on the dependence of the zeta integrals on the data and on self-dual lattices for every conductor
of `ψ` are this roadmap's own and are not on the path of the formal proof. The identification of `Θ` and `Θ′` with
`α_w ∘ det_a × β_w ∘ det_{a′}` (in the second bullet and in the bullet *irreducibility*) is published for `N` even
(S. Kudla, W. J. Sweet, *Degenerate principal series representations for U(n,n)*, Israel J. Math. 98 (1997)), and for
`N` odd only its statement on the irreducible quotient follows from Mínguez08, Théorème 1; in the formal proof the
matched quotient is this induced representation, onto which the two zeta integrals map `Θ` and `Θ′`. The irreducibility of `Θ`
and `Θ′` for `ν` ramified, or unramified with `ν(ϖ) ≠ 1`, is on that path, at the split places of the unitary pairs of
the paragraph *The form of the formal proof* above: the coinvariants of each of the two pairs have no nonzero proper
`U(W)`-invariant subspace (5.7b (ii)). The comparison of the two theta integrals uses it at the places split
completely where `ν` is unramified with `ν(ϖ) ≠ 1`, where the kernels of the maps to the matched quotient are exactly
the coinvariant relations, so that `Θ = Θ′ = Π`.
The formal proof states the formulas for `ω`, `ω′`, `P`, `P′` and the matching of the second bullet in
`Development/AbelianVarietyTheory/Definitions/Divisors/RankEqCardIffExistsFrameMatrixFirstColumnBlock.lean`
(`GlobalTheory.SplitFlip.omA`); the first bullet follows from the formal proof,
`Development/WeilBound/CoreStatements/CompactAveragingSplitting/EigenvectorLifting/FinSplit.lean`
(`PositivityTheory.ThK.FinSplit`), `Development/WeilBound/ThetaLifts/SphericalLattices/HoweInert.lean`
(`PositivityTheory.Sph.SphSplit`),
`Development/WeilBound/CoreStatements/TemperedRepresentationTheory/HoweMaximalTori/MaxSplit.lean`
(`PositivityTheory.HoweDualityUnitaryAlt.MaxFinT`).

*Route.* Compute both coinvariant modules through the filtration of the type-II model by the orbits of
`GL_a × GL_N` on `a × N` matrices (functions on an orbit as sections over a homogeneous space,
SmoothRepresentationsOfLocalGroups §SR.2.1 *l-sheaf-model*, and the geometric lemma, §SR.2.2 *geometric-lemma*):
each is a quotient of a representation induced from a character of a maximal parabolic. *Nonvanishing:* `Θ ≠ 0` and
`Θ′ ≠ 0` by 3.9a(ii) (split case, `N ≥ a > a′`). When `α`, `β` are unramified, each is generated by the image of its
lattice vector (3.21a(i), split case: averaging over `K = GL_a(𝒪)` maps `ω` onto `ω^K` without changing images in the
coinvariants, and `ω^K` is the `U(W)`-module generated by `φ₀`), so that image is nonzero; the `K′`-fixed vectors of the
coinvariants are the images of `ℋ′·φ₀`, on which the Hecke algebra of `GL_a` acts through its trivial character, so they
form a line; a proper submodule contains no nonzero `K′`-fixed vector, and neither does the sum of all proper submodules
(taking `K′`-invariants commutes with sums), which is therefore the unique maximal proper submodule; the two spherical
quotients have the same Satake parameter by 3.21a(iii). In the ramified case: `U(V)`-invariance of `P` by `g ↦ g′g`, of `P′`
by `g ↦ ᵗg′⁻¹g`; the left law of `P` from `X₀ · ᵗp⁻¹ = ᵗA⁻¹X₀` and the substitution `g ↦ gᵗA` (factor `ν_w(det A)|det A|^{N/2}`,
which turns `β_w(det p)|det p|^{−a/2}` into the law above), that of `P′` from `Y₀p = DY₀` and `g ↦ gD⁻¹` (factor
`ν_w(det D)⁻¹|det D|^{−N/2}`, turning `α_w(det p)|det p|^{a′/2}` into the same law; `α/ν = β`); the shells of `P` are finite
in number by Godement–Jacquet's theory for the ramified character `ν_w ∘ det` (its `L`-factor is `1`, so the zeta integral is
a Laurent polynomial in `q^{−s}`; AutomorphicLFunctionsAndLocalFactors §§AL.1, AL.2); `P(Φ)(1) ≠ 0` and `P′(Φ′)(1) ≠ 0` for `Φ`,
`Φ′` supported near `X₀`, `Y₀`. The dependence on the data: the substitutions `g ↦ gg₀⁻¹`, `g ↦ gg₁⁻¹`; a change of basis
of `R` or `R′` is `ω(k₁⁻¹, 1)` or `ω′(k′⁻¹, 1)` up to the displayed factor, and `P`, `P′` are invariant; a change of basis of `Q`
writes `h` as `k⁻¹hk` and the arguments as `X₀ᵗ(k⁻¹h)⁻¹`, `Y₀k⁻¹h`. Irreducibility: the stratum of matrices of
rank `r < a` is a homogeneous space of `GL_a × GL_N`, and its twisted `GL_a`-coinvariants are induced from the stabiliser
of the point `[1_r 0; 0 0]`; the subgroup `diag(1_r, g₂)`, `g₂ ∈ GL_{a−r}`, of that stabiliser fixes the point (not the stratum)
and acts on the fibre through `ν⁻¹(det g₂)|det g₂|^{s}` with `s` real (the Weil twist and the relative modulus); this
character is nontrivial when `ν` is not of the form `|·|^{s}`, which for unitary `ν` means `ν` ramified or `ν(ϖ) ≠ 1`, and a
nontrivial character of a group acting trivially on the point leaves no coinvariants in the fibre, so the stratum has
zero twisted coinvariants (the argument of 5.7b(ii)). The open stratum of matrices of full rank is
one `GL_a × GL_N`-orbit, `GL_a\{rank a} = P_{(a,a′)}\GL_N` (`x = gX₀ᵗh⁻¹`), and its twisted `GL_a`-coinvariants are the
induced representation above, the coinvariant map being `P`; so `Θ`, which is nonzero, is a quotient of it, isomorphic to
it once it is irreducible. That induced representation is the product `Z(Δ_α) × Z(Δ_β)` of
the characters `α_w ∘ det_a = Z(Δ_α)`, `β_w ∘ det_{a′} = Z(Δ_β)` of the segments `Δ_α = {α_w|·|^{(a−1)/2 − i}}` and
`Δ_β = {β_w|·|^{(a′−1)/2 − j}}` (SmoothRepresentationsOfLocalGroups *segment-representations*), and it is irreducible
because the two segments are not linked, `α_w/β_w` not being a real power of `|·|` (Zelevinsky's criterion,
LocalFactorsOfTwistsAndTypes §4.1 (ii)). The same for `Θ′` in the model on
`S(R′^∨ ⊗ Q^∨)`: the full-rank matrices are `GL_{a′}Y₀GL_N`, the stabiliser of the row space of `Y₀` is `P_{(a,a′)}`, and the
twisted coinvariants of the open stratum are, by the law of `P′`, the same induced representation. (In the model on
`S(R′ ⊗ Q)` the open stratum gives `Z(Δ_β) × Z(Δ_α)`, isomorphic to it: the two irreducible products have the same image in
the commutative Grothendieck ring, LocalFactorsOfTwistsAndTypes §4.1 (iv).)

(Mínguez08, Théorème 1, p. 718, whose proof goes through Kudla's filtration; R. Godement, H. Jacquet, LNM 260 (1972);
A. Zelevinsky, Ann. Sci. ÉNS 13 (1980), Theorem 4.2, p. 184, for products of segments.) *Needs:* 3.9a, 3.21a; MetaplecticAutomorphicForms §§3.2a, 3.4, 3.14; SmoothRepresentationsOfLocalGroups §SR.2.1 *l-sheaf-model*, §SR.2.2
*geometric-lemma*, §SR.3.1, *segment-representations*; LocalFactorsOfTwistsAndTypes §4.1 (ii), (iv);
AutomorphicLFunctionsAndLocalFactors §§AL.1.2.1, AL.1.2.3 and AL.2.1.4.

**Checks.**

- When `ν` is unramified with `ν(ϖ) ≠ 1`, `Θ = Θ′ = Π` and every nonzero map out of `Θ′` is a multiple of `p′`, so a zeta
  integral, where defined and nonzero, gives the matching of the first case up to a scalar; the statement uses the zeta
  integrals only for ramified `ν`.
- `a = 2`, `a′ = 1`, `N = 3`, and the same action `x ↦ xᵗh⁻¹` of `GL_3` on both models: `P(Φ)` is left equivariant under the
  stabiliser of the plane spanned by the rows of `X₀`, while `∫Φ′(gY₀ᵗh⁻¹)…` is equivariant under that of a line, the
  transposed parabolic subgroup; the two functions live on dual projective planes, the two parabolic subgroups generate
  `GL_3`, and the images meet in at most the line of a character of `GL_3`, so no `Φ` with `P(Φ) ≠ 0` has a partner. With
  `β_w(det h)` in place of `α_w(det h)` in `ω′(1, h)`, the image of `P′` has central character `β_w^{a+2a′}α_w^{−a′}` instead of
  `α_w^aβ_w^{a′}`, the two differing by `ν_w^{−N}`.
- The moduli in the change of basis of `Q`: for `k = diag(ϖ, 1, …, 1)` the factors are `β_w(ϖ)q^{a/2}` on `P` and
  `α_w(ϖ)q^{−a′/2}` on `P′`, not `β_w(ϖ)`, `α_w(ϖ)`; the matching relation changes by `ν_w(ϖ)q^{−N/2}`, not an element of
  `ν_w(𝒪^×)`. Only changes of integral bases of the same lattices give the finite ambiguity.
- The exponent of the first zeta integral: `a − 1 − N/2 = ε₀ − 1` with `ε₀ = (a − a′)/2`, nonnegative exactly when
  `ε₀ ≥ 1` (`a − a′ ≥ 2`), so absolute convergence fails there and the shell sum is needed; for `a − a′ = 1` it is `−½`
  and the integral converges absolutely.
- The hypothesis on `ν` is used only for the strata of rank `< a`. For `ν` trivial the induced representation is
  still irreducible (the two segments have the same centre, so they are nested when `a ≡ a′ (mod 2)` and lie in
  different cosets of `ℤ` otherwise), and when `α`, `β` are unramified `Π` is that representation (both are spherical
  with the parameter of 3.21a(iii)); the *irreducibility* bullet concerns `ν` ramified or `ν(ϖ) ≠ 1` only, and for
  `ν(ϖ) = 1` the lower strata can contribute to `Θ`.

### 3.47a Local matching at unramified inert places

*Origin:* adapted from Howe (1979), the spherical vectors of the oscillator representation, Rallis (1982), the unramified parameters of theta lifts, and Kudla and Sweet (1997), the theta quotients of the trivial representations of complementary spaces: the two theta quotients of a complementary datum at an unramified inert place are generated by their lattice vectors and share their unramified constituent.

*Method of the formal proof:* on each side the evaluation at `0` along a Lagrangian adapted to `M`, averaged over `K′`, gives an invariant functional `ℓ`, resp. `ℓ′`; for the lattice vectors `φ₀` of `L ⊗ M` and `φ′₀` of `L′ ⊗ M` the two functions `h ↦ ℓ(ω(1, h)φ₀)` and `h ↦ ℓ′(ω′(1, h)φ′₀)` on `U(W)` are equal, since they are `K′`-averages of functions whose laws under the Siegel parabolic subgroup multiply to its modulus and every `h` satisfies `h⁻¹ ∈ K′hK′`; `Π` is the span of the translates of this function, onto which both Weil representations map because each is generated by its lattice vector modulo coinvariant relations. The route written here compares instead the Satake parameters of the two spherical quotients, computed on each side by 3.21a(iii).

Prove local matching at unramified inert places: in a local complementary datum (3.47) with `N = a + a′` even, `E/F` unramified quadratic,
residue field of odd characteristic, `ψ`, `α`, `β` unramified, and `V`, `V′`,
`W` containing self-dual lattices `L`, `L′`, `M` (for the forms of `V`, `V′` and the skew-Hermitian form of `W`; no
compatibility of `M` with `L ⊕ L′` under the isometry `δ⁻¹W ≅ V ⊕ V′(−1)` is required), `Θ` and `Θ′` are nonzero, local
matching data exist, `Π` is the unramified constituent common to `Θ` and `Θ′`, `Θ` and `Θ′` are generated by the images of
the lattice vectors of `L ⊗ M` and `L′ ⊗ M`, which are nonzero and span their `K′`-fixed lines (`K′ = Stab(M)`), and these
vectors correspond.

*Route.* *Nonvanishing.* `W` is split (`N` even, Check), and `M = (M ∩ Y) ⊕ (M ∩ Y^*)` for a polarisation `W = Y ⊕ Y^*` (a
unimodular lattice of a split space over the unramified `E` has a hyperbolic basis). In the Schrödinger model of
`(V ⊗ Y) ⊕ (V ⊗ Y^*)` the group `U(V)` preserves both Lagrangians, so it acts by a character `μ` of `U(V)` times substitution
(Stone–von Neumann, MetaplecticAutomorphicForms §1.1; `|det| = 1` on `U(V)`), and the lattice vector of `L ⊗ M` is the indicator of `L ⊗ (M ∩ Y^*)`, fixed
by `K = Stab(L)` (MetaplecticAutomorphicForms §2.6a); so `μ` is trivial on `K`, and on the diagonal elements `diag(ϖ^m, ϖ^{−m})` of the hyperbolic planes of
`V`, which lie in their special unitary groups `≅ SL_2(F)`, a perfect group; by the Cartan decomposition `μ = 1`. Hence
`φ ↦ φ(0)` is a nonzero `U(V)`-invariant functional, nonzero on the lattice vector, and `Θ ≠ 0`; the same for `Θ′` with
`L′`. The two sides are computed separately, `Θ` with `L ⊗ M` and `Θ′` with `L′ ⊗ M`. The `K′`-fixed vectors of
each coinvariant module are spanned by the images of the translates of the lattice vector under the spherical Hecke
algebra (3.21a(i)), on which the Hecke algebra of `U(V)` (resp. `U(V′)`) acts through its trivial character; so they
form a line, nonzero by the nonvanishing just shown, which generates (second clause of 3.21a(i)), and as in 3.47 each
module has a unique maximal proper submodule with a spherical quotient. The evaluation functional along the Lagrangian of a Siegel-type parabolic
transforms by `β(det)|det|^{a/2}`, resp. `α(det)|det|^{a′/2}`, and a relative-index computation of the moduli of the two
parabolics shows that the two spherical quotients have the same Satake parameter, which 3.21a(iii) computes on
each side: `(α(ϖ)q^{(a−1)/2 − i})_{i<a} ∪ (β(ϖ)q^{(a′−1)/2 − j})_{j<a′}` in base-change coordinates, for both (`q`
the residue cardinality of `E`, as in 3.21a(iii)).

(Howe 1979; Rallis 1982, there for orthogonal–symplectic pairs; Kudla–Sweet 1997, for the theta quotients of the trivial
representations of complementary spaces.)
The statement follows from the formal proof,
`Development/WeilBound/CoreStatements/CompactAveragingSplitting/EigenvectorLifting/FinSplit.lean`
(`PositivityTheory.ThK.FinInert`), `Development/WeilBound/ThetaLifts/SphericalLattices/FunDefs.lean`
(`PositivityTheory.Sph.SiegSt`).
*Needs:* 3.21a; MetaplecticAutomorphicForms §§1.1, 2.6a; SmoothRepresentationsOfLocalGroups §SR.4.4.

**Checks.**

- No condition on `δ` is needed for `M` to exist when `N` is even: the Hermitian space `δ⁻¹W ≅ V ⊕ V′(−1)` has a
  unimodular lattice, so its determinant is a norm class and, `N` being even, it is split; a split Hermitian space
  over the unramified `E` contains `ϖ^k`-modular lattices for every `k`, and `M` is unimodular for `⟨·,·⟩_W = δ·(δ⁻¹⟨·,·⟩_W)`
  exactly when it is `ϖ^{−val(δ)}`-modular for `δ⁻¹⟨·,·⟩_W`. When `δ` is a unit, `M` may be taken to be the image of
  `L ⊕ L′`.
- Nonvanishing is not formal: generation by the image of the lattice vector and the Hecke relations bound the
  `K′`-fixed line of `Θ` by one dimension, and the image could be `0`; 3.9a(ii) gives `Θ′ ≠ 0` (`W` contains an isotropic
  subspace of dimension `N/2 ≥ a′`) but not `Θ ≠ 0` (`a > N/2`), which the evaluation at `0` provides.

### 3.47b Local matching at real places

*Origin:* adapted from Li (1990) and Paul and Trapa (2002): the identification of the two theta lifts with one module `A_𝔮(λ)`, stated here as a common irreducible quotient of the two theta quotients of a complementary datum, in the displayed range; particular to this proof: the Casimir gap lemma (o). The spectrum (i), beyond its last sentence, is this roadmap's own formulation.

*Method of the formal proof:* each theta quotient is generated by the image of the `K_W`-type `La` of joint harmonics, and every `K_W`-type of `𝔭·La` has Casimir value larger than that of `La` by more than `N`, both obtained in the polynomial Fock model from the multiplicity one of joint harmonic highest weight vectors, a count of degrees and the weights one noncompact root away from `La`; by the lemma (o) a module generated by such a type has a unique maximal proper submodule, and (o), applied to the submodule of the product of the two quotients generated by the diagonal highest weight vector, gives the common irreducible quotient. The published identification of the two lifts with `A_𝔮(λ)` (Li (1990); Paul and Trapa (2002)) uses Howe duality at the real place, the infinitesimal character through the Capelli identity and the characterisation of Vogan and Zuckerman, where the formal proof, in the displayed range, uses the Casimir gap of (o).

Prove local matching at real places. Let `F = ℝ`, `E = ℂ`, `δ` with `δ⁻¹ ∈ iℝ_{>0}`, the form `B = Tr_{ℂ/ℝ}(⟨·,·⟩_V⟨·,·⟩_W)`
and `ψ(x) = e^{2πix}`, and let a local complementary datum (3.47) have signatures `(P, Q)` for `V` and `(P′, Q′)` for
`V′`, with positive and negative parts `V = V₊ ⊕ V₋`, `V′ = V′₊ ⊕ V′₋`. Then `W^♭ = δ⁻¹W ≅ V ⊕ V′(−1)` has the positive
part `W₊ = V′₋ ⊕ V₊` and the negative part `W₋ = V′₊ ⊕ V₋`, of dimensions `P_W = P + Q′` and `Q_W = Q + P′`, and
`K_W = U(W₊) × U(W₋)`; write `e_1, …, e_{P_W}` and `f_1, …, f_{Q_W}` for the coordinates of its highest weights in bases
adapted to these decompositions, in the order written (first `V′₋`, then `V₊`; first `V′₊`, then `V₋`). Let `m_α`, `m_β`
be the infinity types and `κ = m_α − m_β` (so `κ ≡ a + a′ (mod 2)`), and assume that `a + a′` is even,

`−κ > a + a′`  and  `2(Q + P′) + 1 < min((a − a′)/2, a′)`

(so `V` is positive up to a small negative part, `V′` negative up to a small positive part, and `a′ ≥ 2`).

Put `L₊ = (−κ − (P_W − Q_W))/2` and `L₋ = (−κ + (P_W − Q_W))/2`, positive integers (`κ ≡ a + a′ ≡ P_W − Q_W (mod 2)`, and
`|P_W − Q_W| = |(P − Q) − (P′ − Q′)| < −κ`), and let `La` be the `K_W`-type of highest weight

`(0^{Q′}, (−L₊)^P) + ((Q − P + m_β)/2)·(1, …, 1)` on `U(P_W)`,  `(0^{P′}, (−L₋)^Q) + ((P − Q + m_β)/2)·(1, …, 1)` on `U(Q_W)`;

equivalently `(L₊^{Q′}, 0^P) + ((Q′ − P′ + m_α)/2)·(1, …, 1)` and `(L₋^{P′}, 0^Q) + ((P′ − Q′ + m_α)/2)·(1, …, 1)`. Here `Θ`
and `Θ′` are the theta quotients of 3.47, the coinvariants of the polynomial Fock spaces of `ω` and `ω′` under
`(𝔲(V), K_V)` and `(𝔲(V′), K_{V′})`, as `(𝔲(W), K_W)`-modules through `ω` and `ω′`.

- (i) *Spectrum.* `Θ` and `Θ′` are `K_W`-multiplicity free, with the same `K_W`-types: the types of highest weight
  `La + Σ_i c_i(f_i − e_{P_W+1−i}) + Σ_j b_j(e_j − f_{Q_W+1−j})` for partitions `c` with `ℓ(c) ≤ min(P, P′)` and `b` with
  `ℓ(b) ≤ min(Q, Q′)`. In particular `La` occurs once in each, and it generates `Θ` (resp. `Θ′`).
- (ii) *Unique quotients.* Each of `Θ`, `Θ′` has a unique irreducible quotient, in which `La` occurs once. (The first
  assertion is the archimedean Howe duality of MetaplecticAutomorphicForms §3.7 for the trivial representations of `U(V)`
  and `U(V′)`; the route below proves it directly, with the type `La`.)
- (iii) *Infinitesimal character.* `Θ` and `Θ′` have the infinitesimal character with Harish-Chandra parameter
  `{m_α/2 + (a − 1)/2 − i}_{0 ≤ i < a} ∪ {m_β/2 + (a′ − 1)/2 − j}_{0 ≤ j < a′}`.
- (iv) *Matching.* The two irreducible quotients are isomorphic: with `Π` their common class and `p`, `p′` the quotient
  maps, `(Π, p, p′)` is local matching data.
- (v) *Identification.* Let `𝔮 = 𝔩 ⊕ 𝔲` be the `θ`-stable parabolic subalgebra of
  `𝔲(W)_ℂ` with Levi subgroup `L = U(V) × U(V′)` (through `W ≅ V ⊕ V′`) and `𝔲 = Hom(V, V′)`, and `λ` the character
  `det_V^{(m_α + a′)/2} ⊗ det_{V′}^{(m_β − a)/2}` of `L`, admissible since `κ ≤ −(a + a′)`. Then `Π` is isomorphic to the
  module `A_𝔮(λ)` of AutomorphicFormsOnReductiveGroups §5.4.

*Remark.* The statement is made in the range displayed. The route below uses the hypothesis only in the form
`−κ > |P − Q| + |P′ − Q′|` and does not use the parity of `a + a′`; the statement in that wider range is not claimed here.

*Status.* In the displayed range the formal proof gives an irreducible common quotient of `Θ` and `Θ′` with scalar
endomorphisms (FormalProof, `Development/WeilBound/CoreStatements/GaussianSeminormBounds/RealSeminormFiltration/KRealAsmOne.lean`
(`PositivityTheory.KRealA.onePlace`)), that is (iv) and the existence part of (ii); (i) beyond its last sentence (`La` occurs once and
generates), (iii) and (v) are this roadmap's own and are not on the path of the formal proof.

The hypothesis is used as follows: `L_± > 0` (for (i)) is `−κ > |(P − Q) − (P′ − Q′)|`, and the Casimir gap below (for (ii)
and (iv)) is `−κ > |(P − Q) + (P′ − Q′)|`; together they are the condition `−κ > |P − Q| + |P′ − Q′|` of the Remark, which
the displayed hypothesis implies (`|P − Q| ≤ a`, `|P′ − Q′| ≤ a′`).

The route of (ii) and (iv) is the following lemma, stated for any pair `𝔤 = 𝔨 ⊕ 𝔭` of complex Lie algebras with
`[𝔭, 𝔭] ⊂ 𝔨`, `𝔨` the complexification of a compact Lie algebra acting on `𝔭` unitarily for a positive Hermitian form,
and `Ω = Σ_k e_k e_k^* ∈ U(𝔨)` a Casimir element (for a basis `(e_k)` of `𝔨` and the adjoint of the compact form) acting on
`𝔭` by a scalar `d`:

- (o) *Casimir gap.* Let `M` be a `𝔤`-module generated by a finite-dimensional
  `𝔨`-submodule `V`, unitary for the compact form, on which `Ω` acts by `c₀`, and suppose that `Ω` has no eigenvalue
  `≤ c₀ + d` on `𝔭·V`. Then the generalised `c₀`-eigenspace of `Ω` in `M` is `V`. If `V` is irreducible, `M` has a unique
  maximal proper submodule; and two such modules `M`, `M′` with `𝔨`-isomorphic `V`, `V′` have isomorphic irreducible
  quotients.

*The form of the formal proof.* The formal proof states the first assertion of (o), in the form that an element of `M`
whose image under `Ω − c₀` lies in `V` lies in `V`, for operators with the commutation relations of `𝔨` and `𝔭` stated
here (FormalProof,
`Development/WeilBound/CoreStatements/GaussianSeminormBounds/RealSeminormFiltration/CoreCas.lean`
(`PositivityTheory.KReal.cas_bound`)), and the unique maximal proper submodule and the common irreducible quotient for
`𝔤𝔩_N(ℂ)` with its block-diagonal subalgebra and modules generated by a highest weight vector of the `𝔨`-type
(`Development/WeilBound/CoreStatements/GaussianSeminormBounds/RealSeminormFiltration/CoreMain.lean`
(`PositivityTheory.KReal.local_of`, `PositivityTheory.KReal.common_quot`)); it deduces (iv) from them.

*Route.* (i) *Seesaw.* `V ⊗ W = (V ⊗ W₊) ⊕ (V ⊗ W₋)`, a symplectically orthogonal sum on which the positive complex
structure of the pair restricts to those of the compact pairs `(U(W₊), U(V))` and `(U(W₋), U(V))`; so the polynomial
Fock space of `(V, W)` is the tensor product of theirs, with `U(V)` acting diagonally. By 3.46(i)–(ii) each factor is
`⊕_σ σ ⊗ L_±(σ)`, with `L_±(σ)` irreducible unitary `(𝔲(V), K_V)`-modules; by 3.45(ii) the polynomials of the two factors
are `Sym((V₊ ⊗ W₊)^∨) ⊗ Sym(V₋ ⊗ W₊)` and `Sym(V₊ ⊗ W₋) ⊗ Sym((V₋ ⊗ W₋)^∨)`, so the `K_V`-types of `L₊(σ)` are its lowest
type plus weights of `Sym(V₊^∨ ⊗ V₋)` and those of `L₋(σ)^∨` likewise: `L₊(σ₊)` and `L₋(σ₋)^∨` are unitary lowest weight
modules for the same `𝔭^+`, each determined by its lowest `K_V`-type. By the Kashiwara–Vergne parametrisation (3.46(ii),
with the twists of 3.45(ii)), `σ₊` of highest weight `(B, 0, −A^{rev}) + (Q − P)/2` (partitions, `ℓ(A) ≤ P`, `ℓ(B) ≤ Q`,
`ℓ(A) + ℓ(B) ≤ P_W`) has lowest `K_V`-type `((−A)^{rev} − P_W/2) ⊗ (B + P_W/2)` on `U(V₊) × U(V₋)`, and `σ₋` of highest weight
`(C, 0, −D^{rev}) + (P − Q)/2` (`ℓ(C) ≤ P`, `ℓ(D) ≤ Q`, `ℓ(C) + ℓ(D) ≤ Q_W`) has `(C + Q_W/2) ⊗ ((−D)^{rev} − Q_W/2)`. The splitting
characters make `U(V)` act through `det^{−κ/2}` (`χ_W = β/α`) and `U(W)` through `det^{m_β/2}` (`χ_V = β`). Hence the
`σ₊ ⊗ σ₋`-isotypic part of `Θ` is `σ₊ ⊗ σ₋ ⊗ (L₊(σ₊) ⊗ L₋(σ₋) ⊗ det^{−κ/2})_{𝔲(V), K_V}`, whose dual is
`Hom_{(𝔲(V), K_V)}(L₊(σ₊), L₋(σ₋)^∨ ⊗ det^{κ/2})`: of dimension `0` or `1`, and `1` exactly when the lowest types agree, that
is `A = C + L₊·(1^P)` and `D = B + L₋·(1^Q)`. Since `L_± > 0`, this forces `ℓ(A) = P` and `ℓ(D) = Q`, hence `ℓ(B) ≤ min(Q, Q′)`
and `ℓ(C) ≤ min(P, P′)`, and the highest weights become those listed (`c = C`, `b = B`); `C = B = 0` gives `La`, the type
of the vacuum times `Δ₊^{L₊}Δ₋^{L₋}`, with `Δ₊` the determinant of the `V₊ × V₊`-block of the coordinates of `V₊ ⊗ W₊`
and `Δ₋` that of the `V₋ × V₋`-block of the coordinates of `V₋ ⊗ W₋`. The same computation for `(V′, W)` (`U(V′)` through
`det^{κ/2}`, `U(W)` through `det^{m_α/2}`) gives `C′ = A′ + L₋·(1^{P′})`, `B′ = D′ + L₊·(1^{Q′})` and the same set of types
(`c = A′`, `b = D′`). *Generation.* The Fock space is generated over `U(𝔲(W))` by the `K_V`-harmonics
`ℋ(U(V₊)) ⊗ ℋ(U(V₋))` (Howe: from the generation for the compact pairs `(U(V_±), U(W))` of 3.46(i), by induction on the
degree in the second factor, since an element of `𝔲(W)_ℂ` raises the degree in one factor and lowers it in the other).
`K_V`-coinvariants are `K_V`-invariants, and the `K_V`-type that is trivial in `ω` occurs among these harmonics only once,
paired with `La` (Kashiwara–Vergne for `(U(V₊), U(W))`: the character `det^{−L₊}` of `U(V₊)` pairs only with `Δ₊^{L₊}`;
likewise for `V₋`). So `Θ` is generated by the image of `La`, which is nonzero because `La` occurs in `Θ`.
(o) Filter `M` by the spans `F_n` of the words of length `≤ n` in elements of `𝔭` applied to `V`; they are finite-dimensional
and `𝔨`-stable, and permuting the letters of a word changes it by an element of `F_{n−1}` (`[𝔭, 𝔭] ⊂ 𝔨`). The surjection
`m_n : V ⊗ 𝔭^{⊗n} → F_n/F_{n−1}` is `𝔨`-equivariant, so `Ω ∘ m_n = m_n ∘ Ω_n`, where `Ω_n` is the Casimir of the unitary
`𝔨`-module `V ⊗ 𝔭^{⊗n}`. Expanding `Σ_k (R_k + A_k)(R_k + A_k)^*` (`R_k` on `V`, `A_k = Σ_s A_k^{(s)}` on the `n` slots) gives
`Ω_n = Ω_V + Σ_{s=1}^{n} (Ω_{V ⊗ 𝔭_s} − Ω_V − d) + Ω_{𝔭^{⊗n}}`, with `Ω_{V ⊗ 𝔭_s}` the Casimir of `V` tensor the `s`-th slot;
the cross terms between two slots, which can be negative, are not estimated separately but are part of
`Ω_{𝔭^{⊗n}} = Σ_k A_kA_k^* ≥ 0`. Let `φ` be a linear form on `F_n/F_{n−1}` vanishing on `(Ω − c₀)(F_n/F_{n−1})`, and
`Ψ ∈ V ⊗ 𝔭^{⊗n}` the vector representing `φ ∘ m_n`; then `(Ω_n − c₀)Ψ = 0`. Since letters commute modulo `F_{n−1}`, each
restriction of `Ψ` to one slot (the other slots fixed) is orthogonal to the kernel of `m₁ : V ⊗ 𝔭 → 𝔭·V`, so lies in a
`𝔨`-module isomorphic to `𝔭·V`, where `Ω_{V ⊗ 𝔭} − c₀ − d > 0` by the gap. Hence
`0 = ⟨(Ω_n − c₀)Ψ, Ψ⟩ = Σ_s ⟨(Ω_{V ⊗ 𝔭_s} − c₀ − d)Ψ, Ψ⟩ + ⟨Ω_{𝔭^{⊗n}}Ψ, Ψ⟩` forces `Ψ = 0`. So `Ω − c₀` is invertible on
every `F_n/F_{n−1}`, `n ≥ 1`, and the generalised `c₀`-eigenspace is `F_0 = V`. A submodule `S` is the sum of its
generalised eigenspaces (`Ω` is locally finite); if `S ∩ V ≠ 0` then `S ⊃ V` and `S = M`; so the proper submodules lie
in the sum of the generalised eigenspaces for eigenvalues `≠ c₀`, and so does their sum. For two modules, apply this to
the submodule of `M ⊕ M′` generated by the graph of the isomorphism `V ≅ V′`, which maps onto `M` and onto `M′`.
(ii) and (iv): apply (o) to `𝔤 = 𝔲(W)_ℂ`, `𝔨 = Lie(K_W)_ℂ`, `Ω = Σ_{a,b}E_{ab}E_{ba}` over the two blocks (eigenvalue
`Σ_i μ_i(μ_i + n + 1 − 2i)` on the type of highest weight `μ` of `U(n)`, and `d = P_W + Q_W = N` on `𝔭`), `V` the `La`-part. By
(i), `𝔭·La` lies in the types of `Θ` (resp. `Θ′`) that occur in `La ⊗ 𝔭`, namely `La + β₁`, `β₁ = f_1 − e_{P_W}` (if
`min(P, P′) ≥ 1`), and `La + β₂`, `β₂ = e_1 − f_{Q_W}` (if `min(Q, Q′) ≥ 1`). From the coordinates of `La`,
`Ω(La + β₁) − Ω(La) = N + (−κ + P + P′ − Q − Q′)` and `Ω(La + β₂) − Ω(La) = N + (−κ + Q + Q′ − P − P′)`, both `> N` since
`−κ > |(P − Q) + (P′ − Q′)|`. So (o) gives (ii) for `Θ` and `Θ′`, and (iv) for the pair, the `La`-parts being isomorphic
by (i).
(iii) *Capelli.* For `z ∈ Z(𝔤𝔩_N)` (centre of the enveloping algebra of `𝔲(W)_ℂ`) the image `ω(z)` in the Weyl algebra
of `(V ⊗ W)_ℂ` equals `ω(z′)` for some `z′ ∈ Z(𝔤𝔩_a)`, with Harish-Chandra parameters related by
`y = (x + (m_{χ_V} − m_{χ_W})/2) ∪ (m_{χ_V}/2 + ((N − a − 1)/2, …, −(N − a − 1)/2))`. This is an identity in the Weyl
algebra, which acts faithfully on every Fock model and is the same for every real form; it is read off the compact
forms of 3.46(iii), where `U(a)` and `U(N)` act on the summand of `μ` with parameters `x`, `y` related in this way, for
both signs `ε` (the Harish-Chandra isomorphism of LieHighestWeight §9.2, with infinitesimal characters as in
AutomorphicFormsOnReductiveGroups §2.2, turns the equality of the scalars on every summand into the equality of the
elements). On `Θ` the centre of `𝔲(V)` acts through the trivial
character, `x = ((a − 1)/2, …, −(a − 1)/2)`; with `m_{χ_V} = m_β`, `m_{χ_W} = −κ` this is the stated parameter, and for `Θ′`
(`m_{χ_V} = m_α`, `m_{χ_W} = κ`, `a` and `a′` exchanged) the same set.
(v) *Vogan–Zuckerman.* `Δ(𝔲 ∩ 𝔭)` consists of the weights of `Hom(V₊, V′₊)` and `Hom(V₋, V′₋)`, `f_j − e_i` (`f_j` a
`V′₊`-coordinate, `e_i` a `V₊`-coordinate) and `e_j − f_i` (`e_j` a `V′₋`-coordinate, `f_i` a `V₋`-coordinate); in the
coordinates above `2ρ(𝔲 ∩ 𝔭) = (Q^{Q′}, (−P′)^P; P^{P′}, (−Q′)^Q)`, so `λ + 2ρ(𝔲 ∩ 𝔭) = La`, and `λ + ρ` is the parameter of
(iii). `λ` is admissible: on the roots `α` of `𝔲`, `⟨α, λ⟩ = (m_β − a)/2 − (m_α + a′)/2 = −(κ + a + a′)/2 ≥ 0`. The
`K_W`-types of (i) are `La` plus nonnegative integral combinations of roots of `𝔲 ∩ 𝔭` (`f_i − e_{P_W+1−i}` and
`e_j − f_{Q_W+1−j}` are such roots), and every one other than `La` has larger norm of `μ + 2ρ_c`, because
`⟨La + 2ρ_c, α⟩ ≥ ⟨2ρ(𝔲) + 2ρ(𝔩 ∩ 𝔨), α⟩ ≥ (a + a′) − (a − 1) − (a′ − 1) > 0` for the roots `α` of `𝔲`. So each irreducible
quotient has lowest `K_W`-type `λ + 2ρ(𝔲 ∩ 𝔭)`, infinitesimal character `λ + ρ` and compact weights in
`λ + 2ρ(𝔲 ∩ 𝔭) + ℕ·Δ(𝔲 ∩ 𝔭)`, and the characterisation of AutomorphicFormsOnReductiveGroups §5.4 identifies it with
`A_𝔮(λ)`. (This gives (iv) a second time.)

(M. Kashiwara, M. Vergne, Invent. Math. 44 (1978), for the parametrisation in (i); R. Howe, *Transcending classical
invariant theory*, J. Amer. Math. Soc. 2 (1989), and *Remarks on classical invariant theory*, Trans. Amer. Math. Soc.
313 (1989), for generation and the Capelli identity; D. Vogan, G. Zuckerman, *Unitary representations with nonzero
cohomology*, Compositio Math. 53 (1984), Theorem 2.5 and Proposition 6.1, pp. 58 and 78, through
AutomorphicFormsOnReductiveGroups §5.4; (o) is elementary.) *Needs:* 3.45, 3.46; MetaplecticAutomorphicForms §§3.3, 3.7;
TensorInductionAndFiniteGroupInputs §7.1; AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 5.4; LieHighestWeight §9.2.

**Checks.**

- `p = q = 0` (`V` positive, `V′` negative): `P_W = N`, `Q_W = 0`, `U(W)` is compact, `min(P, P′) = min(Q, Q′) = 0`, and (i)
  leaves the single type `La`, of highest weight `(0^{a′}, (−L₊)^a) − ((a − m_β)/2)·(1, …, 1)` with `L₊ = (−κ − N)/2`: this
  is the type `ι_{−1}((μ, 0^{a′}) + b)` of 3.46(iii) for the definite pair `(V, W)` (`ε = −1`, `a = (N + κ)/2 ≤ 0`,
  `μ = ((−κ − N)/2)^a`, `b = (a − m_β)/2`). `Θ`, `Θ′` are irreducible and (iv) holds by (i) alone.
- The two readings of `La` agree: on `U(P_W)` their difference is `L₊ + (Q′ − P′ − Q + P + κ)/2 = 0`, since
  `P_W − Q_W = P + Q′ − Q − P′`; on `U(Q_W)` it is `L₋ + (P′ − Q′ − P + Q + κ)/2 = 0`.
- A numerical case of the formulas for `La`, `λ` and the Casimir values, in the range of the Remark and outside the
  displayed range: `a = 3`, `a′ = 1`, `(P, Q) = (2, 1)`, `(P′, Q′) = (1, 0)`, `m_β = 1`, `m_α = −5` (`κ = −6`, so
  `−κ > a + a′ = 4` and `−κ > |P − Q| + |P′ − Q′| = 2`, but `2(Q + P′) + 1 = 5 > 1 = min((a − a′)/2, a′)`; the displayed
  range with `Q + P′ ≥ 1`, which `β₁` or `β₂` needs in order to occur, requires `a′ ≥ 4` and `a − a′ ≥ 8`): `P_W = Q_W = 2`,
  `L₊ = L₋ = 3`, `La = (−3, −3) ⊗ (1, −2)`; `λ = det_V^{−2} ⊗ det_{V′}^{−1}`, `λ + 2ρ(𝔲 ∩ 𝔭) = (−2 − 1, −2 − 1; −1 + 2, −2 − 0) = La`,
  and `λ + ρ = (½, −3/2, −5/2, −7/2)`, which is `{m_α/2 + 1 − i} ∪ {m_β/2}`. The gap of (o): only `β₁` occurs
  (`min(Q, Q′) = 0`), `La + β₁ = (−3, −4) ⊗ (2, −2)`, and `Ω` takes the values `18 + 8 = 26` on `La` and `26 + 12 = 38` on
  `La + β₁` (`Ω = μ₁(μ₁ + 1) + μ₂(μ₂ − 1)` on `U(2)`): the difference `12 = N + (−κ + P + P′ − Q − Q′)` exceeds `N = 4`.
- *The general range* (Remark). In the same signatures `|P − Q| + |P′ − Q′| = 2 < N = 4`, so the route also covers
  `κ = −4`, which `−κ > a + a′` excludes as well (for (v), `κ ≤ −(a + a′)` holds there). For `m_β = 1`, `m_α = −3`: `L₊ = L₋ = 2`,
  `La = (−2, −2) ⊗ (1, −1)`, `Ω(La) = 8 + 4 = 12`, `La + β₁ = (−2, −3) ⊗ (2, −1)`, `Ω(La + β₁) = 14 + 8 = 22`, and the
  difference `10 = N + (−κ + P + P′ − Q − Q′)` exceeds `4`. For signatures `(a − p, p)` of `V` and `(q, a′ − q)` of `V′`
  with `2p ≤ a`, `2q ≤ a′`, the bound is `|P − Q| + |P′ − Q′| = N − 2(p + q)`, which does not change when a hyperbolic plane
  is removed from `V` or `V′` and from `W`.
- The sign of `κ` matters: for `κ > a + a′` the determinant powers that make `K_V` act trivially would have to come from
  the blocks `V₊ ⊗ W₋` and `V₋ ⊗ W₊`; for `p = q = 0` there is no such block (`W₋ = 0`), `Θ = 0`, and this is the
  vanishing of the trivial type of 3.46(iii) for `(V, W)` when `−m_{χ_W} = κ > N`.

### 3.47c Three local lemmas at a split place

*Origin:* adapted from Tate (1950) and Godement and Jacquet (1972), equivariant distributions on matrix spaces, and from the theory of degenerate Whittaker models: three special cases at a split place, with direct proofs.

*Method of the formal proof:* lemma 1 by induction on the size of the matrices, splitting off the first row and column on the set where the corner entry is nonzero, with the left law for `n = N` obtained first for symmetric matrices, which generate `GL_N(F)`; lemma 2 by showing in turn that the functional kills the functions supported where two of the columns are independent, where the first is nonzero, and everywhere; lemma 3 by solving the two difference relations that the laws impose on the values at indicators of boxes.

Prove the following three lemmas. Let `F` be nonarchimedean, `E = F × F`, `q` the residue cardinality, and work in the type-II models
`S(M_{n×N}(F))`.

1. *Uniqueness of the zeta distribution.* Let `ξ` be an unramified
   quasi-character of `F^×` with `ξ(ϖ)` not a positive real number, and `l` a linear functional
   on `S(M_{n×N}(F))` with `l(φ(· h)) = ξ(det h) l(φ)` for `h ∈ GL_N(F)`. If `n < N` then `l = 0`;
   if `n = N` then also `l(φ(g ·)) = ξ(det g) l(φ)` for `g ∈ GL_N(F)`.
2. *No degenerate Whittaker functional of type `(3, 1, …, 1)`.*
   Let `l` be a linear functional on `S(M_{n×N}(F))` transforming on the left under `GL_n(F)` by an
   unramified character of the determinant, and for three distinct column indices `i₀, i₁, i₂`:
   adding `ρ_i` times column `i₀` to column `i` for all `i ≠ i₀` multiplies `l` by `ψ(ρ_{i₁})`, and
   adding `ρ_i` times column `i₁` to column `i` for all `i ∉ {i₀, i₁}` multiplies `l` by `ψ(ρ_{i₂})`.
   Then `l = 0`. Equivalently, the theta quotient of the trivial representation of `GL_n` in `GL_N`
   carries no functional that is generic on a `GL₃`-block of a Levi subgroup and trivial on the
   corresponding unipotent radical.
3. *Growth of `GL₂`-block Whittaker functionals.* Let `l` have left
   law `ξ ∘ det` (`ξ` unramified) and the first column law of 2, with `ψ` of conductor exponent `c`,
   and put `r = ξ(ϖ) q^{n−N}`. Then there is `x ∈ ℂ` with
   `l(1_{M_{n×N}(O)}(Y · diag_{i₀,i₁}(ϖ^j, ϖ^{−j}))) = x · (q r)^{−j} · Σ_{i=0}^{2j−c} r^i` for every
   integer `j ≥ 0`, the sum being empty, and the value `0`, when `2j < c`, where `diag_{i₀,i₁}(ϖ^j, ϖ^{−j})` acts on
   the columns `i₀`, `i₁`.

*Route.* 1, the orbits of `GL_N` on `n × N` matrices of rank `< N` carry no `ξ ∘ det`-equivariant
distribution unless `ξ` is a real power of `|·|`, and on the open orbit (`n = N`) the equivariant
distribution is `ξ⁻¹(det z) d^×z`, unique and equivariant on both sides. 2, by the first column law
and the left law `l` is supported where column `i₁` is a multiple `λ` of column `i₀ ≠ 0` (on the
locus where they are independent a unipotent of the mirabolic subgroup of column `i₀` realises the
column operation up to a nontrivial factor of `ψ`); likewise column `i₂ = μ` times column `i₁`; the
first column law with `ρ` supported in position `i₂` must then act trivially but shifts `μ` by
`ρ_{i₂}/λ`, on which `l` is equivariant by `ψ`: a contradiction. 3, decompose by the valuation `e` of column
`i₀`, `−j ≤ e ≤ j − c`; the `e`-th term is a constant times the `e`-th power of one number. No publication is cited
for these lemmas: the route above is their proof.
Lemma 1 follows from the formal proof, `Development/WeilBound/ThetaLifts/LatticeBasics/PairsStable.lean`
(`GlobalTheory.ThK.Dbl.LocDist`), and lemma 2 from the formal proof,
`Development/WeilBound/ThetaLifts/EigenvalueEndgame/CuspidalAverages/KeyThree.lean`
(`PositivityTheory.ThKEnd.Cusp.LocThree`).

*Needs:* MetaplecticAutomorphicForms §§3.2a, 3.14; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.2.

**Checks.**

- In 1 the hypothesis on `ξ(ϖ)` is needed: for `ξ = 1` the evaluation `φ ↦ φ(0)` is a nonzero right
  invariant functional for every `n < N`.
- In 3 with `|r| > 1` the right side has absolute value of order `(|r|/q)^j`. For the two theta quotients of
  a complementary datum the parameters are `r_V = ν(ϖ) q^{ε₀}` and `r_{V′} = r_V⁻¹` (the left laws include the
  modulus characters of the Weil action), and the two sequences agree up to the factor `r_V^c`;
  `|r_V|/q = q^{ε₀ − 1}`, so the sequence is unbounded exactly when `ε₀ > 1` (for instance at `ε₀ = 3/2`, `a − a′ = 3`;
  `ε₀ ≥ 2` when `a ≡ a′ (mod 2)`) and stays bounded for `ε₀ ≤ 1`.

### Examples

For `n = 0` the Weil representation is the character `χ̃_V ∘ det` of `U(W)` (at a split place `χ_{V,w} ∘ det` on `GL_d(F)`), and the unramified correspondence gives the segment `χ_V(ϖ)(q^{(d−1)/2}, …, q^{−(d−1)/2})` alone, the parameter of that character (3.21a). For `N = 1`, `W = ℝe ⊕ ℝf` with `ω(e, f) = 1` and `X = ℝe`, the vacuum is `2^{1/4}e^{−πu²}`, the positive complex structure is `Je = f`, the Bargmann kernel is `2^{1/4}e^{2πuz − πu² − πz²/2}`, and `exp(θJ)` acts on the Hermite function of degree `k` by `e^{−i(k + 1/2)θ}` (3.45). For `n = d = 1` with `V` and `W^♭` positive, `U(1) × U(1)` acts on `z^k` by `t^{−k−a}s^{−k−b}`, `a = (1 − m_W)/2`, `b = (1 − m_V)/2` (3.46). For `a = 3`, `a′ = 1`, `(P, Q) = (2, 1)`, `(P′, Q′) = (1, 0)`, `m_β = 1`, `m_α = −5`, in the range of the Remark of 3.47b and outside its displayed range, the route gives the generating type `La = (−3, −3) ⊗ (1, −2)`, the Casimir takes the values `26` on `La` and `38` on `La + β₁`, and the infinitesimal character is `(½, −3/2, −5/2, −7/2)` (3.47b). For `U(1) × U(1, 1)` and `t = 1` the Fock module is `ℂ[z₁, z₂]`; for `k ≥ 1` its part of `U(1)`-weight `k` is the irreducible lowest weight module generated by the joint harmonic `z₁^k/√(k!)` of type `Λ((k | 0))`, case (−) with `α = (k)`, and for `k ≤ −1` the harmonic is `z₂^{|k|}/√(|k|!)`, case (+) with `β = (k)`; the hypothesis of (c2) is needed, since for `λ = (1 | −1)` on `U(1, 1)` in case (+) the larger member is the trivial representation of `U(3)` and the Fock module of the lowered pair `U(0, 0) × U(3)` is the trivial line (3.46a). In the uniqueness of the zeta distribution the hypothesis on `ξ(ϖ)` is needed: for `ξ = 1` the evaluation `φ ↦ φ(0)` is a nonzero right invariant functional for every `n < N` (3.47c).

### Dependencies

MetaplecticAutomorphicForms §§0.1, 0.15, 0.17, 0.18, 1.1, 1.3, 1.5, 2.4c, 2.5, 2.5a, 2.6a, 3.2a, 3.3, 3.3b, 3.3d, 3.4, 3.6, 3.7, 3.7a, 3.9a, 3.12, 3.14, 3.18, 3.22a (Layers 0–3); SmoothRepresentationsOfLocalGroups §§SR.2.1, SR.2.2, SR.3.1, SR.4.1–SR.4.4, *segment-representations*; LocalFactorsOfTwistsAndTypes §4.1; TensorInductionAndFiniteGroupInputs §7.1; AutomorphicLFunctionsAndLocalFactors §§AL.1, AL.2; AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 2.4, 5.4; LieHighestWeight §9.2; RepresentationTheory/CompactGroups Layers 4–5; OrthogonalL2Bases Parts A, D.

## Layer 4: Global Weil representation of a unitary pair

The local splittings of MetaplecticAutomorphicForms §3.3, normalised on Siegel parabolic subgroups as in 3.3b, assemble into a global Weil representation of a unitary pair, characterised by five properties.

### 4.4a The global Weil representation of a unitary pair

*Origin:* published: Kudla (1994) and Harris, Kudla and Sweet (1996), the global Weil representation of a unitary pair assembled from the local splittings, with its normalisation on Siegel parabolic subgroups (Gan and Ichino (2014), §7.4); particular to this proof: its characterisation by the properties (1)–(5) (covariance under the Heisenberg operators, invariance of the theta functional under rational points, unitarity, the law at split places, continuity), for the extensions and the additive character of the paragraph *The form of the formal proof*; in the generality stated here the characterisation is this roadmap's own formulation.

*Method of the formal proof:* two representations with (1)–(5) differ by a continuous unitary character of `U(V)(𝔸) × U(W)(𝔸)` trivial on rational points and on the elements supported at split places, and such a character is trivial by an explicit approximation, through products of quasi-reflections and norm-one elements `x/x̄`, `x ∈ E^×`, close to `1` at given finite places (an approximation of which Rapinchuk and Tralle, arXiv:2503.00696, study a general form); existence comes from lattice models at the finite places and Gaussian vectors at the real places, the invariance under rational elements being checked on a generating family by a Gaussian integral and a product formula. The route written here builds the representation instead from the local splittings with the product formula for Weil indices, and ends the characterisation with strong approximation for `SU(W)` and the nonvanishing of `L(s, μ)` at `s = 1`.

Construct the global Weil representation of a unitary pair. Let `E/F` be a quadratic extension of number fields, `V` ε-Hermitian,
`W` (−ε)-Hermitian, and `χ_V`, `χ_W` unitary Hecke characters of `𝔸_E^×/E^×` with
`χ_V|_{𝔸_F^×} = η^{dim V}`, `χ_W|_{𝔸_F^×} = η^{dim W}`.

- The local splittings of MetaplecticAutomorphicForms §3.3 (and MetaplecticAutomorphicForms §3.2a at split places) are trivial on `U(V)(𝒪_v) × U(W)(𝒪_v)` for
  almost all `v`, where they fix the lattice vector of MetaplecticAutomorphicForms §2.6a.
- Their restricted product defines a continuous homomorphism
  `ι : U(V)(𝔸) × U(W)(𝔸) → Mp(V ⊗ W)(𝔸) ×_{μ₂} ℂ^1` over the inclusion into `Sp(𝔸)`, into the adelic scalar cover (the
  push-out of the double cover of MetaplecticAutomorphicForms §4.2 along `μ₂ ⊂ ℂ^1`, on which the representation of MetaplecticAutomorphicForms §4.5 extends with `ℂ^1` acting by
  scalars), and `ι` agrees with the rational splitting of MetaplecticAutomorphicForms §4.4, composed with the push-out map, on `U(V)(F) × U(W)(F)`. The
  local splittings of MetaplecticAutomorphicForms §3.3 are into scalar covers; into the double cover there is in general none: for two definite
  lines at a real place the image of `U(1) × U(1)` is the rotation group of `Sp_2(ℝ)`, whose inverse image in the double
  cover is connected (MetaplecticAutomorphicForms §2.4b, Check).
- Hence a global Weil representation `ω_{ψ, χ_V, χ_W}` of `U(V)(𝔸) × U(W)(𝔸)` on `S(X(𝔸))` for any
  rational polarisation, unitary and extending to a strongly continuous representation on `L²(X(𝔸))`, with theta
  functional invariant under `U(V)(F) × U(W)(F)`, compatible with
  change of polarisation and with the character changes of MetaplecticAutomorphicForms §3.3.
- *Normalisation on a Siegel parabolic.* At every place `v` where `W_v` is split, the local components act on the
  Schrödinger model of `(V ⊗ Y) ⊕ (V ⊗ Y^*)` by the formulas of 3.3b in its left-action form:
  `ω(m(A))φ(x) = χ_{V,v}(det A)⁻¹ |det A|_{E_v}^{n/2} φ(xA)`,
  `ω(n(B))φ(x) = ψ_v(tr(B T_x)) φ(x)`.
- *Split places.* At a place `v` split in `E`, in the type-II model of MetaplecticAutomorphicForms §§3.2a, 3.14, in every
  residue characteristic and for every conductor of `ψ_v`, the functional `φ ↦ φ(0)` satisfies
  `(ω_v(g, h)φ)(0) = r(g, h) · χ̃_W(det g) · χ̃_V(det h) · φ(0)` for `g ∈ U(V)(F_v)`, `h ∈ U(W)(F_v)`, with `r(g, h) > 0`
  (a product of powers of the absolute values of the two determinants) and `det` the determinant of the acting
  isometry (of `V`, resp. `W`; `χ̃` is defined at a split place, where `η_v = 1`). This is the known description of the
  split unitary Weil representation as the type-II model twisted by the splitting characters; it agrees with the
  previous bullet on the common Levi elements (for `h = m(A)`, `χ̃_V(det m(A)) = χ_V(det A)⁻¹`).
- *Characterisation.* Let `dim V, dim W ≥ 1`, and let `ω′` be a representation of
  `U(V)(𝔸) × U(W)(𝔸)` on `S(X(𝔸))` with: (1) `ω′(g, h) ρ(w) ω′(g, h)⁻¹ = ρ((g, h)w)` for the Heisenberg operators `ρ(w)`,
  `w ∈ 𝕎(𝔸)` (MetaplecticAutomorphicForms §1.3); (2) the theta functional `φ ↦ Σ_{ξ ∈ X(F)} φ(ξ)` is invariant under `U(V)(F) × U(W)(F)`; (3) `ω′` is
  unitary for the `L²` inner product of `S(X(𝔸)) ⊂ L²(X(𝔸))`; (4) at every place `v` split in `E`, the functional
  `φ ↦ φ(0)` of the type-II model at `v` transforms under `U(V)(F_v) × U(W)(F_v)` by a positive multiple of
  `χ̃_W(det g)χ̃_V(det h)`; (5) *continuity*: for every `φ ∈ S(X(𝔸))` and every `w ∈ 𝕎(𝔸)` the function
  `(g, h) ↦ Σ_{ξ ∈ X(F)} (ρ(w)ω′(g, h)φ)(ξ)` is continuous on `U(V)(𝔸) × U(W)(𝔸)` (the theta function of `ω′(g, h)φ`
  depends continuously on `(g, h)` at every point). Then `ω′ = ω_{ψ, χ_V, χ_W}`.

*The form of the formal proof.* The formal proof has the characterisation with (5) in this form, for the standard
additive character `ψ` in the normalisation with `e^{−2πix}` at the real places (Conventions) and for the CM extensions
of the complementary data of 3.47 (FormalProof,
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/WeilDatumUniqueOnThetaFunctions.lean` (`GlobalTheory.WeilUniq.weilDatum_unique`),
with (1)–(5) among the fields of `Formalism.IndefR.Datum.IsWeilDatumO` in
`Formalism/LocalToGlobal/IndefiniteReal/LocalNewformFunction.lean`); for every quadratic extension of number fields and
every `ψ` the characterisation is this roadmap's own, proved by the route below.
The formal proof states the existence, the normalisation on a Siegel parabolic and the split law in
`Development/WeilBound/ThetaLifts/Reductions/WeilPairs/WeilPairExistence/WeilEx.lean`
(`PositivityTheory.ThKW.S.exists_isWeil`), `Development/WeilBound/ThetaLifts/LatticeBasics/ThConstInv.lean`
(`GlobalTheory.ThK.Dbl.TC.SplitModel`), `Formalism/LocalToGlobal/IndefiniteReal/LocalNewformFunction.lean`
(`Formalism.IndefR.Datum.splitFacO`).

*Route.* The product formula for the local splitting cocycles: the global cocycle restricted to
rational points is a product of local Weil indices and character values, which is `1` by the product
formula MetaplecticAutomorphicForms §4.3 and the triviality of `χ_V`, `χ_W` on `E^×`; continuity from the almost-everywhere
triviality on integral points. Siegel parabolic: 3.3b, place by place. Split places: MetaplecticAutomorphicForms §3.2a identifies the
split oscillator with the type-II model and its characters, and `φ(0)` is invariant under the substitution.
Characterisation: by (1) and the irreducibility of the Heisenberg representation (Stone–von Neumann,
MetaplecticAutomorphicForms §§1.1–1.2, at each place; the commutant of the restricted tensor product of the irreducible
local models over the adelic Heisenberg group is the scalars, which is part of this target),
`ω′ = c · ω_{ψ, χ_V, χ_W}` for a function `c`, which is a character because both are representations, unitary by (3),
continuous by (5): for a point `w` at which the theta function of `ω(g₀, h₀)φ` does not vanish, `c` is near `(g₀, h₀)` the
quotient of the two theta functions at `w`, trivial on rational points because the nonzero theta functional is invariant under
them for `ω′` (by (2)) and for `ω` (above), and positive, hence trivial, on `U(V)(F_v) × U(W)(F_v)` at every split `v` by (4)
and the split law. On `U(W)(𝔸)`, `c` is trivial on `SU(W)(F)` and on `SU(W)(F_{v₀})` for a split `v₀`, where
`SU(W)(F_{v₀}) ≅ SL_d(F_{v₀})` is not compact for `d ≥ 2`; by strong approximation for the simply connected `SU(W)`
(AdelicAlgebraicGroups §4.2) `SU(W)(F)·SU(W)(F_{v₀})` is dense in `SU(W)(𝔸)`, so the continuous `c` is trivial on `SU(W)(𝔸)`,
and `c = μ̃ ∘ det` for a continuous character `μ̃` of `𝔸_E^1/E^1` (`det : U(W)(𝔸) → 𝔸_E^1` is onto and open) trivial on
`E_v^1` at every split `v` (for `d = 1` directly). Then `μ(x) = μ̃(x/x̄)` is a Hecke character of `E`, trivial on `𝔸_F^×` (hence of algebraic infinity
type) and at every place of `E` above a split place of `F`; these places carry all but a set of Dirichlet density
zero of the primes of `E` counted by norm, so `Σ_𝔓 μ(𝔓)N𝔓^{−s} ~ log(1/(s − 1))`, which for `μ ≠ 1` contradicts the
holomorphy and nonvanishing of `L(s, μ)` at `s = 1` (LFunctions Layer 7). So `μ = 1`; likewise on `U(V)(𝔸)`.

(S. Kudla, *Splitting metaplectic covers of dual reductive pairs*, Israel J. Math. 87 (1994);
M. Harris, S. Kudla, W. J. Sweet, J. Amer. Math. Soc. 9 (1996), §1; Gan–Ichino §4.1, p. 12, the source of MetaplecticAutomorphicForms §3.3's
normalisation, and §7.4, p. 35, for its Levi formula; for local Weil representations of unitary groups and their lattice
models, A. Murase, Proc. Japan Acad. Ser. A 77 (2001), A. Murase, T. Sugano, Compositio Math. 123 (2000), and T. Yang,
Trans. Amer. Math. Soc. 350 (1998).) *Needs:* 3.3b; MetaplecticAutomorphicForms §§1.1, 1.2, 1.3, 2.5, 2.6a, 3.2a, 3.3, 3.14, 4.1–4.5;
AdelicAlgebraicGroups §4.2; LFunctions Layer 7.

**Checks.**

- `V = 0`: `ω` is the character `χ̃_V ∘ det` of `U(W)(𝔸)`, trivial on `U(W)(F)` because the determinant of a rational
  element is `x/x̄` for some `x ∈ E^×` (Hilbert's theorem 90) and `χ_V` is trivial on `E^×`.
- Replacing `χ_V` by `χ_V μ` with `μ|_{𝔸_F^×} = 1` multiplies the action of `U(W)(𝔸)` by `μ̃ ∘ det`,
  globally, with `μ̃(x/x̄) = μ(x)`.
- Characterisation, the role of (4): a representation `c · ω` with `c = μ̃ ∘ det` for a continuous character `μ̃` of
  `𝔸_E^1/E^1` satisfies (1)–(3) and (5); it satisfies (4) only if `μ̃` is trivial at every split place.
- Characterisation, the role of (5): let `H ⊂ 𝔸_E^1` be the subgroup generated by `E^1` and the `E_v^1`, `v` split. An
  element `≠ 1` of `E_v^1`, `v` inert, is not in `H` (an element of `E^1` equal to `1` at a place other than `v` that is not
  split in `E` is `1`), so `𝔸_E^1/H ≠ 1`,
  and since the circle is divisible there is a homomorphism `c : 𝔸_E^1 → ℂ^1`, trivial on `H` and not trivial. Then
  `(c ∘ det h)·ω(g, h)` satisfies (1)–(4) and is not `ω`; it violates (5), because a continuous `c` trivial on `H` is
  trivial (the argument of the route), so this `c` is not continuous, while under (5) `h ↦ c(det h)`, near each point a
  quotient of the theta functions of `ω′(1, h)φ` and `ω(1, h)φ` at a fixed `w` (route), would be continuous.
- For the pair `(V, W) = (X₁^*, δ′X₂)` (`X₁^* = Hom_E(X₁, E)` with the dual Hermitian form, on which `g ∈ U(X₁)` acts by
  `ℓ ↦ ℓ ∘ g⁻¹`; `X₂` with the skew-Hermitian form `δ′h₂`), realised on `Hom_E(X₁, X₂)` with `(g, h)x = hxg⁻¹`, the
  determinant of `g` acting on `X₁^*` is `det(g)⁻¹`, so (4) reads `r · χ̃_W(det g)⁻¹ χ̃_V(det h)` with `det g` taken on `X₁`.

### Examples

For `V = 0` the global Weil representation is the character `χ̃_V ∘ det` of `U(W)(𝔸)`, trivial on `U(W)(F)` because the determinant of a rational element is `x/x̄` for some `x ∈ E^×` (Hilbert's theorem 90); replacing `χ_V` by `χ_Vμ` with `μ|_{𝔸_F^×} = 1` multiplies the action of `U(W)(𝔸)` by `μ̃ ∘ det` (4.4a).

### Dependencies

Layer 3 (3.3b); MetaplecticAutomorphicForms §§1.1, 1.2, 1.3, 2.4b, 2.5, 2.6a, 3.2a, 3.3, 3.14, 4.1–4.5; AdelicAlgebraicGroups §4.2; LFunctions Layer 7.

## Layer 5: Convergence, constant terms and cusp forms of theta integrals

Theta integrals of unitary pairs: theta integrals of cusp forms of discrete-series type, convergence in Weil's range and for regular data at a split place, archimedean vanishing, constant terms along an isotropic line through the cone maps, the local multiplicity bounds that let the cone maps descend to local matching data, and the archimedean cone lemma.

### 5.6a Theta integrals of cusp forms of discrete-series type

*Origin:* published: Rallis (1984a), the tower property of theta lifts of cusp forms, for orthogonal–symplectic pairs, and Wu (2013), Proposition 3.1, for unitary pairs; particular to this proof: the statement with (R1) in the stronger form of 3.46a (a), (b), with the factorisation through the maps `I_τ`; under (R1)–(R3) as stated it is this roadmap's own formulation.

*Method of the formal proof:* the theta integral of a cusp form against polynomial Fock data converges by the rapid decay of cusp forms and is, in the polynomial and the vector, a map compatible with the two Lie algebra actions at every real place; its values are cusp forms because the constant term along an isotropic subspace is a theta integral to the smaller space of the Witt tower, which vanishes; the map then factors through the archimedean maps on vectors finite under the maximal compact subgroups, by the irreducibility and uniqueness statements assumed at the real places (in the form of 3.46a (a), (b)), and on smooth vectors by averaging over those subgroups.

*Corollary of:* MetaplecticAutomorphicForms §5.6a (Rallis's tower property for unitary theta lifts: the constant term of a lift along the unipotent radical of the stabiliser of an isotropic subspace is a lift to the smaller space of the Witt tower, so that a lift whose lower lifts vanish is cuspidal), for the cuspidality of the theta integrals, given the vanishing of the lifts to the lowered spaces that steps (1) and (2) of the route derive from (R3), and the compatibility of the splittings of the two pairs (3.3b, orthogonal sums).

Let `E/F` be a CM extension, `(U(V), U(W))` a unitary dual pair over it with splitting characters, `ω` its global Weil
representation (4.4a) and `θ(g, h; φ)` its theta kernel. For each real place `τ` let `𝒫_τ` be the polynomial Fock space
of the pair at `τ` (3.45) and `𝒟_{V,τ}`, `𝒟_{W,τ}` discrete series of `U(V)(F_τ)`, `U(W)(F_τ)`, with Harish-Chandra modules
`𝒟^{K}`. Call a bilinear map `B : 𝒫_τ × 𝒟_{W,τ}^{K} → M` into a `(𝔲(V)_τ, K_{V,τ})`-module *admissible for the pair* if
`B(XP, v) = X·B(P, v)` for `X ∈ 𝔲(V)_τ` and `B(YP, v) + B(P, Yv) = 0` for `Y ∈ 𝔲(W)_τ`. Assume, at every `τ`:

- (R1) for unitarizable `M`, the span of the values of a nonzero admissible `B` is a submodule isomorphic to `𝒟_{V,τ}^{K}`;
- (R2) the admissible maps into `𝒟_{V,τ}^{K}` form a line, spanned by `I_τ`;
- (R3) for every `i ≥ 1` and every Hermitian space `V′_τ` whose signature is that of `V_τ` lowered by `(i, i)`, every
  admissible map from the Fock space of `(V′_τ, W_τ)` (same splitting characters) into any module is zero.

(For a pair of 3.46a these are its clauses (a) or (b), (e) and (c), applied to `𝒟_{V,τ}` and the contragredient of
`𝒟_{W,τ}`; (c2) is the clause used when `W` is the larger space.) Let `𝒟_V^∞`, `𝒟_W^∞` be the smooth vectors of the
tensor products over the real places and `I = ⊗_τ I_τ`, extended to `𝒫_∞ × 𝒟_W^∞ → 𝒟_V^∞`.

Prove that for every continuous `U(W)(F_∞)`-equivariant linear map `F` from `𝒟_W^∞` to the smooth cusp forms on `U(W)`
and every Schwartz–Bruhat function `φ_f` at the finite places there is a continuous `U(V)(F_∞)`-equivariant linear map
`F′` from `𝒟_V^∞` to the smooth cusp forms on `U(V)` such that, for all polynomial Fock vectors `P` at the real places,
all `v ∈ 𝒟_W^∞` and all `g ∈ U(V)(𝔸)`, the integral `∫_{[U(W)]} θ(g, h; P ⊗ φ_f)·F(v)(h) dh` converges absolutely and equals
`F′(I(P, v))(g)`.

*The form of the formal proof.* The formal proof assumes (R1) in the stronger form of 3.46a (a), (b): a nonzero
admissible map is moreover nonzero on the joint harmonic of the pair, and is determined by its values there (FormalProof,
`Formalism/SharpRestriction/Divisibility/SchurIrreducible.lean` (`Formalism.MainNotions.SchurIrreducible.ARiiiUp`,
`Formalism.MainNotions.SchurIrreducible.ARiiiDown`), which enter `GlobalTheory.Chain.IoLift.ioPair_of_rapid` in
`Development/AbelianVarietyTheory/Proofs/TwistedOperators/ExistsThetaLiftMultiplicitySpacesOfHyp.lean` through its
hypothesis `Formalism.MainNotions.SchurIrreducible.ArchimedeanRallisUpDownLine`). In the
cases used, (R1) holds in this form. Under (R1) as stated, the statement is this roadmap's own, proved by the route below.

*Route.* (1) For a space `V′` over `E` with the signature of `V` lowered by `(i, i)` at every real place, `i ≥ 1`, the
theta integral of `F(v)` to `U(V′)` against polynomial Fock data is, as a function of the polynomial and of `v`, an
admissible map at each `τ`, hence zero by (R3). (2) Polynomial Fock data over a vacuum are dense, for Sobolev norms,
among the Schwartz data of a fixed level, and the theta integral of a rapidly decreasing form is continuous for them;
so the integrals to `U(V′)` vanish for all data. (3) *Rallis's tower property:* for an isotropic subspace `C ⊂ V` of
dimension `i` with `V = C ⊕ V′ ⊕ C^∨`, a rapidly decreasing cusp form `f` on `U(W)` and a Schwartz datum `φ`, the constant
term of the theta integral of `f` to `U(V)` along the unipotent radical of the stabiliser of `C` is, at `g`, the volume
of `[N_C]` times the theta integral of `f` to `U(V′)`, at `1`, for the datum obtained from `ω(g, 1)φ` by integrating over
the coordinates of `C`; by (2) it vanishes, so the integrals to `U(V)` are cusp forms. (4) `B(P, v) := ∫θ(·, h; P ⊗ φ_f)F(v)(h)dh`
converges by the rapid decay of cusp forms (ArithmeticLocallySymmetricSpaces §ALS.F.6 (iii)), is admissible at every
`τ`, and takes values in the smooth cusp forms on `U(V)`, a unitarizable module by the Petersson product; by (R1) and
(R2) it factors through `I` on `K`-finite vectors,
and by continuity and averaging over the maximal compact subgroups on smooth vectors. (S. Rallis, *On the Howe duality conjecture*, Compositio Math. 51 (1984), §1, Theorem 1.1.1, p. 345, there for
orthogonal–symplectic pairs, for (3); C. Wu, *Irreducibility of theta lifting for unitary groups*, J. Number Theory 133
(2013), §3, Proposition 3.1, for unitary pairs.)

*Needs:* 4.4a, 3.45, 3.46a; MetaplecticAutomorphicForms §§5.1, 5.2, 5.6; ArithmeticLocallySymmetricSpaces §ALS.F.6 (rapid
decay of cusp forms); AutomorphicFormsOnReductiveGroups §§2.1, 4.2.

**Checks.**

- `V` anisotropic: (3) is empty and (R3) is not used; the statement is then (R1), (R2) and the convergence.
- `U(1) × U(1, 1)` over `F = ℚ`, `W` of dimension one: a cusp form on `U(1)` is a character `μ` of the compact group
  `[U(1)]`, and its theta integral to `U(1, 1)` has, at the real place, the lowest weight module of the first Check of
  3.46a for the weight determined by `μ_∞`; by (R3) (`𝒫(1, 0; 0, 0) = ℂ` has weight `0`, which is excluded) its constant
  term vanishes: the integral is a holomorphic or antiholomorphic cusp form, as the classical theta series with a
  character of nonzero weight are.

### 5.7a Weil's convergence criterion for unitary pairs

*Origin:* published: Weil (1965), §§V–VI, the convergence criterion for theta integrals of classical groups (for split `W`: MetaplecticAutomorphicForms §5.7); particular to this proof: the matrix-coefficient majorant (i)–(iii) and the bound of the theta kernel by a seminorm of the archimedean component, a power of the height of `h` and a function integrable over `[U(V)]`, from which [FormalProof] has the criterion for arbitrary `W`, locally uniformly in `h`. The absolute-sum bound in the model adapted to `Y` for arbitrary `W` and `h`, and the majorant at `h = 1`, are this roadmap's own formulation.

*Method of the formal proof:* for `V` of one signature `(r_v, s_v)` at all real places and with `min(r_v, s_v)` in place of `r`: the square of the theta kernel is bounded, by Poisson summation in one variable, by a constant times the sum over all rational points `ξ` of `V ⊗ W` of the Heisenberg matrix coefficient at `(g, h)⁻¹ξ`, which decays rapidly at the real places and has compact support at the finite ones; this lattice sum, on which both groups act linearly, is estimated on Siegel sets of `U(V)` and integrated, which is finite under Weil's condition; for split `W` at `h = 1` the absolute sum over `(V ⊗ Y)(F)` is counted directly on a Siegel set. The route written here instead estimates the theta sum itself on a Siegel set in a model adapted to `V` (Weil's estimate), and states the matrix-coefficient majorant as separate clauses.

Prove Weil's convergence criterion for unitary pairs. For a unitary dual pair `(U(V), U(W))` over a quadratic
extension of number fields, with `W` arbitrary (not necessarily split), `dim V = m` and `r` the Witt
index of `V`: if `r = 0` or `m − r > (dim W)/2`, then for every Schwartz `φ` the integral
`∫_{[U(V)]} θ(g, h; φ) dg` converges absolutely, locally uniformly in `h`, with a bound polynomial in
the height of `h`. More precisely, in the Schrödinger model of a rational polarisation `(V ⊗ Y ⊕ 𝕏₀) ⊕ (V ⊗ Y^* ⊕ 𝕏₀^*)`
adapted to a maximal isotropic subspace `Y` of `W` (`Y^*` a dual isotropic subspace, `𝕏₀` a Lagrangian of `V ⊗ W₀`,
`W₀ = (Y ⊕ Y^*)^⊥`), `∫_𝔖 Σ_{ξ ∈ (V ⊗ Y ⊕ 𝕏₀)(F)} |(ω(g, h)φ)(ξ)| dg` is finite for a Siegel domain `𝔖` of `U(V)` (a finite
union of translates of Siegel sets mapping onto `[U(V)]`; the absolute sum is a function on `U(V)(𝔸)`, not on the quotient,
since rational elements outside the stabiliser of the polarisation act through Fourier transforms, which keep the theta sum
but not the sum of absolute values), and for a fixed finite component `φ_f` it is at most a continuous seminorm of the
archimedean component `φ_∞` times a polynomial in the height of `h`; since `|θ(g, h; φ)|` is at most the absolute sum, this
bounds `∫_{[U(V)]} |θ(g, h; φ)| dg`.
At `h = 1` the bound holds as well for `φ_∞ = φ₁ ⊗ φ₂` with `φ₂` Schwartz on `𝕏₀(F ⊗ ℝ)` and `φ₁` replaced by any continuous
majorant on `(V ⊗ Y)(F ⊗ ℝ)` with `|φ₁(ξ)| ≤ C(1 + ‖ξ‖)^{−M}`, `M` large enough (on these coordinates `U(V)` acts by
substitution, so the majorant is moved by substitution), the bound being `C` times a continuous seminorm of `φ₂` (for fixed
finite components). For another `h` the majorant must be taken for `ω(1, h)φ`, not for `φ`: a
pointwise majorant of `φ₁` does not control `ω(1, h)φ` when `h` acts by a partial Fourier transform (Check).
*(Matrix-coefficient majorant.)* For Schwartz functions `Φ₁`, `Φ₂` in a Schrödinger model of `𝕎(𝔸)`, `𝕎 = V ⊗ W`, let
`M_{Φ₁,Φ₂}(w) = ⟨ρ(w)Φ₁, Φ₂⟩`, `w ∈ 𝕎(𝔸)`, be the matrix coefficient of the Heisenberg operators. (i)
`|θ(g, h; Φ₁)|·|θ(g, h; Φ₂)| ≤ c·Σ_{ξ ∈ 𝕎(F)} |M_{Φ₁,Φ₂}((g, h)⁻¹ξ)|`, `c` depending only on the measures, and
`M_{ω(g,h)Φ₁, ω(g,h)Φ₂}(w) = M_{Φ₁,Φ₂}((g, h)⁻¹w)` for the linear action of `U(V) × U(W)` on `𝕎`. (ii) For `Φ_i = f_i ⊗ φ_i`
(`f_i` Schwartz on the product of the real places, `φ_i` Schwartz–Bruhat on the finite adeles) and `N ≥ 0` there are a
continuous seminorm `p` and a compact `C ⊂ 𝕎(𝔸_f)`, depending on `φ₁`, `φ₂`, `N`, with
`|M_{Φ₁,Φ₂}(w)| ≤ p(f₁)p(f₂)(1 + ‖w_∞‖)^{−N}1_C(w_f)`. (iii) At a place `v₁` split in `E`, in the type-II model, if the component
of `Φ₁` at `v₁` is supported in a small enough neighbourhood of a matrix of rank `dim V` and `Φ₂ = Φ₁(−·)`, then
`M_{Φ₁,Φ₂}(w) = 0` unless the component of `w` at `v₁` in the Lagrangian of the model has rank `dim V`.

*The form of the formal proof.* The formal proof has the criterion with `min(r_v, s_v)` in place of `r`, for `V` of one
signature `(r_v, s_v)` at all real places (the form with the Witt index is Weil's, Weil65), and the three clauses of the
matrix-coefficient majorant. Of the absolute sum in the model adapted to `Y` it has only the case of split `W = Y ⊕ Y^*`,
`dim Y = n ≥ 1` (so `𝕏₀ = 0` and the sum is invariant under `U(V)(F)`), at `h = 1`, with `r` the Witt index of `V`: if `r = 0`
or `m − r > n`, then `∫_{[U(V)]} Σ_{ξ ∈ (V ⊗ Y)(F)} |φ(g⁻¹ξ)| dg` is finite for every Schwartz `φ` on `(V ⊗ Y)(𝔸)`
(FormalProof, `Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/WeilThetaConvergence.lean`
(`GlobalTheory.Published.WeilThetaConvergence`)), and for each basis of `E/F`, in the coordinates it gives, the
integral is at most `ν(φ)` for a seminorm `ν` continuous in the archimedean component for each fixed finite component
(the first clause of `GlobalTheory.Published.WeilSiegelFormulaUnitary`, in the file cited in 6.4a). That clause for
arbitrary `W` and `h`, with its bound, and the majorant at `h = 1` are this roadmap's own, proved by the route below.
In their place it bounds the theta kernel itself,
`|θ(g, h; f ⊗ φ)| ≤ p(f)·ht(h)^k·G(g)` for a fixed finite component `φ`, with `p` a continuous seminorm of the
archimedean component `f`, `ht` the height and `G` integrable over a fundamental domain for `U(V)(F)` in `U(V)(𝔸)`.
In FormalProof the criterion is `Development/AbelianVarietyTheory/Definitions/Divisors/CTSmallCone.lean`
(`GlobalTheory.ThK.WeilConv`), and the three clauses and the bound of the kernel are
`Development/WeilBound/ThetaLifts/FrameEstimates/SquareIntegrableWeilRange.lean` (`PositivityTheory.ThKEst.CoefSum`,
`PositivityTheory.ThKEst.CoefEq`, `PositivityTheory.ThKEst.CoefBd`, `PositivityTheory.ThKEst.SoCut`;
`PositivityTheory.ThKEst.DomWeil`). The formal proof also states clauses (i) and (ii) of the majorant in
`Development/WeilBound/ThetaLifts/FrameEstimates/SquareIntegrableWeilRange.lean` (`PositivityTheory.ThKEst.coef`).

*Route.* Reduction theory on Siegel sets of `U(V)` (AdelicAlgebraicGroups §§3.4–3.5) and Weil's estimate
of the theta sum on a Siegel set by a power of the torus coordinate determined by `dim W`; for split
`W` this is MetaplecticAutomorphicForms §5.7. At `h = 1` the estimate uses only that `|φ_∞|` is dominated by `C(1 + ‖ξ‖)^{−M}` with `M` large, the
constant `C` being a Schwartz seminorm of `φ_∞`; for general `h` it is applied to `ω(1, h)φ`, whose Schwartz seminorms are
bounded by seminorms of `φ` times a polynomial in the height of `h`. Weil's estimate is made in a model adapted to `V`; in the model adapted to `Y` the
absolute sum is, up to unitary characters, `Σ_{ξ ∈ (V ⊗ Y)(F)} |φ₁(g⁻¹ξ)|` times the absolute theta sum of `(V, W₀)` at
`g`: on a Siegel set of `U(V)` the first factor counts the points of `g⁻¹(V ⊗ Y)(F)` in a box and the second is Weil's
estimate for `(V, W₀)`; in rank one, with torus coordinate `l` acting by `l` on an isotropic line of `V`, their product
grows like `|l|_E^{(dim W)/2}`, against the measure `|l|_E^{−(m−1)}d^×l` of the Siegel set, which is integrable exactly
under Weil's condition `m − 1 > (dim W)/2`. (Weil65, §§V–VI.) Matrix-coefficient majorant: (i) Poisson summation in one of
the two variables of `X(F) × X(F)` in `θ(Φ₁)·conj θ(Φ₂)`, and the covariance from the unitarity of `ω` and
`ω(γ)ρ(w)ω(γ)⁻¹ = ρ(γw)` (MetaplecticAutomorphicForms §1.3); (ii) route not given here; the statement is a Schwartz estimate for the coefficient,
through a seminorm of the archimedean components, with compact support at the finite places; (iii) the coefficient at
`w` vanishes unless the translation component of `w` lies in the difference of the supports of `Φ₁` and `Φ₂`, here near
twice a matrix of rank `dim V`. *Needs:* MetaplecticAutomorphicForms §§1.3, 5.1, 5.2, 5.7; AdelicAlgebraicGroups §§3.4, 3.5.

**Checks.**

- `V` anisotropic: always convergent, the quotient being compact.
- For split `W` of dimension `2n` the condition is `m − r > n = d(n)`, that of MetaplecticAutomorphicForms §5.7.
- The majorant clause is for `h = 1`: take `F = ℚ`, `V` a definite Hermitian line, `W` a hyperbolic plane, `h` the Weyl element
  at the real place (the Fourier transform on `(V ⊗ Y)(ℝ) = ℝ²`) and `φ₁ = f_T`, `f_T(x) = e^{−π(1 − iT)|x|²}`. Every `f_T` has the
  majorant `e^{−π|x|²}`, while `|f̂_T(ξ)| = (1 + T²)^{−1/2}e^{−π|ξ|²/(1 + T²)}`, whose sum over a fixed lattice of `ℝ²` grows like `T`;
  `U(V)(ℝ) = U(1)` preserves these radial functions and an open subgroup of the finite components preserves the lattice, so
  integrating over `[U(V)]` does not remove the growth. The Schwartz-seminorm form of the bound, which sees derivatives, is
  not affected.

### 5.7b Regularised convergence at a split place and archimedean vanishing

*Origin:* adapted from the regularisation of theta integrals of Kudla and Rallis (1994) and Ichino (2004): convergence outside Weil's range for test functions supported on matrices of full rank at one split place (i), the reduction of every test function to such a one modulo the coinvariant relations (ii), and the invariant extension of the integral to all test vectors (iv); particular to this proof: the archimedean vanishing (iii). The vanishing of the twisted coinvariants stratum by stratum in (ii), and (iv) for every pair, are this roadmap's own formulation.

*Method of the formal proof:* for (i), `|θ(g, h; Φ)|²` is bounded by a sum over the rational points `z` of `X ⊗ W` of the Heisenberg coefficient `z ↦ ∫ (ρ(z)Φ)·conj(Φ(−·))` evaluated at the image of `z` under `(g, h)⁻¹`, the two groups acting linearly on `X ⊗ W`; regular data cut finely at `v₁` leave only the `z` of full rank, and a nonvanishing minor makes these terms decay on the Siegel sets. The second assertion of (ii) is proved one row at a time by explicit averages over the operations on that row, and (iii) by showing that a linear form on the Fock module equivariant under the Lie algebra of one block of `K_X` kills every power of a linear form.

Prove regularised convergence at a split place and archimedean vanishing. Let `(U(X), U(W))` be a
unitary dual pair over a CM extension `E/F`, `dim X = n ≤ dim W = d`, with splitting characters `(χ_X, χ_W)`.

- (i) Let `v₁` be a finite place split in `E`, so that the Weil representation at `v₁` is the type-II model on
  `S(M_{n×d}(F_{v₁}))` (MetaplecticAutomorphicForms §3.2a). Let `Y_X` be a maximal isotropic subspace of `X` over `F`, of dimension `r`, `X₀` the
  anisotropic complement of `Y_X ⊕ Y_X^*`, and use the Schrödinger model *adapted to `Y_X`*: functions of `(w; ξ₀)`,
  `w ∈ (Y_X ⊗ W)(𝔸) ≅ W(𝔸)^r`, `ξ₀` in a Lagrangian of `X₀ ⊗ W`. If `Φ_{v₁}` is supported on matrices of rank `n`
  (*regular* data), the absolute theta sum `g ↦ Σ_{(w;ξ₀)} |(ω(g, h)Φ)(w; ξ₀)|` in this model decays rapidly on the Siegel
  sets of `U(X)` for the stabiliser of a maximal isotropic subspace `Y_X^*` dual to `Y_X` (torus elements `m(t)` acting on
  `Y_X` by `t^{−1}`, `|t_1|_E ≥ ⋯ ≥ |t_r|_E ≥ c`), uniformly for `h` in compact sets and polynomially in the height of `h`, with constants that, for fixed finite components, are continuous seminorms of the
  archimedean component. Hence the theta kernel `θ(g, h; Φ)`, which is the same in every model and is bounded by that
  sum, decays rapidly on these Siegel sets, `∫_{[U(X)]} |θ(g, h; Φ)| dg` is at most such a seminorm, and `I_{X,W}(Φ)`
  converges absolutely, has moderate growth, and depends continuously on the archimedean component. In other models the
  absolute sum need not decay (Check).
- (ii) If `χ_W` is nontrivial at `v₁`, then for every `k < n` the twisted `U(X)(F_{v₁})`-coinvariants of the Schwartz
  space of the matrices of rank exactly `k` vanish; hence modulo the `U(X)(F_{v₁})`-coinvariants every Schwartz function
  at `v₁` is equivalent to one supported on matrices of full rank.

  *The form of the formal proof.* The second assertion of (ii) (every Schwartz function at `v₁` is equivalent, modulo
  the coinvariant relations, to one supported on matrices of full rank) holds there for every nontrivial unitary
  character and all `n`, `d`; for `n ≤ d` the coinvariants then have no nonzero proper `U(W)(F_{v₁})`-invariant
  subspace. In the comparison of the two theta integrals of a complementary datum these are used at the places split
  completely at which `ν` is unramified with `ν(ϖ) ≠ 1`, together with the statement that at `v₁` a regular vector lying
  in the coinvariant relations is a relation among regular vectors. The vanishing stratum by stratum, and (iv) for
  every pair, are this roadmap's own, proved by the route below. In FormalProof the second assertion of (ii) and the
  absence of invariant subspaces are `Development/WeilBound/CoreStatements/LocallyConstantCoinvariants/RightOnto.lean`
  (`PositivityTheory.KCo.SurjSt`, `PositivityTheory.KCo.IrrSt`), and the relations among regular vectors are
  `Development/WeilBound/ThetaLifts/CartanFactorisation/CartanConj.lean` (`PositivityTheory.ThKF.SoCoinv`).
- (iii) *Archimedean vanishing.* If `X` has signature `(r, s)` and `W^♭` signature `(r′, s′)` at every real place, the
  infinity type `m_{W,v}` of `χ_W` satisfies `|m_{W,v}| > d` at every real place `v`, and `min(r′, s′) < min(r, s)`, then
  every continuous linear functional on the Schwartz space of the pair at the real places that is invariant under
  `U(X)(F ⊗ ℝ)` is zero; hence `I_{X,W}(Φ) = 0` for every `Φ` when `d + 2·min(r, s) < 2n` (Weil's condition, 5.7a), and
  for every `Φ` as in (i).

  *Remark.* The route below works at one real place, and gives the vanishing as soon as the conditions hold at one
  real place, for every `Φ` for which the integral converges; the statement in that generality is not claimed here.
- (iv) *Invariant extension.* Suppose, in addition to the hypothesis of (ii), that the twisted
  `U(X)(F_{v₁})`-coinvariants of the Schwartz space of the matrices of full rank at `v₁` form an irreducible
  `U(W)(F_{v₁})`-module and that the coinvariants of the whole Schwartz space at `v₁` are nonzero (for the two pairs
  `(V, W)`, `(V′, W)` of a local complementary datum at a split place with `ν` ramified or `ν(ϖ) ≠ 1`, both hold by 3.47,
  irreducibility). Then the regular test vectors modulo their own coinvariant relations map isomorphically onto the
  coinvariants of all test vectors at `v₁`, and `I_{X,W}` extends uniquely from the regular test vectors to a
  `U(X)(F_{v₁})`-invariant linear map on all test vectors:
  `I_{X,W}(Φ) := I_{X,W}(Φ_{reg})` for any regular `Φ_{reg}` with `Φ − Φ_{reg}` in the span of the `ω(g, 1)Ψ − Ψ`,
  `g ∈ U(X)(F_{v₁})`. The extension intertwines `ω(1, h)` with right translation, its values are automorphic functions of
  moderate growth, and wherever the integral converges for all test vectors (for instance `X` anisotropic) it is the
  integral.

*Route.* (i): on the Siegel set `ω(m(t), h)Φ(w; ξ₀)` is a unitary character times `|det t|_E^{d/2}` times
`(ω(1, h)Φ)(t_1w_1, …, t_rw_r; ξ₀)` (3.3b for the exchanged pair; `m(t)` acts on `Y_X` by `t^{−1}` and trivially on `X₀`); at `v₁` the passage from the type-II model to the adapted model is a partial Fourier transform in the rows
of the type-II matrix dual to `Y_X`, so a regular `Φ_{v₁}` vanishes at `(w; ξ₀)` unless the components of `w_1, …, w_r` in the
first factor of `W_{v₁}` are linearly independent. So every rational point `(w; ξ₀)` that contributes has all `w_i ≠ 0`, and
summing the Schwartz function over the lattice points `w_i ≠ 0` scaled by `t_i` gives `O(∏_i|t_i|_E^{−M})` for every `M`,
with constants that are seminorms of the archimedean component; the factor of `ξ₀` is the absolute theta sum of the
anisotropic pair `(X₀, W)`, bounded on compact sets, and the compact parts of the Siegel set are absorbed in finitely many
such bounds (AdelicAlgebraicGroups §§3.4–3.5). (ii): a functional on `S(M_{n×d})` killing the
coinvariant relations and supported on matrices of rank `< n` would be equivariant for a character of the
stabilisers that the nontriviality of `χ_W` excludes; the matrices of rank exactly `k` form a union of orbits fibred over
a Grassmannian, the stabiliser of `[1_k 0; 0 0]` contains `diag(1_k, g₂)`, `g₂ ∈ GL_{n−k}`, which fixes the point and acts
through `χ_{W,v₁}(det g₂)` times a real power of `|det g₂|`, a nontrivial character, so the coinvariants vanish fibre by
fibre. (iv): the matrices of full rank form one orbit of `U(X)(F_{v₁}) × U(W)(F_{v₁})` on which `U(X)(F_{v₁})` acts freely,
so the twisted coinvariants of their Schwartz space are an induced representation, irreducible by hypothesis; by (ii) it
maps onto the coinvariants of the whole space, which are nonzero, so the map is injective. Hence a regular `Φ_{reg}` with
`Φ − Φ_{reg}` in the relations exists (ii), and two such differ by a relation among regular vectors, on which the
convergent integral vanishes (it is invariant under `U(X)(𝔸)`); any invariant extension agrees with this one. (iii): a continuous linear functional invariant under `U(X)(F_v)`,
such as the integral where it converges, vanishes when no polynomial Fock vector at `v` is fixed in `ω` by
`K_{X_v} = U(X₊) × U(X₋)`, these vectors being dense (3.45(ii)). By 3.45(ii) the vacuum has
`U(X₊)`-weight `(s′ − r′ + m_{W,v})/2` and `U(X₋)`-weight `(r′ − s′ + m_{W,v})/2`, both of the sign of `m_{W,v}` since
`|m_{W,v}| > d ≥ |r′ − s′|`. In `Sym((X₊ ⊗ W₊)^∨) ⊗ Sym(X₊ ⊗ W₋)` a vector of `U(X₊)`-weight `det^{−ℓ}`, `ℓ > 0`, needs
`r ≤ r′`, and one of weight `det^{ℓ}` needs `r ≤ s′`; likewise for `X₋` (the computation of 3.47b(i)). So a fixed vector
needs `r ≤ r′` and `s ≤ s′` when `m_{W,v} > d`, and `r ≤ s′` and `s ≤ r′` when `m_{W,v} < −d`; `min(r′, s′) < min(r, s)`
excludes both. No publication is cited for (i)–(iv): the route above is their proof.
The decay of the theta kernel and the conclusions on `I_{X,W}` in (i) follow from the formal proof,
`Development/AbelianVarietyTheory/Definitions/Divisors/CTSmallCone.lean` (`GlobalTheory.ThK.SoDecay`),
`Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.Model.SoLoc`).

*Needs:* 3.45, 3.46, 3.47b, 5.7a; MetaplecticAutomorphicForms §§3.2a, 5.1, 5.2; AdelicAlgebraicGroups §§3.4, 3.5.

**Checks.**

- (iii) for `X` definite (`min(r, s) = 0`) is empty, as it must be: definite `X` has nonzero theta integrals when
  the weight occurs.
- `n = 1`, `d = 2`: the full-rank condition at `v₁` says that `Φ_{v₁}` vanishes near `0 ∈ F_{v₁}²`; the theta
  integral of the indicator of a neighbourhood of `0` is the one that needs (ii).
- (i) is a statement about the adapted model. In the mixed model of 5.7c (first variable `u ∈ X(𝔸)`, the coordinate of
  `X ⊗ y`), for `X` a hyperbolic plane the terms `u = 0` alone sum to `θ_{X,W₁}(g; e₀Φ)`, which on the Siegel set is
  `χ_W(l)|l|_E^{(d−2)/2}·r₁^{(0)}(ω(k)Φ)` up to a rapidly decreasing term, and `r₁^{(0)}` does not vanish on regular data
  (5.7c, Checks): there the sum of absolute values grows, and only the signed kernel decays (Poisson summation along the
  line, `r̂₁^{(0)} = 0` on regular data).

### 5.7c Constant terms of theta integrals along an isotropic line

*Origin:* adapted from the constant terms of theta integrals of Rallis (1987) and of Kudla and Rallis (1994), with Tate (1950) for the integrals along the line: the constant term along an isotropic line as the sum of two theta integrals of explicit maps given by Tate integrals (the cone and the dual cone), in two ranges, the second for regular data at a split place, without analytic continuation. (b) for both cones at every place and for every pair is this roadmap's own formulation.

*Method of the formal proof:* the constant term of the kernel is the term of the restriction to `W₁` plus a sum over the nonzero isotropic vectors of `X`, one rational orbit, which is unfolded into a Tate integral along the line averaged over a compact subgroup; in the second range the sum along each line is first exchanged for the sum along the opposite isotropic line by comparing two expansions of the same theta sum, the term at zero of the exchanged sum vanishing on regular data, and the exponents stay fixed integers throughout. The published proofs of such formulas (Kudla and Rallis (1994)) regularise the integral outside the range of absolute convergence and continue it analytically; the formal proof characterises the maps by their behaviour under Heisenberg translations and uses regular data at a split place in place of the continuation.

Prove the constant-term formula of theta integrals along an isotropic line, with the cone maps. Let `(U(X), U(W))` be a
unitary dual pair over a quadratic extension of number fields, `X` Hermitian of dimension `n`, `W` skew-Hermitian of
dimension `d`, with splitting characters `(χ_X, χ_W)` (`χ_X` governing `U(W)`), and suppose the theta integral
`I_{X,W}(Φ)(h) = ∫_{[U(X)]} θ(g, h; Φ) dg` converges for the `Φ` considered (5.7a, 5.7b). Let `x, y ∈ W` be
isotropic with `⟨x, y⟩_W = 1` for the skew-Hermitian form of `W` (so `δ⁻¹⟨x, δy⟩_W = 1` for the Hermitian form
`δ⁻¹⟨·,·⟩_W` of `W^♭`), `W₁ = ⟨x, y⟩^⊥`, `P_x` the stabiliser of `Ex` with Levi elements `m(t, h₁)`
(`t ∈ 𝔸_E^×` acting by `t` on `x` and `t̄⁻¹` on `y`, `h₁ ∈ U(W₁)(𝔸)`) and unipotent radical `N_x`. Use the mixed
model attached to `𝕎 = (X ⊗ x) ⊕ (X ⊗ W₁) ⊕ (X ⊗ y)`: `S(X(𝔸)) ⊗̂ S(𝒳₁(𝔸))` with first variable `u ∈ X(𝔸)` the
coordinate of `X ⊗ y` and `𝒳₁` a Lagrangian of `X ⊗ W₁`, reached from any Schrödinger model by a partial Fourier
transform `Φ ↦ Φ^♯` (AnalyticNumberTheoryPartII §§5.3g, 5.3h). The splitting of `U(X)` is the product of those of
the pairs `(X, ⟨x, y⟩)`, with the trivial character, and `(X, W₁)`, with `χ_W` (MetaplecticAutomorphicForms §3.3; 3.3b, orthogonal sums (a)), so `U(X)` acts on the first
variable by substitution. Define:

- `e₀Φ = Φ^♯(0, ·) ∈ S(𝒳₁(𝔸))`, a Schwartz function for the pair `(X, W₁)`; `e₀` is onto. `e₀` is the map of
  MetaplecticAutomorphicForms §6.3 with the roles of the two members exchanged.
- When `X` is isotropic: `u₀, u′₀ ∈ X` isotropic with `⟨u₀, u′₀⟩ = 1`, `X₁ = ⟨u₀, u′₀⟩^⊥`, `m_X(l)` (`l ∈ 𝔸_E^×`) the
  element acting by `l` on `u₀`, by `l̄⁻¹` on `u′₀` and trivially on `X₁`, `P′` the stabiliser of the line `Eu₀` in `U(X)`, and
  `K_X = ∏_v K_{X,v}` a compact subgroup of `U(X)(𝔸)` (the stabiliser of a fixed lattice at almost all places) with the
  *Iwasawa decomposition* `U(X)(F_v) = P′(F_v)·K_{X,v}` at every place, and in good position at the real places: there the
  plane `⟨u₀, u′₀⟩` is spanned by a positive and a negative line for the Cartan involution of `K_{X,v}` (then `m_X(l) ∈ K_X`
  for `|l| = 1` and `K_X ∩ Stab(u₀) = K_{X₁}`), and likewise `⟨x, y⟩` for that of `K_W`. The decomposition holds at a real
  place for a maximal compact subgroup, and at a finite place where `E_v/F_v` is unramified or split for the stabiliser of a
  self-dual lattice; it can fail for a maximal compact subgroup that is not special (Check). Write the second factor in
  the model of `X ⊗ W₁ = (u₀ ⊗ W₁) ⊕ (X₁ ⊗ W₁) ⊕ (u′₀ ⊗ W₁)` with Lagrangian
  `(u′₀ ⊗ W₁) ⊕ 𝒳′₁`, `𝒳′₁` a Lagrangian of `X₁ ⊗ W₁`. For `c ∈ 𝔸_E` let `r₁^{(c)}` be the map into `S(𝒳′₁(𝔸))`, the
  Schrödinger model of `(X₁, W₁)`, that evaluates the first variable at `c·u₀` and the `u′₀ ⊗ W₁`-coordinate at `0`;
  `r₁ = r₁^{(1)}`; and let `r̂₁^{(s)}Ψ = ∫_{𝔸_E} r₁^{(t)}(Ψ) ψ(Tr_{E/F}(ts)) dt` (self-dual measure) be its Fourier transform
  along the line `Eu₀`. For a unitary character `μ` of `𝔸_E^×/E^×` and `z ∈ ℂ` the *cone* and the *dual cone* are
  `cone_{μ,z}Φ = ∫_{K_X}∫_{𝔸_E^×} r₁^{(l)}(ω(k, 1)Φ) μ(l)|l|_E^z d^×l dk` and
  `cone^∨_{μ,z}Φ = ∫_{K_X}∫_{𝔸_E^×} r̂₁^{(l)}(ω(k, 1)Φ) μ(l)|l|_E^z d^×l dk`:
  Tate integrals over the Heisenberg translates of the point of evaluation along the line; no Weil operator of a Levi
  element enters. The local maps `e₀,v`, `cone_v`, `cone^∨_v` are defined in the same way at each place; on pure
  tensors `e₀` is the tensor product of the `e₀,v`, and the global cones are the global Tate factor of `μ` times the
  tensor product of the local cones (normalised by their values on the lattice vectors, (d)).

Prove:

- (L) *Laws.* `r₁^{(c)}(ω(m_X(l), 1)Ψ) = χ_W(l)|l|_E^{(d−2)/2}·r₁^{(cl⁻¹)}(Ψ)`;
  `r₁^{(c)}(ω(1, u·m(t, h₁))Ψ) = χ_X(t)|t|_E^{n/2}·ω₁(h₁)r₁^{(t̄c)}(Ψ)` for `u ∈ N_x`; `r₁^{(c)}` commutes with `U(X₁)` and
  is invariant under the unipotent radical of the stabiliser of `Eu₀` in `U(X)`. Hence, with `μ^c(t) = μ(t̄)`,
  `cone_{μ,z}∘ω(1, u·m(t, h₁)) = (χ_X(μ^c)⁻¹)(t)|t|_E^{n/2−z}·ω₁(h₁)∘cone_{μ,z}` and
  `cone^∨_{μ,z}∘ω(1, u·m(t, h₁)) = (χ_Xμ^c)(t)|t|_E^{n/2−1+z}·ω₁(h₁)∘cone^∨_{μ,z}`; both cones are invariant under `ω(K_X, 1)`
  and their images are fixed by `K_{X₁}`. The map `e₀` commutes with `U(X)` and
  `e₀(ω(1, u·m(t, h₁))Ψ) = χ_X(t)|t|_E^{n/2}·ω₁(h₁)e₀(Ψ)` for `u ∈ N_x`.
- (U) *Unfolding.* With such a `K_X` there is `κ > 0` such that, for `f` continuous on `U(X)(𝔸)`, left invariant under the
  adelic unipotent radical of `P′` and under the rational stabiliser of `u₀`, with
  `∫_{K_X}∫_{𝔸_E^×}∫_{[U(X₁)]}|f(m_X(l)g₁k)| dg₁ |l|_E^{1−n} d^×l dk < ∞`: the sum of `f(γg)` over `γ ∈ Stab(u₀)(F)\U(X)(F)`
  converges for almost every `g`, is integrable over `[U(X)]`, and its integral is `κ` times the same triple integral without absolute
  values.
- (a) *Convergence and duality.* The local cones converge absolutely for `Re z > 0`, the global ones for `Re z > 1`, and
  both continue meromorphically in `z`, with the poles of `L(z, μ)`. Tate's functional equation applied to `t ↦ r₁^{(t)}Ψ`
  gives `cone^∨_{μ,z} = cone_{μ⁻¹,1−z}` globally and `cone^∨_{μ,z} = γ(1 − z, μ⁻¹, ψ)·cone_{μ⁻¹,1−z}` locally (continued in
  `z`), `γ` Tate's local `γ`-factor.
- (b) *Invariance at the unfolding parameters.* Put `z₀ = n − d/2`. Let `p₁` be a linear map out of the Schrödinger
  space of `(X₁, W₁)` at a finite place `v`, invariant under `U(X₁)(F_v)` (at a real place: a continuous linear functional
  invariant under `U(X₁)(ℝ)`). If `L(z₀, χ_{W,v}⁻¹)` is finite, then `p₁ ∘ cone_{χ_W⁻¹, z}` at `z = z₀` is invariant under
  `U(X)(F_v)`; for `z₀ > 0` it is `Φ ↦ ∫_{Stab(u₀)\U(X)(F_v)} p₁(r₁(ω(g, 1)Φ)) dġ`. If moreover `γ(z₀, χ_{W,v}⁻¹, ψ_v)` is
  finite and nonzero, the same holds for `p₁ ∘ cone^∨_{χ_W, 1−z₀}`. At a finite place the conditions hold whenever
  `z₀ ≠ 0, 1`.

  *The form of the formal proof.* For (b) the case used is the dual cone of the pair `(V′, W)` of a complementary datum
  at the split place `v₁`, at its unfolding parameter `(ν, ε₀ + 1)`: composed with a linear form invariant under
  `U(V′₁)(F_{v₁})` it is invariant under `U(V′)(F_{v₁})`, and it carries regular vectors to regular vectors. Only integer
  parameters occur there, and no continuation in `z`. (b) for both cones at every place and for every pair is this
  roadmap's own, proved by the route below. For (a) the formal proof has the absolute convergence at integer exponents
  only (`z ≥ 2` globally, `z ≥ 1` at the real places), and in place of the continuation and the two functional equations,
  which are Tate's, it relates the two cones by Poisson summation along the line at fixed integer parameters.
  In FormalProof, (b) in this case is `Development/WeilBound/ThetaLifts/LocalTheory/UnramifiedDeterminedBySpherical.lean`
  (`PositivityTheory.ThKG.Loc.FLocB`), and the forms of (a) are `Development/WeilBound/ThetaLifts/SmallCones/ThetaUniq.lean`
  (`PositivityTheory.ThKCT.LineInt`, `PositivityTheory.ThKCT.TwoExp`) and
  `Development/WeilBound/ThetaLifts/LocalTheory/ConeShifts/ArchCone.lean` (`PositivityTheory.ThKG.Loc.Cone.ArchCone`).
  The formal proof states the absolute convergence for `z ≥ 2` in `Development/WeilBound/ThetaLifts/SmallCones/ThetaUniq.lean`
  (`PositivityTheory.ThKCT.TateAbs`).
- (c) *Real places.* With the two hyperbolic pairs in good position and `Re z > 0`, the local cone and dual cone are
  continuous maps between the Schwartz spaces, and they carry polynomial Fock vectors (3.45) of `(X, W)` to polynomial
  Fock vectors of `(X₁, W₁)`.
- (d) *Unramified values.* At a finite place where `E/F`, `μ`, `χ_X`, `χ_W` and `ψ` are unramified (or `E` is split and
  `μ`, `χ_X`, `χ_W` are unramified), with self-dual lattices of `X` and `W` to which `(u₀, u′₀)` and `(x, y)` are adapted,
  the local cone and dual cone (`Re z > 0`) carry the lattice vector to `L(z, μ)` times a nonzero constant (a value of `μ`
  and a power of the residue cardinality, fixed by the ideal of the line `Eu₀` in the lattice) times the lattice vector
  of `(X₁, W₁)`; and `e₀` carries the lattice vector of `(X, W)` to a nonzero multiple of the lattice vector of `(X, W₁)`,
  for the lattice of `W₁` that is the orthogonal complement of the plane in the lattice of `W`.
- (i) *Constant term, first range.* If `X` is anisotropic, or `d` is even and `z₀ = n − d/2 ≥ 1 + r_∞` with `r_∞` the
  largest Witt index of `X` at the real places, then for `Φ` finite under `K_X` at the real places
  `∫_{N_x(F)\N_x(𝔸)} I_{X,W}(Φ)(n h) dn = A₀ + A₁`, where `A₀` transforms under `t` by `χ_X(t)|t|_E^{n/2}` and equals
  `C₀ · I_{X,W₁}(e₀ ω(1, h)Φ)` on the Levi, and `A₁` transforms by `(χ_X/χ_W)(t)|t|_E^{(d−n)/2}`, is `0` if `X` is
  anisotropic, and otherwise equals `C₁ · I_{X₁,W₁}(cone_{χ_W⁻¹, z₀} ω(1, h)Φ)`; all these integrals converge absolutely.
- (ii) *Constant term, second range, regular data.* Let `X` be isotropic, `d` even, `1 − z₀ = 1 + d/2 − n ≥ 2`, `v₁` a
  finite place split in `E` with `χ_{W,v₁}` nontrivial, and `Φ` regular at `v₁` (5.7b(i)). Then the constant term is
  `A₀ + A₁`, with the same two laws, where:
  - `A₁ = C₁ · I_{X₁,W₁}(cone^∨_{χ_W, 1−z₀} ω(1, h)Φ)`, an absolutely convergent integral: the dual cone of a regular `Φ` is
    regular at `v₁` for the pair `(X₁, W₁)` (so is the cone, where it converges), and its Tate integral converges
    absolutely because `1 − z₀ > 1`;
  - `A₀ = C₀ · I_{X,W₁}(e₀ω(1, h)Φ)` on the Levi whenever `e₀ω(1, h)Φ` is regular at `v₁` for the pair `(X, W₁)`.

    *Remark.* The vector `e₀Φ` need not be regular. In general
    `A₀ = C₀ · ∫_{[U(X)]} (θ_{X,W₁}(g; e₀ω(1, h)Φ) − E(g)) dg` with `E` the Eisenstein series of the route,
    `E(g) = Σ_{γ ∈ P′(F)\U(X)(F)} θ_{X₁,W₁}(r₁^{(0)}(ω(γg, h)Φ))`, and, when the pair `(X, W₁)` satisfies the hypotheses
    of 5.7b (iv) at `v₁`, `A₀ = C₀ · I_{X,W₁}(e₀ω(1, h)Φ)` for the invariant extension; these two statements are proved
    by the route below and are not used for the comparison of the two theta integrals of a complementary datum.

  In (i) and (ii), `C₀`, `C₁` are nonzero and depend only on the normalisations of measures. For the two pairs of a
  complementary datum (3.47; `ν = α/β`, `ε₀ = (a − a′)/2`): `(V, W)` has `χ_W = ν⁻¹` and `z₀ = ε₀`, and in the first range
  its second part is `cone_{ν, ε₀}` (the character relation `χ_Wμ = 1`); `(V′, W)` has `χ_W = ν` and `1 − z₀ = ε₀ + 1`, so
  it is in the second range when `V′` is isotropic, its second part is `cone^∨_{ν, ε₀+1}` (the relation `χ_W = μ`), and, when
  `ε₀ > 1` and `ν` is unramified at `v₁` with `ν(ϖ) ≠ 1`, the pair `(V′, W₁)` satisfies the hypotheses of 5.7b(iv) at `v₁`
  (it is the pair of `V′` in the local complementary datum `(V₁, V′, W₁)` at `v₁`, `dim V₁ = a − 2 > a′`), so that
  `A₀ = C₀ · I_{V′,W₁}(e₀ω(1, h)Φ)` with the extended integral.
- (iii) *Persistence of nonvanishing.* If the two laws in (i) are distinct, `I_{X,W₁}` converges and
  `I_{X,W₁}(φ₁) ≠ 0` for some `φ₁`, then `I_{X,W}(Φ) ≠ 0` for some `Φ`.

*Route.* (L): on the first variable `m_X(l)` acts by substitution, so evaluation at `c·u₀` becomes evaluation at
`cl⁻¹·u₀`; on the second factor `m_X(l)` preserves the `u′₀ ⊗ W₁`-coordinate and acts there by `l̄⁻¹`, so by 3.3b in its
left-action form, for the exchanged pair (`χ_W` governing `U(X)`), evaluation at `0` of that coordinate picks up
`χ_W(l̄⁻¹)|l|_E^{(d−2)/2} = χ_W(l)|l|_E^{(d−2)/2}` (`χ_W` is trivial on norms; 3.3b, orthogonal sums (b), for
`m_X(l) ∈ U(⟨u₀, u′₀⟩) × 1` acting on the model of `(X, W₁)`). `m(t, h₁) ∈ U(⟨x, y⟩) × U(W₁)` acts, by 3.3b, orthogonal sums (b), as
the product of its two factors: on the first variable by `χ_X(t)|t|_E^{n/2}` and the substitution `u ↦ t̄u` (3.3b for the plane
`⟨x, y⟩`), and through `ω₁(h₁)` on the second;
`N_x` acts at a point `u` of the line `Eu₀` by Heisenberg translations along `u ⊗ W₁`, which are characters of the
`u′₀ ⊗ W₁`-coordinate, trivial at `0`. The laws of the cones follow by the substitution `l ↦ t̄⁻¹l` (for the dual cone
with the scaling of the Fourier transform), `K_X`-invariance from the invariance of `dk`, and `K_{X₁}`-invariance of
the images because `K_{X₁}` fixes `u₀` and commutes with the `m_X(l)`. (a): `t ↦ r₁^{(t)}(ω(k)Ψ)` is a Schwartz–Bruhat
function of `t` with values in the Schwartz space, continuous in `k`, and the integrals are Tate's zeta integrals with
their functional equation (AutomorphicLFunctionsAndLocalFactors §AL.1). (U): the Iwasawa decomposition writes every `g` as
`u·m_X(l)g₁·k` with `u` in the adelic unipotent radical of `P′`, `g₁ ∈ U(X₁)(𝔸)`, `k ∈ K_X`; the rest (the Haar measure in these
coordinates, `|l|_E^{1−n}` being the inverse modulus of `P′` on `m_X(l)`, and the passage from the absolute bound to the
convergence of the orbit sum): the unfolding is the integration in stages of AdelicAlgebraicGroups §2.2
(*quotient-measure*), first for `|f|` and then for `f`, in the Iwasawa coordinates of AdelicAlgebraicGroups §3.1.
(b): for `Re z` large and `ϕ` on `U(X)(F_v)`
with `ϕ(q·m_X(l)k) = |l|_E^{z₀−z}` (`q ∈ Stab(u₀)`), `J_ϕ(Φ) = ∫_{Stab(u₀)\U(X)} p₁(r₁(ω(g)Φ))ϕ(g) dġ` converges and, in the
coordinates `g = q·m_X(l)k` given by the Iwasawa decomposition at `v` (measure `|l|_E^{1−n} d^×l dk`, the inverse modulus of the stabiliser of `Eu₀`), equals
`p₁(cone_{χ_W⁻¹, z}Φ)` by (L) and `l ↦ l⁻¹`. Replacing `Φ` by `ω(g₀)Φ` replaces `ϕ` by its right translate, whose
restriction to `K_X` is `k ↦ |l(kg₀⁻¹)|_E^{z₀−z}`, entire in `z`; both sides continue meromorphically with the poles of
`L(z, χ_W⁻¹)`, and at `z = z₀` the translate of `ϕ = 1` is `1`. For `z₀ > 0` no continuation is needed. The dual cone by
(a). (c): in good position the vacuum of `(X, W)` is the product of the vacua of the orthogonal blocks; `r₁^{(l)}` of a
polynomial times the vacuum is `e^{−πc|l|²}`, `c > 0`, times a polynomial in `l`, `l̄` whose coefficients are polynomial
Fock vectors of `(X₁, W₁)`, and `∫ l^a l̄^b e^{−πc|l|²} μ(l)|l|^z d^×l` is a value of the Gamma function (or `0`); the Fourier
transform along the line keeps polynomials times Gaussians, and the average over `K_X` keeps the degree. Continuity:
the Schwartz seminorms of `r₁^{(l)}(ω(k)Φ)` are bounded by seminorms of `Φ` uniformly in `k`, with rapid decay in `l`.
(d): `K_X` fixes the lattice vector up to an unramified character, `r₁^{(t)}` of it is the indicator of the lattice of the
line `Eu₀`, as a function of `t`, times the lattice vector of `(X₁, W₁)`, and Tate's unramified computation gives
`L(z, μ)` (for the dual cone, with the Fourier transform of that indicator). (i): Rallis' unfolding (the tower formula
of Kudla–Rallis): the constant term along `N_x` keeps the terms whose first coordinate `u ∈ X(F)` is isotropic; `u = 0`
gives the theta integral of `e₀Φ` for `(X, W₁)`; the nonzero isotropic `u` form one `U(X)(F)`-orbit (Witt), whose sum
unfolds to an integral over `Stab(u₀)(F)\U(X)(𝔸)` (U); the integral over `U(X₁)(F)\U(X₁)(𝔸)` is `I_{X₁,W₁}`, and the remaining
integral is, as in (b), `cone_{χ_W⁻¹, z₀}`, absolutely convergent in the first range. (ii): write the constant term of the
kernel along `N_x` as `θ₀ + θ₁`, `θ₀(g) = θ_{X,W₁}(g; e₀ω(1, h)Φ)` the term `u = 0` and `θ₁` the sum over the nonzero isotropic
`u`. For regular `Φ` the kernel decays rapidly in `g` (5.7b(i)), so `θ₀ + θ₁` is integrable over `[U(X)]` with integral
the constant term. As in (i), `θ₁(g) = Σ_{γ∈P′(F)\U(X)(F)} F(γg)` with `F(g) = Σ_{c∈E^×} θ_{X₁,W₁}(r₁^{(c)}(ω(g, h)Φ))`,
absolutely: `Σ_γ Σ_c |θ_{X₁,W₁}(r₁^{(c)}(ω(γg, h)Φ))|` is bounded by the integral over `[N_x]` of the absolute theta series.
*Poisson summation along the line before unfolding*: `(t, ξ) ↦ r₁^{(t)}(ω(g, h)Φ)(ξ)` is a Schwartz–Bruhat function, and
Poisson summation in `t ∈ 𝔸_E` over `E` (AnalyticNumberTheoryPartII §5.3h) gives `F = D + θ_{X₁,W₁}(r̂₁^{(0)}(ω(g, h)Φ)) − φ`,
`D(g) = Σ_{s∈E^×} θ_{X₁,W₁}(r̂₁^{(s)}(ω(g, h)Φ))`, `φ(g) = θ_{X₁,W₁}(r₁^{(0)}(ω(g, h)Φ))`. *The key point*: `r̂₁^{(0)}` vanishes on
regular data. In type-II coordinates at `v₁` (rows along `Fp₀ ⊕ Fp′₀ ⊕ P₁`, `u₀ = (p₀, λ₀)`, `u′₀ = (p′₀, λ′₀)`, `λ₀` dual to
`p′₀`; columns along `Fx₁ ⊕ Fy₁ ⊕ Q₁`; the mixed model is the partial Fourier transform in the column `x₁`),
`r̂₁^{(s)}Φ(C₁) = ∫ Φ(a, t, A₁ ; −s₂, 0, 0 ; c, 0, C₁) ψ(ts₁) da dc dA₁ dt` (`s = (s₁, s₂)`), so for `s₂ = 0` the row `p′₀`
vanishes and a regular `Φ` gives `0`; this persists for `ω(g, h)Φ`. The same formula proves the support statement: for
`s₂ ≠ 0` a nonzero value needs a matrix of rank `n` with row `p′₀` equal to `(−s₂, 0, 0)`; a relation among the rows of `C₁`
would give a combination of the rows `(c, 0, C₁)` equal to a multiple of that row, so `C₁` has rank `n − 2`, and the
supports in `C₁` of all the `r̂₁^{(s)}(ω(k)Φ)`, `s ∈ E_{v₁}`, `k ∈ K_{X,v₁}`, lie in one compact subset of the full-rank
locus (projections of the compact supports of the `ω(k)Φ`, `K_X` acting at `v₁` by row operations); so the local dual cone
at `v₁` is regular. For the cone the row `p′₀` is `(b, 0, 0)` with `b ≠ 0` on the support. *The dual sum unfolds*:
by (L) and the Fourier transform, `r̂₁^{(s)}(ω(m_X(l))Ψ) = χ_W(l)|l|_E^{d/2}·r̂₁^{(sl)}(Ψ)`, so `Σ_γ D(γg)` is a sum over
`Stab(u₀)(F)\U(X)(F)`, whose integral over `[U(X)]`, with the measure `|l|_E^{1−n}d^×l dk` (U), is
`C₁ · I_{X₁,W₁}(cone^∨_{χ_W, 1−z₀} ω(1, h)Φ)`; the same computation with absolute values (for regular data of `(X₁, W₁)`,
`∫_{[U(X₁)]}|θ_{X₁,W₁}(g₁; Ψ)|dg₁` is at most a seminorm of the archimedean component of `Ψ` for fixed finite components,
5.7b(i); the finite components of `r̂₁^{(l)}(ω(k, h)Φ)` take finitely many values, `s ↦ r̂₁^{(s)}Φ_f` being locally constant with
compact support and `K_{X,f}` acting through a finite quotient, so the bound applies under the integral over `l`, where the
seminorms decay rapidly in `l_∞`; and Tate's integral of a Schwartz–Bruhat majorant converges for exponent `1 − z₀ > 1`) shows that `Σ_γ Σ_s |θ_{X₁,W₁}(r̂₁^{(s)}(ω(γg, h)Φ))|` is
integrable, hence finite for almost every `g`. *The Eisenstein series*: termwise `φ(γg) = D(γg) − F(γg)`, so
`Σ_γ |φ(γg)| ≤ Σ_γ |D(γg)| + Σ_γ |F(γg)| < ∞` for almost every `g`: `E` converges absolutely there, `θ₁ = Σ_γ D(γ ·) − E`, and
`θ₀ − E = (θ₀ + θ₁) − Σ_γ D(γ ·)` is integrable; this gives `A₀` and `A₁`, with no continuation in `z`. *Identification
with the extension*: `J(Ψ) = ∫_{[U(X)]}(θ_{X,W₁}(g; Ψ) − E_Ψ(g)) dg` (`E_Ψ` the series above built from `Ψ`) is defined for
`Ψ = e₀Φ`, `Φ` regular, and for `Ψ` regular at `v₁` for `(X, W₁)`, where `E_Ψ = 0` (`r₁^{(0)}` of full-rank data vanishes)
and `J = I_{X,W₁}`; it is linear and `U(X)(F_{v₁})`-invariant (both terms are right equivariant). At `v₁` these vectors are
the Schwartz functions on the matrices of rank `≥ n − 1` of the pair `(X, W₁)`: `e₀Φ(M₁) = ∫Φ(m | 0 | M₁) dm` vanishes unless
`M₁` has rank `≥ n − 1`, and restriction to the matrices of rank exactly `n − 1` is onto from the `e₀Φ` (take `Φ` supported
near `(m⁰ | 0 | M₁⁰)` with `m⁰` outside the column space of `M₁⁰`). So, with the components away from `v₁` and `h` fixed,
`J − I_{X,W₁}` (the extension of 5.7b(iv)) is an invariant linear form on this space vanishing on the full-rank functions;
it factors through the twisted coinvariants of the stratum of rank `n − 1`, which vanish (5.7b(ii)); so `J = I_{X,W₁}`.
(iii): choose `Φ` with
`e₀Φ = φ₁` (`e₀` is onto); the part `A₀` is recovered from the constant term by a torus translate when the laws differ,
and it is `C₀ I_{X,W₁}(φ₁) ≠ 0`.

(S. Rallis, LNM 1245 (1987); S. Kudla, S. Rallis, Ann. of Math. 140 (1994); J. Tate's thesis for the cone integrals.)
The formal proof states the maps, (L) and (U) in `Development/AbelianVarietyTheory/Definitions/Divisors/CTSmallCone.lean`
(`GlobalTheory.ThK.cone`), `Development/WeilBound/ThetaLifts/SmallCones/ThetaUniq.lean` (`PositivityTheory.ThKCT.Mix2`),
and (i) in `Development/WeilBound/ThetaLifts/SmallCones/ThetaUniq.lean` (`PositivityTheory.ThKCT.GenBig`),
`Development/AbelianVarietyTheory/Definitions/Divisors/CTSmallCone.lean` (`GlobalTheory.ThK.CTBigCone`); (ii) follows from
the formal proof, `Development/WeilBound/ThetaLifts/SmallCones/ThetaUniq.lean` (`PositivityTheory.ThKCT.GenSmall`), and
(c), (d) and (iii) from the formal proof,
`Development/WeilBound/ThetaLifts/LocalTheory/UnramifiedDeterminedBySpherical.lean`
(`PositivityTheory.ThKG.Loc.ConeFacB`), `Development/AbelianVarietyTheory/Definitions/Divisors/CTSmallCone.lean`
(`GlobalTheory.ThK.EvZero`).
*Needs:* 3.3b, 3.45, 3.47, 5.7a, 5.7b; MetaplecticAutomorphicForms §§3.3, 5.1, 5.2, 5.5; AutomorphicFormsOnReductiveGroups §4.1; AdelicAlgebraicGroups §§2.2, 3.1;
AutomorphicLFunctionsAndLocalFactors §§AL.1.2.1, AL.1.3.2 and AL.1.6.1; AnalyticNumberTheoryPartII §§5.3g, 5.3h.

**Checks.**

- `X` anisotropic (for instance definite): only `A₀` occurs, and (iii) applies whenever `n/2` and `(d − n)/2`
  differ or `χ_W` is nontrivial.
- In (ii) the two pieces of `A₀` are not separately integrable: for `X` a hyperbolic plane (`X₁ = 0`) and `dim W₁ ≥ 4`, on the
  Siegel set `|l|_E ≥ c` of `U(X)` the function `θ_{X,W₁}(m_X(l)k; e₀Φ)` is `χ_W(l)|l|_E^{(d−2)/2}·r₁^{(0)}(ω(k)Φ)` up to a
  rapidly decreasing term, against the measure `|l|_E^{−1}d^×l`, and `r₁^{(0)}` need not vanish on regular data (in the
  coordinates of the route, `r₁^{(0)}Φ = ∫Φ(a, 0, A₁ ; b, 0, 0 ; c, 0, C₁)` and the matrix has rank `n` when `b ≠ 0`); nor does
  the orbit integral converge, its integrand tending to `I_{X₁,W₁}(r₁^{(0)}(ω(k, h)Φ))|l|_E^{z₀}` as `l → 0`.
- At the unfolding parameters the laws of (L) are the law of `A₁`: for `μ = χ_W⁻¹`, `(μ^c)⁻¹ = χ_W⁻¹` and
  `n/2 − z₀ = (d − n)/2`; for the dual cone at `(χ_W, 1 − z₀)`, `μ^c = χ_W⁻¹` and `n/2 − 1 + (1 − z₀) = (d − n)/2`.
- For a complementary datum the four parts have laws `β|t|^{a/2}` (first term of `I_V`), `α|t|^{a′/2}` (cone of `I_V`),
  `α|t|^{a′/2}` (first term of `I_{V′}`) and `β|t|^{a/2}` (dual cone of `I_{V′}`): `χ_X/χ_W = α` for `(V, W)` and `β` for
  `(V′, W)`. The exponents are `ε₀ = a − N/2` and `ε₀ + 1 = 1 − (a′ − N/2)`.
- *The Weil operator in place of the translation.* With the integrand `r₁(ω(m_X(l)k, 1)Φ)` against `μ(l)|l|_E^z`, the
  unfolded integral of (i) arises only for `μ = 1` and `z = 1 − n` (the inverse modulus), and that integrand does not
  decay as `|l| → ∞`, its point of evaluation `l⁻¹u₀` tending to `0`; by (L) it is `cone_{χ_W⁻¹, z₀}` after `l ↦ l⁻¹`.
- Averaging over `m_X(ζ) ∈ K_X`, that is `|ζ| = 1` at a real place and `ζ ∈ 𝒪_{E_v}^×` at a finite place (where `K_X` is the
  stabiliser of a lattice to which `(u₀, u′₀)` is adapted): by (L), `cone_{μ,z} = (μχ_W)(ζ)·cone_{μ,z}` and
  `cone^∨_{μ,z} = (χ_Wμ⁻¹)(ζ)·cone^∨_{μ,z}`, so the local cone vanishes identically unless `μχ_W` is trivial on these `ζ`
  (the unit circle at a real place, the units at a finite place), and the dual cone unless `μ = χ_W` there: the character
  relations of (i) are forced on these `ζ` only (for the global cones: `μχ_W`, resp. `χ_Wμ⁻¹`, unramified at every finite place
  and trivial on the unit circles at the real places). At a split finite place
  `|ζ|_E = 1` does not put `m_X(ζ)` in `K_X`: `ζ = (ϖ, ϖ⁻¹)` has `|ζ|_E = 1`, and for `χ_W = 1` (even dimension) and an unramified
  `μ = (λ, λ⁻¹)` with `λ(ϖ)² ≠ 1` one has `μ(ζ) ≠ 1` while the cone of the lattice vector is `L(z, μ)` times a nonzero
  constant (d).
- At a split place, the law `β(t)|t|_E^{a/2}` of the first term of `I_V`, normalised by the modulus `|·|^{(N−1)/2}` of
  the parabolic of type `(1, N − 2, 1)` of `GL_N`, has exponent `a/2 − (N − 1)/2 = −(a′ − 1)/2`: an end of the segment
  `{β|·|^{(a′−1)/2 − j}}` of 3.47.
- The Iwasawa decomposition is needed at the finite places: in the unramified `U(2, 2)` with hyperbolic pairs `(e₁, f₁)`,
  `(e₂, f₂)`, the stabiliser of the lattice `L = 𝒪e₁ + 𝒪f₁ + 𝒪e₂ + ϖ𝒪f₂` (not self-dual) is a maximal compact subgroup that
  preserves `ϖL^# ⊂ L`; a primitive generator of `Ee₂` lies in `ϖL^#` and one of `Ee₁` does not, so the two lines lie in
  different orbits of this subgroup. With `W` a hyperbolic plane (`W₁ = 0`), `χ_W = 1` and `u₀ = e₁`, the cone built with
  this subgroup is a distribution in the first variable supported on the orbit of `E^×e₁`; an isometry exchanging the two
  hyperbolic planes of `X` moves that support, so the cone is not invariant under `U(X)(F_v)`, and (b) fails for it.

### 5.7d Local multiplicity bounds along an adapted line

*Origin:* adapted from Kudla and Rallis (1994), the induction through constant terms: multiplicity at most one along an adapted line for the theta quotients of a complementary datum, and the descent of matching data along the maps of 5.7c, at split, unramified inert and real places.

*Method of the formal proof:* at a split place with `ν` ramified, two maps with the law along the line are compared on the functions of full rank in the columns of `W₁`, where the irreducibility of the induced representation they span and Schur's lemma make them proportional; at unramified places a map equivariant along the line is determined by its value on the lattice vector, by the Iwasawa decomposition and irreducibility; at real places it is determined by its value on a generator of extreme weight, which must go to a line.

Prove the local multiplicity bounds and the descent conclusions below. Let `F` be a local field and `D = (V, V′, W, α, β)` a local complementary datum (3.47)
with local matching data `(Π, p, p′)`. Let `(x, y)` be a hyperbolic pair of `W` (`⟨x, y⟩_W = 1`), `W₁ = ⟨x, y⟩^⊥`, and
`(u₀, u′₀)` a hyperbolic pair of `V′`, `V′₁ = ⟨u₀, u′₀⟩^⊥`; by Witt cancellation `δ⁻¹W₁ ≅ V ⊕ V′₁(−1)`, so that
`D₁ = (V, V′₁, W₁, α, β)` is a local complementary datum; let `(Π₁, p₁, p′₁)` be local matching data for `D₁`. Let
`e₀ : ω → ω_{V,W₁}` and `cone^∨_{ν, ε₀+1} : ω′ → ω′_{V′₁,W₁}` (`ε₀ = (a − a′)/2`) be the local maps of 5.7c, both
`P_x`-equivariant with the law `χ_β(t) = β(t)|t|_E^{a/2}` on the line (5.7c, (L) and Checks), and put `A = p₁ ∘ e₀` and
`B = p′₁ ∘ cone^∨_{ν, ε₀+1}`, maps into `Π₁ ⊗ χ_β`. `A` factors through `Θ`; at a finite place `B` factors through `Θ′`
(5.7c(b): `z₀ = −ε₀`). At a real place everything is on polynomial Fock vectors (5.7c(c)), as maps of
`(𝔭_x, K_W ∩ M_x)`-modules, `M_x` the Levi subgroup of `P_x`; there `Hom_{P_x}` below means `Hom_{(𝔭_x, K_W ∩ M_x)}`, and
the hyperbolic pairs are in good position. The *descent conclusion* for `D` and the two pairs is: there is `c ∈ ℂ^×` with
`A(Φ) = c · B(Φ′)` for all `Φ ∈ ω`, `Φ′ ∈ ω′` with `p(Φ) = p′(Φ′)`. When `a − 2 > a′`, the same is defined for hyperbolic
pairs of `W` and of `V`, with the local complementary datum `D₁ = (V₁, V′, W₁, α, β)`, the maps
`cone_{ν, ε₀} : ω → ω_{V₁,W₁}` and `e′₀ : ω′ → ω′_{V′,W₁}`, the law `χ_α(t) = α(t)|t|_E^{a′/2}`, `A = p₁ ∘ cone_{ν, ε₀}` and
`B = p′₁ ∘ e′₀`; every statement below holds for it with the two sides exchanged (`χ_α` for `χ_β`).

Then:

- (R) *Reduction.* The descent conclusion holds as soon as `A ≠ 0`, `B ≠ 0`, and either `B` factors through `p′` and
  `dim Hom_{P_x}(Θ, Π₁ ⊗ χ_β) ≤ 1`, or `A` factors through `p`, `B` factors through `Θ′` and
  `dim Hom_{P_x}(Θ′, Π₁ ⊗ χ_β) ≤ 1`. Conversely, if `A ≠ 0`,
  the descent conclusion implies that `A` and `B` factor through `p` and `p′` and that `Hom_{P_x}(Π, Π₁ ⊗ χ_β) ≠ 0`.
- (a) *Split places, `ν` ramified.* If `F` is nonarchimedean, `E = F × F`, `ψ` is unramified, `ν` is ramified and `a′ ≥ 2`,
  the descent conclusion holds.
- (b) *Split places, unramified characters.* If `F` is nonarchimedean, `E = F × F`, `α` and `β` are unramified (any `ν`,
  any residue characteristic, any conductor of `ψ`), `a′ ≥ 2`, `V`, `V′` contain unimodular lattices `L`, `L′` and `W` a
  lattice `M` self-dual for `ψ ∘ Tr_{E/F} ∘ ⟨·,·⟩_W`, and `(x, y)` is adapted to `M` and `(u₀, u′₀)` to `L′` (each lattice
  the orthogonal sum of its intersections with the plane and with its complement; no compatibility of `M` with
  `L ⊕ L′` is required), the descent conclusion holds. With `p`, `p′`, `p₁`, `p′₁` normalised by the lattice vectors (3.47),
  `A` and `B` carry the two lattice vectors, which match, to `a₀s₁` and `b₀s₁`, `s₁` the spherical vector of `Π₁`, where
  `a₀ ≠ 0` is the multiple by which `e₀` moves the lattice vector and `b₀` the value of the local dual cone on it, an
  unramified Tate integral, `L(ε₀ + 1, ν)` times a nonzero constant (5.7c(d)); so `c = a₀/b₀`, and `B = c⁻¹A` on matched
  pairs. (For the pairs of `V`: `a₀` is the value of the cone, `L(ε₀, ν)` times a nonzero constant, and `b₀` the multiple of
  `e′₀`.)
- (c) *Unramified inert places.* If `E/F` is unramified quadratic of odd residue characteristic, `α`, `β`, `ψ` are
  unramified, and the lattices and pairs are as in (b) (`M` unimodular for
  `⟨·,·⟩_W`), then `A ≠ 0`, `B ≠ 0` and `dim Hom_{P_x}(X, Π₁ ⊗ χ_β) ≤ 1` for `X = Θ, Θ′, Π`.
- (d) *Real places.* If `F = ℝ`, `a′ ≥ 3` (for the pairs of `V`: `a′ ≥ 1`) and the hypotheses of 3.47b hold for `D` and
  for `D₁`, then `A ≠ 0` and `dim Hom_{P_x}(X, Π₁ ⊗ χ_β) ≤ 1` for `X = Θ, Θ′, Π`.

*Route.* (R): if `B = b ∘ p′` with `b ≠ 0`, then `b ∘ p` is a nonzero element of the line `Hom_{P_x}(Θ, Π₁ ⊗ χ_β)`, which
contains `A ≠ 0`, so `A = c · b ∘ p` with `c ≠ 0`, and `A(Φ) = c · b(p(Φ)) = c · b(p′(Φ′)) = c · B(Φ′)` on matched pairs;
symmetrically in the other case. Conversely, the conclusion forces `A` to vanish on `ker p` (a `Φ` with `p(Φ) = 0` is
matched with `Φ′ = 0`), and `A ≠ 0` then induces a nonzero element of `Hom_{P_x}(Π, Π₁ ⊗ χ_β)`; `B` vanishes on `ker p′`
likewise.
*Nonvanishing at finite places.* `e₀` and `p₁` are onto, so `A ≠ 0`. For `B`, take `Φ′` whose first variable in the
mixed model of 5.7c is supported near `u₀` (away from `0`); on such `Φ′` the dual cone is a nonzero multiple of the cone at
`(ν⁻¹, −ε₀)` (5.7c(a): the local `γ`-factor is finite and nonzero), whose integral is supported near the stabiliser of
`u₀` in `K_X × E^×`, so `cone^∨(Φ′)` is a nonzero multiple of a vector that `r₁` makes arbitrary; `p′₁` is onto. At
the places of (b) and (c), moreover, the local dual cone maps the lattice vector to a nonzero multiple of the lattice
vector of `D₁` (5.7c(d)).
*(a), and (b) when `ν(ϖ) ≠ 1`.* `Θ = Θ′ = Π` and `Θ₁ = Θ′₁ = Π₁` by the irreducibility statement of 3.47 (the same `ν` for
`D₁`), so both factorisations hold. For the multiplicity, Frobenius reciprocity and the geometric lemma
(SmoothRepresentationsOfLocalGroups §SR.2.2 *geometric-lemma*) bound `dim Hom_{P_x}(Π, Π₁ ⊗ χ_β)` by the sum, over the
double cosets of the parabolic subgroup of type `(1, N − 2, 1)` and that of type `(a, a′)`, of the dimensions of the Hom
spaces from the subquotients of the Jacquet module of `Z(Δ_α) × Z(Δ_β)` (notation of §3.47). By the Jacquet modules of
segment representations (LocalFactorsOfTwistsAndTypes §4.1 (iii)) each subquotient carries on the two factors `GL₁`
an end character of one of the two segments; these ends `α_w|·|^{±(a−1)/2}`, `β_w|·|^{±(a′−1)/2}` are pairwise distinct
(`α_w/β_w` is not a real power of `|·|`, and `a′ ≥ 2`), so exactly one subquotient carries `χ_β` (the two ends of the
`β`-segment, 5.7c, Check), and its `GL_{N−2}`-part is `Z(Δ_α) × Z(Δ_β^−) = Π₁`, `Δ_β^−` the segment shortened at both ends,
which is irreducible: the bound is `1`, and (R) applies.
*(b) and (c), multiplicity.* `Θ`, `Θ′` and `Π` are generated by their `K′`-fixed lines (`K′ = Stab(M)`; 3.47, 3.47a)
and `U(W) = P_x K′` (`x` adapted to `M`), so a `P_x`-equivariant map out of one of them is determined by the image of
the `K′`-fixed vector, which is fixed by `K′ ∩ M_x`, a hyperspecial subgroup of the Levi subgroup, and so lies in the
spherical line of `Π₁ ⊗ χ_β` (`χ_β` is unramified). This gives the bound `1` for `X = Θ, Θ′, Π`. In (b) moreover
`Hom_{P_x}(Π, Π₁ ⊗ χ_β) ≠ 0`: `Π = Z(Δ_α) × Z(Δ_β)` (3.47, last Check); `Z(Δ_β)` embeds into the product of its two end
characters and `Z(Δ_β^−)`, in the order in which the trivial character of `GL₂` embeds into `|·|^{−1/2} × |·|^{1/2}`
(Frobenius reciprocity applied to LocalFactorsOfTwistsAndTypes §4.1 (iii)); the product of `Z(Δ_α)` with either end character
is irreducible: if `ν_w ≠ 1`, or `ν_w = 1` and `a ≢ a′ (mod 2)`, no member of `Δ_α` is the end character times `|·|^j`
with `j ∈ {−1, 0, 1}`, and LocalFactorsOfTwistsAndTypes §4.1 (vi) applies; if `ν_w = 1` and `a ≡ a′ (mod 2)` the end
character is a member of `Δ_α` (as `a > a′`), the two segments are nested, hence not linked, and the product is
irreducible by Zelevinsky's criterion in its general form (LocalFactorsOfTwistsAndTypes §4.1 (ii); Zelevinsky 1980,
Theorem 4.2), a case outside the three to which the family otherwise restricts that clause. In either case these factors commute
(LocalFactorsOfTwistsAndTypes §4.1 (iv)); hence `Π` embeds into the representation induced from `χ_β ⊗ Π₁`, and the nonzero
element `b` composed with `p′` spans the line containing `B`, which gives the conclusion by (R). The formal proof does not take
this step: at these places it has the irreducibility of the product of the two unitary determinant characters (`a ≠ a′`)
and the proportionality of two equivariant maps out of `Π` that are proportional on the lattice vector. When `ψ` is ramified,
`M` is replaced by a lattice self-dual for `ψ ∘ Tr ∘ ⟨·,·⟩_W` (a multiple of `M`, with the same stabiliser), for which
5.7c(d) holds (3.47, the bullet on self-dual lattices for every conductor of `ψ`).
*(d).* `Θ` and `Θ′` are generated by their `K_W`-type `La` (3.47b(i)), and `𝔤 = 𝔭_x + 𝔨_W`, so `U(𝔤) = U(𝔭_x)U(𝔨_W)` and `Θ`,
`Θ′`, `Π` are generated by `La` over `𝔭_x`; a map out of one of them is therefore determined by its restriction to the
`La`-part, an element of `Hom_{K_W ∩ M_x}(La, Π₁ ⊗ χ_β)`. With the plane spanned by a positive and a negative line of
`W^♭`, `K_W ∩ M_x = U(1) × U(P_W − 1) × U(Q_W − 1)`, the `U(1)` acting by one scalar on both lines. On `U(P_W)` the
highest weight of `La` is `(s^{Q′}, (s − L₊)^P)`, `s = (Q − P + m_β)/2`, which restricts to `U(1) × U(P_W − 1)` as the sum,
each once, of the types `(s^{Q′−1}, c, (s − L₊)^{P−1})`, `s − L₊ ≤ c ≤ s`, with `U(1)`-weight `2s − L₊ − c` (the branching
rule, ClassicalGroups §6.1); likewise on `U(Q_W)` with `s′ = (P − Q + m_β)/2`, `L₋` and `c′`. By
3.47b(i) for `D₁` (the same `L_±`, `s`, `s′`, with `P′ − 1`, `Q′ − 1` in place of `P′`, `Q′`), the `K_{W₁}`-types of `Π₁` are
`La₁ + Σ_i c̃_i(f_i − e_{P_W−i}) + Σ_j b̃_j(e_j − f_{Q_W−j})`, each once, with
`La₁ = (s^{Q′−1}, (s − L₊)^P) ⊗ (s′^{P′−1}, (s′ − L₋)^Q)`; comparing entries, `b̃ = 0` (the first `Q′ − 1` entries on `U(P_W − 1)`)
and `c̃ = 0` (the last `P` entries), so the only common type is `La₁`, reached for `c = s − L₊`, `c′ = s′ − L₋`, with
`U(1)`-weight `s + s′ = m_β`, the weight of `χ_β`. So the Hom space has dimension at most one for `X = Θ, Θ′, Π`. (For the
pairs of `V`: `c = s`, `c′ = s′`, weight `s + s′ − L₊ − L₋ = m_α`.) When a block of `La` is empty the displayed lists are
replaced by their endpoint: for the pairs of `V′` (`P′, Q′ ≥ 1`) the block of `V₋` is empty when `Q = 0` (for instance
`p = 0`), the `U(Q_W)`-part of `La` is the determinant character `(s′^{P′})`, and its restriction is the single type
`s′^{P′−1}` with `U(1)`-weight `s′`, the value `2s′ − L₋ − c′` of the general formula at the required `c′ = s′ − L₋`; for the pairs
of `V` (`P, Q ≥ 1`) the block of `V′₊` is empty when `P′ = 0` (for instance `q = 0`), the `U(Q_W)`-part is `((s′ − L₋)^Q)`, with the
single restricted weight `s′ − L₋`, the value of the formula at the required `c′ = s′`; likewise on `U(P_W)` when `P = 0` or
`Q′ = 0`. The comparison and the bound are unchanged. The bound for `X = Π` also follows without the
branching rule: `Π` is generated by a vector of the extreme weight killed by the positive compact root vectors, the
vectors of the restricted weight with the same property form a line in `Π₁`, and a map killing the generator is zero.
`A ≠ 0`: with this plane the polynomial Fock space of `(V, W)` is that of `V ⊗ ⟨x, y⟩` tensor that of `(V, W₁)`, and `e₀`
sends the vacuum of the first factor tensor `P₁` to a nonzero multiple of `P₁`; so `e₀` is onto the polynomial Fock
vectors of `(V, W₁)`, and `p₁` is onto.

*Remarks.* (1) At an inert place, by (c) and (R), the descent conclusion is equivalent to the Jacquet condition
`Hom_{P_x}(Π, Π₁ ⊗ χ_β) ≠ 0`; for the local components of global complementary triples this condition, and the
conclusion, are obtained by a global argument, not from a local computation. (2) No statement
here asks whether `Θ` or `Θ′` is irreducible at a real place. (3) At a real place `B ≠ 0` is not proved locally; the
archimedean cone lemma 5.7e is the local input of the global argument that gives it.

(Kudla–Rallis 1994 and Rallis 1987 for the maps; A. Zelevinsky, *Induced representations of reductive p-adic groups
II*, Ann. Sci. ÉNS 13 (1980), Theorem 4.2, p. 184, for the products of segments.)
The descent conclusions follow from the formal proof,
`Development/WeilBound/ThetaLifts/LocalTheory/UnramifiedDeterminedBySpherical.lean` (`PositivityTheory.ThKG.Loc.StdB`),
`Development/WeilBound/ThetaLifts/ConeHypotheses/PolDense.lean` (`PositivityTheory.ThKG.LocB'`).
*Needs:* 3.21a, 3.46, 3.47, 3.47a, 3.47b, 5.7c;
SmoothRepresentationsOfLocalGroups §SR.2.1, §SR.2.2 *geometric-lemma*, *segment-representations*;
LocalFactorsOfTwistsAndTypes §4.1 (ii)–(iv), (vi); ClassicalGroups §6.1.

**Checks.**

- `a′ = 2`, `D₁ = (V, 0, W₁)` at a finite place: `Π₁` is the representation of 3.47 for the datum with `V′₁ = 0`, on which
  `ω′_{0,W₁}` is the character `α̃ ∘ det` of `U(W₁)` (`α̃(x/x̄) = α(x)`; at a split place `α ∘ det` is its square, as on
  `(t, t⁻¹)`), and `B` is the dual cone map onto that character.
- The constant `c` depends on the normalisations of `p`, `p′`, `p₁`, `p′₁`; rescaling `p₁`, `p′₁` by the same scalar leaves
  it unchanged.
- Orientation in (b): at a split place with `ν = 1`, `ε₀ = 2`, unit ideals and standard measures, `a₀ = 1` and
  `b₀ = L(3, ν) = (1 − q^{−3})^{−2}`, so `c = (1 − q^{−3})²`; the value of the dual cone itself is `c⁻¹`.
- (R) needs the multiplicity bound on one side only: if `Θ′ = Π` and `dim Hom_{P_x}(Θ, Π₁ ⊗ χ_β) ≤ 1`, then `B ∘ p′⁻¹ ∘ p`
  spans the line that contains `A`.
- In (R) the converse needs `A ≠ 0`: for `A = B = 0` the conclusion holds with every `c`.
- (c) holds without `a ≡ a′ (mod 2)`.

### 5.7e The archimedean cone lemma

*Origin:* particular to this proof: the nonvanishing at a real place of the cone and of the dual cone of 5.7c composed with a nonzero invariant continuous linear functional, (A) and (B); for every `Re z > 0`, as stated, it is this roadmap's own formulation.

*Method of the formal proof:* by contradiction: Heisenberg translations multiply the integrand of the cone integral by characters of the isotropic vector, so if the composite vanished the integrand would integrate to zero against every Schwartz function of that vector, by Fourier inversion; on the fibre over the base point the law of the functional under the stabiliser makes the integrand a positive multiple of its value at the identity, which is nonzero for a suitable test function, so a bump function at the base point gives a nonzero integral. For the dual cone the same argument is run after a Fourier transform in the scalar variable, with a local functional equation at the complex places proved from a Gaussian test function.

Prove the archimedean cone lemma. Let `F_v = ℝ`, `E_v = ℂ`, `(X, W)` a unitary pair with `X` isotropic and splitting
character `χ_W` of `U(X)`, `(x, y)` and `(u₀, u′₀)` hyperbolic pairs of `W` and `X` in good position (5.7c), `X₁`, `W₁` their
complements, and `cone_{μ,z}`, `cone^∨_{μ,z}` the local cones of 5.7c. Let `ℓ` be a nonzero continuous linear functional
on the Schwartz space of `(X₁, W₁)`, invariant under `U(X₁)(ℝ)`, `μ` the character
`μ(l) = (l/|l|)^m` of `ℂ^×` (every splitting character at a real place, and every quotient of two of them, has this form,
being trivial on `ℝ_{>0}`), and `Re z > 0`.

- (A) If `μχ_W = 1` on the unit circle, then `ℓ ∘ cone_{μ,z} ≠ 0`; it is already nonzero on the Schwartz functions whose
  first variable vanishes near `0`.
- (B) If `μ = χ_W` on the unit circle and `1 − z + |m|/2` is not an integer `≤ 0` (for real `z`: if `2(z − 1) < |m|` this
  holds), then `ℓ ∘ cone^∨_{μ,z} ≠ 0`.

For the two pairs of a complementary datum with `κ = m_α − m_β`, (A) is the pair `(V, W)` with `(μ, z) = (ν, ε₀)` and (B) the
pair `(V′, W)` with `(ν, ε₀ + 1)`, where the condition reads `2ε₀ < |κ|`, implied by `|κ| > a + a′`. The same holds over
`F ⊗ ℝ` (all real places together), by freezing the variables at the other places one at a time.

*The form of the formal proof.* The formal proof has (A) and (B), for every unitary pair over a CM extension as in 3.47
(*The form of the formal proof*), for an integer `z ≥ 1`, a Hecke character `μ` whose infinity types `m_v` are `≤ 0` at
every real place, with `μχ_W = 1` in (A) and with `μ = χ_W`, `−m_v > 2(z − 1)` at every real place in (B), and a
continuous functional on the Schwartz space of `(X₁, W₁)` at all the real places invariant under `U(X₁)(F ⊗ ℝ)`; the
cases that occur are the two of the preceding paragraph. The route below gives (A) and (B) for every `Re z > 0` as
stated, the nonvanishing on data whose first variable vanishes near `0` included, and for a functional invariant under
`K_{X₁}` only. In FormalProof, (A) and (B) are
`Development/WeilBound/ThetaLifts/LocalTheory/ArchimedeanBumps/BumpAOf.lean` (`PositivityTheory.ThKG.Loc.Bump.genA`,
`PositivityTheory.ThKG.Loc.Bump.genB`), stated in the normalisation with `e^{−2πix}` (Conventions), where the
infinity types are `−m_v ≥ 0`.

*Route.* (A). Let `S₀` be the Schwartz functions whose first variable vanishes near `0`; it is stable under `ω(K_X, 1)` and
under the Heisenberg operators `ρ(v ⊗ x)`, `v ∈ X`, which multiply the first variable `u` by the character
`ψ(c₀ Re⟨u, v⟩)` for a fixed real `c₀ ≠ 0`. Suppose `ℓ ∘ cone_{μ,z} = 0` on `S₀`. For `Φ ∈ S₀` put
`F_Φ(k, l) = ℓ(r₁^{(l)}(ω(k)Φ))μ(l)|l|^z` on `G = K_X × ℂ^×`: continuous, zero for `|l|` small, rapidly decreasing in `|l|`,
so integrable. Since `ω(k)ρ(v ⊗ x) = ρ(kv ⊗ x)ω(k)`, `ℓ(cone_{μ,z}(ρ(v ⊗ x)Φ)) = ∫_G ψ(c₀ Re⟨π(k, l), v⟩)F_Φ(k, l)` with
`π(k, l) = k⁻¹l·u₀`. So the Fourier transform of the finite complex measure `π_*(F_Φ dk d^×l)` on the real vector space `X`
vanishes, and the measure is `0` (Fourier uniqueness: the transforms of its real and imaginary parts vanish, by the
symmetry `t ↦ −t`, and Mathlib's `MeasureTheory.Measure.ext_of_charFun` applied to the positive and negative parts of each,
finite measures on a real inner product space, identifies them). The map `π` is the orbit map of `u₀` for the right action `v·(k, l) = k⁻¹lv` of `G`, whose
orbit is the cone of nonzero isotropic vectors (`K_X` is transitive on pairs of vectors of given lengths in the positive and
negative parts, and `u₀` is the sum of two such vectors of equal length); its stabiliser `H = {(m_X(ζ)k₁, ζ) : |ζ| = 1, k₁ ∈ K_{X₁}}` is compact. The push-forward has the continuous density `g ↦ ∫_H F_Φ(hg) dh` on `H\G`, which therefore
vanishes, in particular at `g = 1`. On `H`, by the law (L) of 5.7c and the `K_{X₁}`-invariance of `ℓ`,
`F_Φ(m_X(ζ)k₁, ζ) = (μχ_W)(ζ)·ℓ(r₁(Φ)) = ℓ(r₁(Φ))`. Hence `vol(H)·ℓ(r₁Φ) = 0` for every `Φ ∈ S₀`; but `r₁` maps `S₀` onto the
Schwartz space of `(X₁, W₁)` (take the first variable supported near `u₀`), so `ℓ = 0`.
(B). For `Φ ∈ S₀` the function `t ↦ ℓ(r₁^{(t)}(ω(k)Φ))` is a Schwartz function on `ℂ` vanishing near `0`, so Tate's local
functional equation at the complex place, `∫ f̂(t)μ(t)|t|^z d^×t = γ(1 − z, μ⁻¹, ψ)·∫ f(t)μ⁻¹(t)|t|^{1−z} d^×t`, holds with
both integrals absolutely convergent, and `γ(1 − z, μ⁻¹, ψ) = ε·L(z, μ)/L(1 − z, μ⁻¹)`, `L(s, μ^{±1}) = Γ_ℂ(s + |m|/2)`, is
finite and nonzero under the condition on `z`. So on `S₀`, `ℓ ∘ cone^∨_{μ,z} = γ·ℓ ∘ cone_{μ⁻¹, 1−z}`, and (A) applies to
`(μ⁻¹, 1 − z)` on `S₀` (where no condition on `Re(1 − z)` is needed): `μ⁻¹χ_W = 1` on the unit circle. (Equivalently, in
the other order: translations along `X ⊗ x` shift the variable of the dual cone, and a Fourier transform in that
variable with the same identity of Tate brings it to the fibre argument.)

(J. Tate's thesis for the local functional equation.) *Needs:* 3.45, 5.7c; AutomorphicLFunctionsAndLocalFactors §§AL.1.3.2 and AL.1.4.2;
AnalyticNumberTheoryPartII §5.3g.

**Checks.**

- The character conditions are necessary (5.7c, Checks): without them the cone, resp. the dual cone, vanishes
  identically, and so does `ℓ ∘ cone`.
- `X` a hyperbolic plane (`X₁ = 0`): the Schwartz space of `(0, W₁)` is `ℂ`, `ℓ` is a nonzero scalar, and (A) says that the
  scalar `cone_{μ,z}Φ` is not zero for some `Φ`; with the first variable supported near `u₀` the integrand is concentrated
  near `H`, where it is the constant `r₁(Φ)`.
- In a complementary datum `|κ| > a + a′` gives `|κ| > 2ε₀ = a − a′`; the bound is used only in case (B).

### Examples

For `U(1) × U(1, 1)` over `ℚ`, a cusp form on `U(1)` is a character `μ`, and its theta integral to `U(1, 1)` is a holomorphic or antiholomorphic cusp form, its constant term vanishing by (R3) (5.6a). For `V` anisotropic the theta integral always converges, the quotient being compact, and for split `W` of dimension `2n` Weil's condition is `m − r > n = d(n)`, that of MetaplecticAutomorphicForms §5.7 (5.7a). For `n = 1`, `d = 2`, the full-rank condition at the split place `v₁` says that `Φ_{v₁}` vanishes near `0 ∈ F_{v₁}²` (5.7b). For the two pairs of a complementary datum the four parts of the constant terms have the laws `β|t|^{a/2}` (first term of `I_V`), `α|t|^{a′/2}` (cone of `I_V`), `α|t|^{a′/2}` (first term of `I_{V′}`) and `β|t|^{a/2}` (dual cone of `I_{V′}`) (5.7c). At a split place with `ν = 1`, `ε₀ = 2`, unit ideals and standard measures, `a₀ = 1` and `b₀ = L(3, ν) = (1 − q^{−3})^{−2}`, so `c = (1 − q^{−3})²` (5.7d).

### Dependencies

Layers 3–4; MetaplecticAutomorphicForms §§1.3, 3.2a, 3.3, 5.1, 5.2, 5.5, 5.6, 5.6a, 5.7; AdelicAlgebraicGroups §§2.2, 3.1, 3.4, 3.5; AutomorphicFormsOnReductiveGroups §§2.1, 4.1, 4.2; ArithmeticLocallySymmetricSpaces §ALS.F.6; AutomorphicLFunctionsAndLocalFactors §AL.1; AnalyticNumberTheoryPartII §§5.3g, 5.3h; SmoothRepresentationsOfLocalGroups §§SR.2.1, SR.2.2, *segment-representations*; LocalFactorsOfTwistsAndTypes §4.1; ClassicalGroups §6.1; Mathlib's characteristic functions of finite measures.

## Layer 6: Siegel–Weil, doubling integrals and the Rallis inner product

The Siegel–Weil formula and the Rallis inner product formula in Weil's convergent range, the unramified doubling integral with its region of absolute convergence, the integrability statements of the doubling method with the inner product formula under one integrability hypothesis, and a local doubling integral with a tame twist on a block.

### 6.4a The Siegel–Weil formula in Weil's convergent range

*Origin:* published: Weil (1965), the Siegel–Weil formula in Weil's range `m > 2d(n)` (for unitary pairs: MetaplecticAutomorphicForms §6.4a); Ichino (2007), the range `d(n) < m ≤ 2d(n)` for unitary pairs over a CM extension with polynomial Fock data at the real places, as MetaplecticAutomorphicForms §6.4a states it, and Kudla and Rallis (1988), *On the Weil–Siegel formula II: the isotropic convergent case*, Theorem, p. 66, that range for orthogonal `V` of even dimension (`d(n) = n + 1`) and data finite under a maximal compact subgroup, as Gan, Qiu and Takeda (2014), proof of Proposition 11.1 (ii), credit the two; for symplectic `V` (`d(n) = n − 1`) the range is empty, since `V` is split, `m = 2r`, and `m − r > d(n)` gives `m ≥ 2n > 2d(n)`. The range `d(n) < m ≤ 2d(n)` outside these cases (orthogonal `V` of odd dimension, unitary pairs over other quadratic extensions, other data at the archimedean places), and the Corollary on Fourier coefficients outside the case that [FormalProof] states, are this roadmap's own formulation.

*Method of the formal proof:* for unitary pairs over a CM extension, in the case used: in Weil's range the Eisenstein series is decomposed over Bruhat cells and the theta integral over rank strata, and the two are matched by Siegel's formula for each Gram matrix and Poisson summation over Hermitian matrices; for `d(n) < m ≤ 2d(n)` the nondegenerate Fourier coefficients of the continued Eisenstein series at `s₀` are shown to equal those of the theta integral for polynomial Fock vectors, and a function with only singular coefficients of the archimedean type of the vacuum vector is shown to vanish. The route written here takes instead, for `d(n) < m ≤ 2d(n)`, Ichino's argument by the doubling seesaw and the analytic continuation of both sides.

Prove the Siegel–Weil formula in Weil's convergent range. In the GQT datum of MetaplecticAutomorphicForms §5.7 with `r > 0` and `m − r > d(n)` (the theta
integral converges by MetaplecticAutomorphicForms §5.7), the Siegel Eisenstein series `E(g, s, Φ_φ)` is holomorphic at `s₀`, and
`E(g, s₀, Φ_φ) = c · τ(H)⁻¹ ∫_{[H]} θ(g, h; φ) dh` with the constant and measures of MetaplecticAutomorphicForms §6.4. When
moreover `m > 2d(n)` (Weil's range) the Eisenstein series converges absolutely at `s₀`; for
`d(n) < m ≤ 2d(n)` it is the value of the continuation.

*Route.* Weil's range: compare the two sides as functions of moderate growth with the same Fourier
coefficients, the nondegenerate ones being products of local Siegel densities (Weil65). The remaining
convergent range `d(n) < m ≤ 2d(n)`: Ichino's argument by the doubling seesaw and the analytic continuation of
both sides; GQT credits Ichino 2007 with the Siegel–Weil formula in the convergent range (the proof of GQT
Proposition 11.1 (ii), p. 53), while GQT Theorem 7.1 (p. 33) is the anisotropic case `r = 0` only, which is
MetaplecticAutomorphicForms §6.4. (A. Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, Acta Math.
113 (1965); A. Ichino, *On the Siegel–Weil formula for unitary groups*, Math. Z. 255 (2007).)
The formal proof states the theorem, in the case used, in
`Development/AbelianVarietyTheory/Definitions/LatticeFrames/SiegelWeilFock.lean`
(`GlobalTheory.Core.Rk.IP.SiegelWeilFock`),
`Development/AbelianVarietyTheory/PublishedTheorems/SiegelWeil₂/SiegelWeilUnitarySchrodinger.lean`
(`GlobalTheory.Published.SiegelWeilUnitarySchrodinger`) and, in Weil's range, in
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/WeilSiegelFormulaUnitary.lean`
(`GlobalTheory.Published.WeilSiegelFormulaUnitary`). The formal proof has the case `r = 0` of
MetaplecticAutomorphicForms §6.4, for `V` definite and all `m, n ≥ 1`, with the constant `1` for `n < m` and `2` for `n ≥ m`, in
`Development/WeilBound/ThetaLifts/LatticeBasics/HypothesesS.lean` (`GlobalTheory.ThK.Dbl.SiegelWeilStd`).
*Needs:* 5.7a; MetaplecticAutomorphicForms §§5.7, 6.1, 6.2, 6.4;
AutomorphicLFunctionsAndLocalFactorsPartII §§1.1, 1.3 (for unitary pairs over a CM extension, the Siegel family of the
sections of MetaplecticAutomorphicForms §6.2); AutomorphicSpectralTheory §§1.1–1.4, 2.4, 2.4a.

**Checks.**

- For `r = 0` this is MetaplecticAutomorphicForms §6.4.
- Split binary `V` (`m = 2`, `r = 1`, `n = 1`) is not in the range (`m − r = 1 = d(1)`): the
  regularised MetaplecticAutomorphicForms §6.5 applies instead.

**Corollary.** Let `W_n = Y_n ⊕ Y_n^*` be split skew-Hermitian of dimension
`2n` over a quadratic extension `E/F` of number fields, with trivial splitting character, and `V` Hermitian of
dimension `m` and Witt index `r` with `m − r > n` (`r = 0` allowed). For a Schwartz–Bruhat function `φ` on `V(𝔸)^n`
in the Schrödinger model of the polarisation `(V ⊗ Y_n) ⊕ (V ⊗ Y_n^*)`,
`τ(U(V))⁻¹ ∫_{[U(V)]} θ(g, h; φ) dh = E(g, s₀, Φ_φ)` (the constant is `1`, since `s₀ > 0`; MetaplecticAutomorphicForms §6.4 for `r = 0`). For
nondegenerate `T ∈ Herm_n(E)`, the `T`-th Fourier coefficient of both sides at `g = 1` along the unipotent radical of
the Siegel parabolic subgroup (for the character by which that radical acts on the vectors of the Schrödinger
model supported on `{X : T_X = T}`) is `∫_{X_T(F_∞)} φ_∞ dμ_{T,∞} · ∏_{v<∞} ∫_{X_T(F_v)} φ_v dμ_{T,v}`, with the orbital
integrals of HermitianFormsAndLattices §6.5(a). *Route:* in the Schrödinger model the unipotent radical acts on the
term of `X` in the theta series by a character of `T_X`, so the `T`-th coefficient of the theta integral is
`τ(U(V))⁻¹ ∫_{[U(V)]} Σ_{X ∈ X_T(F)} φ(h⁻¹X) dh`, the mean value of HermitianFormsAndLattices §6.5(a); the identity of
functions is the theorem above.
The formal proof states the Corollary, in the case used, in
`Formalism/UnipotentAdelicQuotients/SiegelWeilUnitaryConvergent.lean`
(`HeckeCharacterZeroLocus.SiegelWeilU.SiegelWeilUnitaryConvergent`),
`Development/AbelianVarietyTheory/PublishedTheorems/SiegelWeil₂/SiegelWeilUnitaryConvergent.lean`
(`GlobalTheory.Published.SiegelWeilUnitaryConvergent`).
*Needs:* the theorem above, MetaplecticAutomorphicForms §6.4; HermitianFormsAndLattices §6.5(a).

### 6.11 The unramified doubling integral and its region of absolute convergence

*Origin:* published: Piatetski-Shapiro and Rallis (1987) and, for unitary groups, Li (1992), the unramified computation of the doubling zeta integral, the values in (b) and (c). (a), the two-variable identity of (c) and the regions of absolute convergence are statements of [FormalProof] ((a); (b) and (c) in the cases used), which counts (c) among its published statements; no published source is recorded for them here.

*Method of the formal proof:* the value of the spherical section at `ι(g, 1)` is computed from the elementary divisors of `g`, by completing the graph lattice to an integral isometry of the doubled lattice; the integral becomes a sum over cosets of the stabiliser of the lattice, the zonal spherical function is replaced by an eigenfunction with the same sums over double cosets, and the sum is evaluated at a split place by counting pairs of lattices through their intersection, with the generating series of the Hecke operators of sublattices and superlattices, and at an inert place by the closed formula for the sum of `X^{ℓ(g)}` against a spherical function. The formal proof has (a), and (b) and (c) in the cases used.

*Corollary of:* MetaplecticAutomorphicForms §§6.10a, 6.11 (the local doubling zeta integral and its value `L_v/d_v` on the standard spherical section), for the values of the doubling integrals in (b) and in (c) at `X_j = χ_j(ϖ)Q^{−(s+n/2)}`.

This target extends MetaplecticAutomorphicForms §6.11, whose local doubling zeta integral takes the value `L_v/d_v` on the designated spherical data, by the value of the spherical section on `G × 1` and by the unramified doubling integral at inert and at split places, with its region of absolute convergence. Prove:

- (a) *The spherical section on `G × 1`.* Let `E_v/F_v` be unramified quadratic (any residue characteristic), `Q` the
  residue cardinality of `E_v`, `V` Hermitian of dimension `n` with a self-dual lattice `Λ`, `V^□ = V ⊕ V(−1)` with the
  lattice `Λ ⊕ Λ`, `P` the stabiliser of the diagonal, `χ` an unramified character of `E_v^×`, and `Φ_s` the spherical section
  of MetaplecticAutomorphicForms §6.10a (with the induced family of MetaplecticAutomorphicForms §6.2; the same lattice
  datum as AutomorphicLFunctionsAndLocalFactorsPartII §2.3): `Φ_s(pk) = χ(det a(p))|det a(p)|_{E_v}^{s+n/2}` for `a(p)` the
  restriction of `p` to the diagonal and `k` in the
  stabiliser of `Λ ⊕ Λ`. Then `Φ_s(ι(g, 1)) = X^{ℓ(g)}` with `X = χ(ϖ)Q^{−(s+n/2)}` and `ℓ(g)` the length of `(Λ + gΛ)/Λ`.
- (b) *Inert places.* For the zonal spherical function `ω_α` of `U(V)` for the stabiliser of `Λ`, with parameter
  `α ∈ (ℂ^×)^{⌊n/2⌋}` (base-change parameter `BC(α)`), the integral `∫_{U(V)} Φ_s(ι(g, 1))ω_α(g) dg` (volume one for the
  stabiliser of `Λ`) converges absolutely when `|χ(ϖ)|Q^{−(Re s+½)}·max(1, |α_i|, |α_i|⁻¹) < 1` for all `i`, that is, for
  `|χ(ϖ)| = 1`, when `Re s + ½ > max(0, max_i|log_Q|α_i||)`, and there it equals
  `L_{E_v}(s + ½, BC(α) ⊗ χ) / ∏_{j=0}^{n−1} L_{F_v}(2s + n − j, χ|_{F_v^×}η^j)`. For a unitary `π_v` with a vector fixed by the
  stabiliser of `Λ` and `|χ(ϖ)| = 1` the domain contains `Re s > (n − 2)/2`. No condition on the residue characteristic.
- (c) *Split places.* For `GL_n(F_v)`, residue cardinality `Q`, `Λ = 𝒪^n` and `ω_α` the spherical function of parameter `α`:
  `Σ_{g ∈ GL_n(F_v)/GL_n(𝒪)} X_1^{len(Λ/(Λ∩gΛ))}X_2^{len(gΛ/(Λ∩gΛ))}ω_α(g) = ∏_{i<n}(1 − Q^iX_1X_2) / ∏_i(1 − Q^{(n−1)/2}α_iX_1)(1 − Q^{(n−1)/2}α_i⁻¹X_2)`, absolutely convergent when
  `Q^{(n−1)/2}|X_1||α_i| < 1` and `Q^{(n−1)/2}|X_2||α_i|⁻¹ < 1` for all `i`; with `X_j = χ_j(ϖ)Q^{−(s+n/2)}`, `χ = (χ_1, χ_2)` on
  `E_v^× = F_v^× × F_v^×`, this is the unramified doubling integral at a split place, absolutely convergent for
  `Re s + ½ > max_i|log_Q|α_i||` when `|χ_j(ϖ)| = 1`, with the value
  `L(s + ½, π ⊗ χ_1)L(s + ½, π^∨ ⊗ χ_2)/∏_{i<n}L(2s + n − i, χ_1χ_2)` (`π` of parameter `α`). Which of the two lattice indices
  carries `χ_1` depends on the identification of the unitary group at the split place with `GL_n` (through one or the other
  factor of `E_v`); the other identification exchanges `X_1` and `X_2`.

The values in (b) and (c) are also those of the unramified unitary doubling formula of
[AutomorphicLFunctionsAndLocalFactorsPartII](../../AutomorphicLFunctionsAndLocalFactorsPartII/README.md) §2.3, stated there in its
right-action convention as `L_E(s + ½, BC(π^∨) ⊗ χ⁻¹)/d_n(s, χ⁻¹)`: its inducing character is `(χ^c)⁻¹` for the `χ`
here, and since `BC(π^∨) = BC(π)^c`, an `L`-factor over `E` is unchanged by conjugation and `d_n(s, χ)` depends only on
`χ|_{F_v^×}`, the two values agree (in split rank one, for a character of `U(1)` with component `β₀` at `w` and
`χ = (χ_w, χ_w̄)` there, its `X = β₀(ϖ)χ_w̄(ϖ)⁻¹Q^{−(s+½)}` is the `αX_1` of (c) for `α = β₀(ϖ)`, `χ_1 = χ_w̄⁻¹`). What this target adds is (a), the two-variable identity of (c) and the regions of absolute convergence.
The formal proof states (a) in
`Development/AbelianVarietyTheory/Proofs/TwistedOperators/SphericalDoublingSectionGraphDiagonalEq.lean`
(`GlobalTheory.UGraph.sphSec_io_diag`),
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/ExistsIsSphSec.lean`
(`GlobalTheory.KerInert.sphSec_inert`), and, in the cases used, (b) in
`Development/WeilBound/ThetaLifts/LatticeBasics/LocUnr.lean` (`GlobalTheory.ThK.Dbl.LocUnrInert`) and (c) in
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/PairwiseDisjointCell.lean`
(`GlobalTheory.Published.UnramifiedDoublingGL`), `Development/WeilBound/ThetaLifts/LatticeBasics/LocUnr.lean`
(`GlobalTheory.ThK.Dbl.LocUnrSplit`),
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/UnramifiedDoublingIntegralTwistedPlaceEigenvecto.lean`
(`GlobalTheory.TwistedZeta.local_zeta_twisted`).

*Route.* (a) `{(y, gy) : y ∈ Λ ∩ g⁻¹Λ}` is the intersection of the graph of `g` with `Λ ⊕ Λ`, a saturated totally isotropic
sublattice of rank `n` of the unimodular lattice `Λ ⊕ Λ` (form `h ⊕ −h`). A saturated Lagrangian of a unimodular lattice
has a Lagrangian complement (lift a dual basis and correct it by elements of the Lagrangian, using that the trace
`𝒪_{E_v} → 𝒪_{F_v}` is onto), so every isomorphism between two saturated Lagrangians extends to an integral isometry;
hence `ι(g, 1)k` preserves the diagonal for some `k` in the stabiliser of `Λ ⊕ Λ`, mapping its lattice onto that of
`Λ ∩ gΛ`, and the value of `Φ_s` is read off the index. (b) Integrals of right-invariant functions are sums over
`U(V)/Stab(Λ)`; after identifying `(V, Λ)` with the standard space and lattice of SmoothRepresentationsOfLocalGroups §SR.4.4
(HermitianFormsAndLattices §§2.1 (a), 4.2 (a)), LocalFactorsOfTwistsAndTypes §3.3 (b) with
`X = χ(ϖ)Q^{−(s+n/2)}` gives the convergence and the value: `y = q^{n−1}X = χ(ϖ)Q^{−(s+½)}`, the factors `1 − yα_i^{±1}` (and
`1 − y` for odd `n`) are those of `L_{E_v}(s + ½, BC(α) ⊗ χ)⁻¹`, and `1 − (−q)^jX = L_{F_v}(2s + n − j, χ|_{F_v^×}η^j)⁻¹`
because `η(ϖ) = −1`. For a unitary `π_v`, LocalFactorsOfTwistsAndTypes §3.4 (ii) gives
`|log_Q|α_i|| ≤ (n − 1)/2`. (c) Replace `ω_α` by the Borel-spherical function `φ_α` (same sums over double cosets). Every
pair `M ⊂ Λ`, `M ⊂ Λ′` of lattices factors uniquely through `N = Λ ∩ Λ′ ⊃ M`, and `Σ_{M ⊂ N} Y^{len(N/M)} = ∏_{i<n}(1 − Q^iY)⁻¹`;
so the left side times `∏_{i<n}(1 − Q^iX_1X_2)⁻¹` is `Σ_{M⊂Λ} X_1^{len(Λ/M)} Σ_{Λ′⊃M} X_2^{len(Λ′/M)}φ_α(Λ′)`; the inner sum is
`φ_α(M)` times the eigenvalue `Σ_k X_2^kQ^{k(n−1)/2}h_k(α⁻¹)` of the superlattice operators, and the outer sum is then
`Σ_m X_1^mQ^{m(n−1)/2}h_m(α)`, by the sublattice counts of the route of LocalFactorsOfTwistsAndTypes §3.4
(i). *Needs:* MetaplecticAutomorphicForms §§6.2, 6.10a, 6.11; AutomorphicLFunctionsAndLocalFactorsPartII §2.3; LocalFactorsOfTwistsAndTypes §§3.3, 3.4;
SmoothRepresentationsOfLocalGroups §SR.4.3 *gln-generators*; HermitianFormsAndLattices §§2.1, 4.2.

**Checks.**

- `n = 1`: `U(V) = U(1)` is compact, `ℓ = 0`, the integral is `1`, and the right side is
  `L_{E_v}(s + ½, χ)/L_{F_v}(2s + 1, χ|_{F_v^×}) = 1` (the factor `1 − χ(ϖ)Q^{−(s+½)}` of the middle entry is `1 − χ(ϖ)q^{−(2s+1)}`).
- `n = 2`, `π_v` trivial (`α = q`): the domain is `Re s + ½ > ½` for `|χ(ϖ)| = 1`, and the value has the factor
  `L_{E_v}(s + ½ − ½, χ) = L_{E_v}(s, χ)`, whose pole at `s = 0` (for `χ = 1`) is the boundary of the domain.
- The normalisation of `Φ_s` must be that of MetaplecticAutomorphicForms §6.10a: in the convention where `p` acts through its restriction to the
  diagonal and the induction is normalised, `|X| < 1` for `Re s` large, as it must be.

### 6.13a The Rallis inner product formula in Weil's convergent range and for anisotropic targets

*Origin:* published: the Rallis inner product formula (Rallis (1984b), for orthogonal–symplectic pairs in Weil's range; Piatetski-Shapiro and Rallis (1987); for unitary pairs Ichino (2007), and Li (1992) and Yamana (2014), the last two cited for `m > 2n` and for an anisotropic target with `m ≤ n`); Gan, Qiu and Takeda (2014), Propositions 11.1 (ii) and 11.2, (i) for `n < m ≤ 2n`, which MetaplecticAutomorphicForms §6.13 states without the holomorphy of the bracket at `s₀`. (ii), with one integrability hypothesis and an arbitrary value of a holomorphic continuation of the `L`-function, is this roadmap's own formulation.

*Method of the formal proof:* the product of the two theta kernels is the theta kernel of the doubled pair on the image of `U(V) × U(V)`, so that, by Fubini for cusp forms, the inner product of the lifts is the doubling integral of the theta integral over `[U(W′)]`; the Siegel–Weil formula (MetaplecticAutomorphicForms §6.4 for `r = 0`, and 6.4a above for `m − r > n`) replaces that integral by the value at `s₀` of the Siegel Eisenstein series, and the doubling integral of the continued Eisenstein series is evaluated at `s₀`.

Prove the Rallis inner product formula in Weil's convergent range and for anisotropic targets. Let `U(V)` (dimension `n`) and `U(W′)` (dimension `m`, Witt
index `r`) form a unitary dual pair over a quadratic extension of number fields, with either `r = 0` (any `m ≥ 1`)
or `m − r > n` (Weil's criterion 5.7a for the theta integral over `[U(W′)]` of the doubled pair). Let `π` be a
cuspidal automorphic representation of `U(V)`, `S` a finite set of places outside which all data are unramified,
`F₁, F₂ ∈ π` factorizable and spherical outside `S`, and `φ₁, φ₂` factorizable with lattice vectors outside `S`.
Put `s₀ = (m − n)/2`, let `χ` be the splitting character attached to `W′` (governing `U(V)`), and let
`θ(F, φ)` be the lift of MetaplecticAutomorphicForms §5.6, `θ(F, φ)(h) = ∫_{[U(V)]} θ(g, h; φ) conj(F(g)) dg`. Write
`L^S(z, BC(π) ⊗ χ⁻¹) = ∏_{w ∉ S} det(1 − α_w(π)χ_w(ϖ_w)⁻¹q_w^{−z})⁻¹` (base-change parameters, places `w` of the
quadratic extension; conjugating the places of the quadratic extension, it equals `L^S(z, BC(π^∨) ⊗ χ)`, since
`BC(π)^c = BC(π)^∨ = BC(π^∨)` and `(χ⁻¹)^c = χ`: it is the doubling function of MetaplecticAutomorphicForms §6.10a for `π^∨` and `χ`, while the function for
`π` and `χ` is `L^S(z, BC(π) ⊗ χ) = L^S(z, BC(π^∨) ⊗ χ⁻¹)`).

- (i) *Anisotropic target, every range.* If `r = 0`, then
  `⟨θ(F₁, φ₁), θ(F₂, φ₂)⟩ = C · [L^S(s + ½, BC(π) ⊗ χ⁻¹)/d^S(s) · ∏_{v ∈ S} Z_v^{conj}(s)]_{s = s₀}`, the bracket
  being holomorphic at `s₀`, where `Z_v^{conj}(s)` is the local doubling integral of MetaplecticAutomorphicForms §6.11 for the section of
  `δ(φ_{1,v} ⊗ φ̄_{2,v})` with the matrix coefficient `conj⟨π_v(g)F_{1,v}, F_{2,v}⟩`, and `C = [E : F]/c`, `c = 1` for
  `s₀ > 0` and `c = 2` for `s₀ ≤ 0`, for Tamagawa measures.
- (ii) *Weil's convergent range.* If `m − r > n`, `F₁` is a Hecke eigenform outside `S`, and for some `s₁ < s₀` the
  function `g ↦ ⟨ω(g)φ₁, φ₂⟩ conj⟨π(g)F₁, F₂⟩ · a(g)^{s₁ − s₀}` is integrable over the elements of `U(V)(𝔸)`
  integral outside `S` (`a` the height of the doubling embedding), then the two theta lifts converge, and for
  every value `l` of a holomorphic continuation of `s ↦ L^S(s + ½, BC(π) ⊗ χ⁻¹)` to `s₀`,
  `⟨θ(F₁, φ₁), θ(F₂, φ₂)⟩ = C · l / d^S(s₀) · ∫ ⟨ω(g)φ₁, φ₂⟩ conj⟨π(g)F₁, F₂⟩ dg`,
  the integral over the elements integral outside `S`, with `C` the constant of MetaplecticAutomorphicForms §§6.1, 6.4 and of 6.4a.
- For the linear lift `F ↦ θ(F̄, φ)` the same statements hold with `π^∨` in place of `π`:
  `L^S(s + ½, BC(π) ⊗ χ)` and the matrix coefficient `⟨π(g)F₁, F₂⟩`.

*Route.* The doubling seesaw identifies the inner product with the doubling integral of the theta
integral of the doubled pair, which is the Siegel Eisenstein value by MetaplecticAutomorphicForms §6.4 (anisotropic `W′`, every range) or
6.4a; unfold (MetaplecticAutomorphicForms §6.12) on a right half-plane, evaluate the unramified places by 6.11 (for the conjugate-linear
lift the matrix coefficient is conjugated, which replaces `π` by `π^∨` in the unramified computation). In (i) the
left side, an integral over `[U(V)]²` of cusp forms against the continued Eisenstein series, is meromorphic in `s`
and holomorphic at `s₀` (the Eisenstein series is holomorphic there by MetaplecticAutomorphicForms §6.4), so uniqueness of continuation gives
the identity at `s₀`. In (ii) the integrability hypothesis gives holomorphy of the `S`-part on `Re s > s₁`, and
continuation identifies the global `L`-factor with `l` at `s₀`.

(Rallis 1984, *Injectivity properties of liftings associated to Weil representations*, §1, Proposition 1.1, pp. 149–150,
there for orthogonal–symplectic pairs in Weil's range; Piatetski-Shapiro–Rallis, LNM 1254 (1987); Ichino 2007; GQT §1.7, p. 3 (the credits for Weil's convergent range),
Propositions 11.1 (ii) and 11.2, p. 53, stated for `n < m ≤ 2n`, and §11.6, p. 54; J.-S. Li 1992 and Yamana 2014 for `m > 2n` and,
with anisotropic target, `m ≤ n`.)
The formal proof states (i), in the cases used, in
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/GlobalFormAniso.lean`
(`GlobalTheory.BottomRallis.GlobalFormAnisoAt`),
`Development/WeilBound/ThetaLifts/LatticeBasics/HodgeTateFromSandwich.lean` (`GlobalTheory.ThK.Dbl.NormZeta`),
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/ThetaKernels/GalTPDefs.lean`
(`UpperTheory.TP.Rallis_k`).
It states (ii) for the linear lift, in the form of 6.13b (iii), with hypotheses that (ii) does not state: `E/F` is a CM
extension; `m = n + t` with `n ≥ 1` and `t ≥ 1`; self-dual lattices of `V` and of `W′` are fixed, and "integral outside
`S`", "spherical outside `S`" and "lattice vectors" refer to them; `S` contains the real places, every place outside `S`
above `2` splits in `E`, and `χ` is unramified outside `S`; `φ₁`, `φ₂` are polynomial Fock vectors at the real places;
`F₁`, `F₂` are cusp forms finite under the maximal compact subgroup at the real places, not assumed to lie in one `π`,
`F₁` a Hecke eigenform outside `S` and `F₂` fixed by the stabilisers of the lattice of `V` outside `S`; and `s₁` is real.
Its conclusion is that both theta integrals converge absolutely, that the two lifts are square-integrable, that
`g ↦ ⟨ω(g)φ₁, φ₂⟩⟨π(g)F₁, F₂⟩` is integrable on the elements integral outside `S`, and the formula, with `C` the volume
of `[U(W′)]`, for arbitrary Haar measures. In the generality stated here (ii) is this roadmap's own, proved by the route below.
*Needs:* 5.7a, 6.4a, 6.11; MetaplecticAutomorphicForms §§5.6,
6.4, 6.10, 6.10a, 6.11, 6.12.

**Corollary.** In either setting, if the `L`-value is finite and nonzero, `d^S(s₀)` is finite and the
`S`-integrals are nonzero for some data, then `θ(F₁, φ₁) ≠ 0`.

**Checks.**

- `n = 1`: `π = μ` a character of `U(1)`, `BC(π) = μ̃`; the lift of MetaplecticAutomorphicForms §5.6 has `L^S(s + ½, μ̃χ⁻¹)` and the linear
  lift `L^S(s + ½, μ̃χ)`; at `s₀` (`s₀ + ½ = m/2`) these are `L^S(m/2, μ̃χ^{∓1})`, the central values `L^S(½, μ̃χ^{∓1})` exactly
  when `m = 1`; they have different absolute values in general (`L(m/2, μ̃χ⁻¹)` is the conjugate of `L(m/2, μ̃⁻¹χ)`, not of
  `L(m/2, μ̃χ)`).
- The identification by conjugation, at a split place in rank one with first components `α_w(π) = χ_w(ϖ) = i` (second
  components their inverses): `BC(π) ⊗ χ⁻¹` and `BC(π^∨) ⊗ χ` have Euler denominator `(1 − X)²`, while `BC(π^∨) ⊗ χ⁻¹` has
  `(1 + X)²`.
- For `m > 2n` and `π` with unramified parameters bounded by `q_w^{(n−1)/2}`, the `L`-value is an
  absolutely convergent Euler product and `l` is its value.
- For `n < m ≤ 2n` and `r = 0` the formula is the instance of MetaplecticAutomorphicForms §6.13 with an empty first-occurrence
  condition; MetaplecticAutomorphicForms §6.13's `L(s + ½, π ⊗ χ_V)` and matrix coefficient are to be read for the lift of MetaplecticAutomorphicForms §5.6 in this form.

### 6.13b Doubling integrability

*Origin:* adapted from the Rallis inner product formula in the convergent range (Rallis (1984b); Li (1992); Ichino (2004), (2007); Yamana (2014); for unitary pairs with `n < m ≤ 2n` and `r ≤ n`, for cuspidal `π` with vanishing lower theta lifts, MetaplecticAutomorphicForms §6.13): the formula (iii) under a single integrability hypothesis on the places of `S`, with the bounds on heights and matrix coefficients (i), (iv) and the flat-family lemma (ii) that serve to verify it. (v) in the generality stated is this roadmap's own formulation.

*Method of the formal proof:* since `0 < H ≤ 1`, integrability of `I_{s₁}` on `G^S_int` for one `s₁ < s₀` makes `s ↦ ∫_{G^S_int} I_s` holomorphic to the right of `s₁`; the identity between the global doubling integral and `L^S(s + ½)/d^S(s)` times this integral, valid for `Re s > n + 1`, is continued to `s₀`, where the global integral has the Petersson product as its value. The published proofs continue every local zeta integral, at the places of `S` as well; the formal proof continues only the partial `L`-function and covers the places of `S` by the one integrability hypothesis.

Notation for this target. `E/F` is a CM extension, `A`, `B` Hermitian spaces of ranks `n ≥ 1` and `n + t`, `t ≥ 1`, with
splitting characters `χ_A`, `χ_B` (`χ_B` governs `U(A)`), `s₀ = t/2`. `A^□ = A ⊕ A(−1)`, `P` the stabiliser of the diagonal in
`U(A^□)`, `ι : U(A) × U(A) → U(A^□)`. For a self-dual lattice `L` of `A` let `K^□` be the product of the stabilisers of `L ⊕ L`
at the finite places and of maximal compact subgroups at the real places stable under the Cartan involution of
`U(A) × U(A)`; the *height* is `h(pk) = |det(p | diagonal)|_{𝔸_E}` (`p ∈ P(𝔸)`, `k ∈ K^□`) and `H(g) := h(ι(g, 1))` for
`g ∈ U(A)(𝔸)`; `H_∞` is the product of the local heights at the real places. For a finite set `S` of places containing
the real ones, `G^S_int` is the set of `g ∈ U(A)(𝔸)` whose component at every place outside `S` stabilises `L`. For cusp
forms `u` on `U(A)` and data `Φ`: `Θu(h) := ∫_{[U(A)]} θ(g, h; Φ)u(g) dg` (linear in `u`), `⟨·,·⟩` the Petersson products
(conjugate-linear in the second variable), `R(g)` right translation, and
`I_s(g) := ⟨ω(g, 1)Φ₁, Φ₂⟩·H(g)^{s − s₀}·⟨R(g)u₁, u₂⟩`.

Prove:

- (i) *Height and sections.* (a) Every `K^□`-finite section `Φ` of the degenerate principal series `I(s, χ)` of `U(A^□)`
  satisfies `|Φ(x)| ≤ C·h(x)^{Re s + n/2}`. (b) `H` is continuous, `0 < H ≤ 1`, `G^S_int` is open, and on `G^S_int` the height
  `H` is the product of the local heights at the places of `S`. (c) For polynomial Fock vectors `P`, `Q` at the real
  places there is `C` with `|⟨ω(g, 1)P, Q⟩| ≤ C·H_∞(g)^{(n + t)/2}` for `g ∈ U(A)(F_∞)`.
- (ii) *A flat family.* Let `(X, μ)` be a measure space, `f : X → ℂ` and `a : X → (0, 1]` measurable, `s₀, s₁ ∈ ℂ`. If
  `f·a^{s₁ − s₀}` is integrable, then `f·a^{s − s₀}` is integrable for `Re s ≥ Re s₁`, with integrals converging absolutely
  and locally uniformly there, and `s ↦ ∫f·a^{s − s₀} dμ` is holomorphic on `Re s > Re s₁` and continuous on `Re s ≥ Re s₁`.
- (iii) *The inner product formula with one integrability hypothesis.* This is 6.13a (ii) for the linear lift, in the
  following form. Let the Witt index of `B` be `0` or less than `t`; let `L_A`, `L_B` be self-dual lattices and `S` a finite
  set of places containing the real ones such that every place outside `S` above `2` splits in `E`, `χ_B` is unramified
  outside `S` and `Φ₁`, `Φ₂` are polynomial Fock vectors at the real places and the lattice vectors of `L_A ⊗ L_B` outside
  `S`; let `u₁`, `u₂` be cusp forms on `U(A)`, finite under the maximal compact subgroup at the real places, `u₁` a Hecke
  eigenform outside `S` generating `π`, `u₂` fixed by the stabilisers of `L_A` outside `S`. If `I_{s₁}` is integrable on
  `G^S_int` for one real `s₁ < s₀`, then both theta integrals converge absolutely, `Θu₁` and `Θu₂` are square-integrable on
  `[U(B)]`, `g ↦ ⟨ω(g, 1)Φ₁, Φ₂⟩⟨R(g)u₁, u₂⟩` is integrable on `G^S_int`, and for every value `l` at `s₀` of a holomorphic
  continuation of `s ↦ L^S(s + ½)`, where `L^S(z) = ∏_{v ∉ S} ∏_{w | v} ∏_β (1 − β·χ_B(ϖ_w)⁻¹·N(w)^{−z})⁻¹`, `β` running
  over the Hecke parameters of `u₁` at `w` for right translation (base-change parameters at inert places), the Weil
  representation being normalised as in 4.4a for the pair on `Hom(A, B)` (at a split place, with `U(A)(F_v) ≅ GL_n(F_v)`
  through the factor `w`, `g` multiplies the functional `φ ↦ φ(0)` by a positive multiple of `χ_{B,w}(det g)⁻¹`):
  `⟨Θu₁, Θu₂⟩ = vol([U(B)])·(l/d^S(s₀))·∫_{G^S_int} ⟨ω(g, 1)Φ₁, Φ₂⟩·⟨R(g)u₁, u₂⟩ dg`,
  where `d^S(s) = ∏_{v ∉ S} ∏_{i=0}^{n−1} L_v(2s + n − i, η^{n+t+i})`, the measures on `U(A)(𝔸)` and `U(B)(𝔸)` are arbitrary Haar
  measures, the inner product on the left and `vol([U(B)])` are taken for the second, and the inner product of the data
  is that of 6.13a.
- (iv) *The real places.* If `c` is an integrable function on `U(A)(F_∞)` and `P`, `Q` are polynomial Fock vectors, then
  `g ↦ ⟨ω(g, 1)P, Q⟩·c(g)·H_∞(g)^{s − s₀}` is integrable on `U(A)(F_∞)` for every real `s ≥ −n/2`.
- (v) *Support at a split place.* Let `v` be a finite place split in `E`, so that the Weil representation at `v` is the
  type-II model on `S(M_{(n+t)×n}(F_v))` with `U(A)(F_v) ≅ GL_n(F_v)` acting by substitution `x ↦ xg` up to a character and a
  modulus (3.21a). If `φ` is supported on matrices whose upper `n × n` block lies in one coset `hK₁` of an open subgroup
  `K₁ ⊂ GL_n(F_v)`, then `⟨ω(g, 1)φ, φ⟩ = 0` for `g ∉ K₁`.

*The form of the formal proof.* The formal proof has (v) in one instance only (FormalProof,
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/SmallVectorCoefficientVanishesOffPrincipalLevelStatement.lean`
(`GlobalTheory.T.smallVector_coefficient_vanishes_off_principalLevel`)); in the generality stated (v) is this
roadmap's own, proved by the route below.
The formal proof states (i) in `Development/AbelianVarietyTheory/Definitions/Foundations/T2SpaceAdeleRing.lean`
(`GlobalTheory.Doubling.HasIwasawa.exists_norm_le`),
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/DoubledLatticeHeightFunProperties.lean`
(`GlobalTheory.Core.Rk.IP.hgtL_props`),
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/RealMatrixCoeffFockVectorsLeDoublingHeightPow.lean`
(`GlobalTheory.TwBound.tw_bound`), (ii) in
`Development/AbelianVarietyTheory/BlockTheory/TorsionBlocks/FlatZetaIntegral.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.FlatZetaIntegral.FlatZetaHolomorphic`) and (iii) in
`Development/AbelianVarietyTheory/Definitions/LatticeFrames/IntegrandSZero.lean` (`GlobalTheory.Core.Rk.IP.HeckeForm`).

*Route.* (i): (a) from the Iwasawa decomposition `U(A^□)(𝔸) = P(𝔸)K^□` and the compactness of `K^□`; (b) at a finite place
the local height of `ι(g, 1)` is `Q^{−ℓ(g)}`, `ℓ(g)` the length of `(L + gL)/L` (6.11 (a)), which is `1` exactly on the
stabiliser of `L`; the bound `≤ 1` at the real places is not routed here; (c) the
function `g ↦ ⟨ω(g, 1)P, Q⟩` is the restriction to `ι(g, 1)` of the Siegel–Weil section of `P ⊗ conj Q`, a `K^□`-finite
section at `s₀`, and `s₀ + n/2 = (n + t)/2`. (ii): dominated convergence, with `a^{Re s − Re s₁} ≤ 1`; holomorphy by
differentiation under the integral on `Re s > Re s₁`, where `a^{δ}|log a|` is bounded. (iii): 6.13a (ii), whose route
supplies, on `Re s > n + 1`, `∫_{U(A)(𝔸)} I_s = L^S(s + ½)/d^S(s)·∫_{G^S_int} I_s` (6.11 for bounded spherical
coefficients) and the value of the left side at `s₀` by continuation; (ii) continues the right-hand integral to
`Re s > s₁`. (iv): by (i)(c), `|⟨ω(g, 1)P, Q⟩|·H_∞^{s − s₀} ≤ C·H_∞^{s + n/2} ≤ C`. (v): the coefficient is a scalar times
`∫φ(xg)·conj φ(x) dx`; if `x` and `xg` both lie in the support then `g ∈ (hK₁)⁻¹hK₁ = K₁`. (Piatetski-Shapiro–Rallis 1987;
Rallis 1984 (*Injectivity properties*, §1); J.-S. Li 1992; Ichino 2004, 2007; Yamana 2014.)

**Checks.**

- `n = 1`: `U(A) = U(1)` is compact, `H = 1` on the lattice stabilisers, and (iii) for `u₁ = u₂ = μ` reads
  `‖Θμ‖² = vol([U(B)])·L^S((1 + t)/2)/L^S(1 + t, η^{t+1})·∫_{G^S_int} ⟨ω(g, 1)Φ₁, Φ₂⟩μ(g) dg`, with `L^S` the product of
  (iii) for the Hecke parameters of `μ`, the instance `n = 1` of 6.13a; at a split place the local integral is Tate's.
- (ii) with `X` a point: `s ↦ f·a^{s − s₀}` is entire; with `a = 1`: the statement is that `∫f` exists.
- (iv) at `s = s₀ − t/2 − n/2 = −n/2`: the bound of (i)(c) is exactly cancelled, and the integrand is dominated by `C|c|`.
- (v) for `n = 1`, `φ = 1_{(1 + 𝔭^c) × 𝔭^c × ⋯ × 𝔭^c}`: `x₁ ∈ 1 + 𝔭^c` and `x₁g ∈ 1 + 𝔭^c` force `g ∈ 1 + 𝔭^c`.

### 6.13c Local doubling integral with a tame twist on a block

*Origin:* particular to this proof: a test vector carrying a tamely ramified character on a block, whose coefficient and local doubling integral reduce to the zonal spherical function and the unramified doubling integral of the complementary block `GL_N(k)` (6.11 (c)); for `N` not of the form `l·t` of the paragraph *The form of the formal proof* the statement is this roadmap's own formulation.

*Method of the formal proof:* the coefficient `c` transforms under `𝒫` on both sides by `ξ(det j₂₂)`, vanishes off the double cosets `𝒫·diag(1_r, ϖ^e)·𝒫` and is computed on them; the coefficient of a generic vector, restricted to the lower block, is a Hecke eigenfunction and so a multiple of the zonal spherical function of `GL_N(k)`; a function `ζ` is built from that function on each double coset, and its integral against the power of the height reduces, by the volumes of the double cosets, to the unramified doubling integral of `GL_N(k)`, whose value the formal proof takes as an input.

Let `k` be a nonarchimedean local field of characteristic `0`, `𝔭` its maximal ideal, `q` its residue cardinality, `ϖ` a
uniformiser. Let `r, t, N ≥ 0`, `a = r + N`, `b = r + N + t`, and write matrices of `G = GL_a(k)` in blocks of sizes `(r, N)`.
Let `𝒫 = {j ∈ GL_a(𝒪) : j₂₁ ≡ 0 mod 𝔭}`, with the Haar measure of `G` for which `vol(𝒫) = 1`. Let `ξ` be a unitary character
of `k^×` that is trivial on `1 + 𝔭` and nontrivial on `𝒪^×` (tamely ramified and ramified: conductor exponent one), `μ₀`
a unitary unramified character, and let `GL_a(k)` act on `S(M_{b×a}(k))` by the type-II Weil representation with the
character `μ₀ξ`: `ω(g)Φ(x) = (μ₀ξ)(det g)|det g|^{b/2}Φ(xg)`. The *test vector* is `φ_ξ(x) = ξ(det x₁₁)⁻¹` for integral `x`
whose upper-left `r × r` block `x₁₁` is invertible over `𝒪` and whose lower-left block (below `x₁₁`) is `≡ 0 mod 𝔭`, and
`φ_ξ(x) = 0` otherwise; `c(g) := ∫ω(g)φ_ξ·conj φ_ξ` for the measure giving `M_{b×a}(𝒪)` volume one. Let `H` be the function
on `G` that is bi-invariant under `GL_a(𝒪)` with `H(diag(ϖ^{e_1}, …, ϖ^{e_a})) = q^{−Σ|e_i|}`. For a representation `π` of `G`
on a complex vector space, a vector `x` is *generic with parameters* `α = (α_1, …, α_N) ∈ (ℂ^×)^N` if `π(j)x = ξ(det j₂₂)x`
for `j ∈ 𝒫` and, for `0 ≤ m ≤ N` and `d_m = diag(1_{a−m}, ϖ1_m)`,
`Σ_j ξ(det j₂₂)⁻¹π(j d_m)x = q^{(rm + m(N − m))/2}·(μ₀ξ)(ϖ)^m·e_m(α)·x`, the sum over representatives `j` of `𝒫/(𝒫 ∩ d_m𝒫d_m⁻¹)`
(and likewise for every diagonal matrix with `m` entries `ϖ` in the lower block); a linear form `ℓ` has the *cotype* if
`ℓ(π(j)y) = ξ(det j₂₂)ℓ(y)` for `j ∈ 𝒫` and all `y`.

Prove that `c(1) ≠ 0` and that the function `ζ` on `G` defined by
`ζ = q^{−((r + b)/2)Σ|e_i|}·ω_α(ϖ^e)` on `𝒫·diag(1_r, ϖ^{e_1}, …, ϖ^{e_N})·𝒫`, `e_1 ≥ ⋯ ≥ e_N`, and `ζ = 0` elsewhere, where `ω_α` is the
zonal spherical function of `GL_N(k)` with Satake parameters `α`, has the following properties:

- (i) `conj c(g)·ℓ(π(g)x) = conj c(1)·ζ(g)·ℓ(x)` for all `g ∈ G`, every `π`, every `x` generic with parameters `α` and every
  `ℓ` of the cotype; and `ζ = 1` on `𝒫`;
- (ii) if `q^{−ρ} ≤ |α_j| ≤ q^{ρ}` for all `j`, then `ζ·H^{s − t/2} ∈ L¹(G)` for `Re s > ρ − ½` and
  `∫_G ζ·H^{s − t/2} dg = ∏_{j}(1 − α_jq^{−(s+½)})⁻¹·∏_{j}(1 − α_j⁻¹q^{−(s+½)})⁻¹·∏_{i=1}^{N}(1 − q^{−(2s+i)})`.

*The form of the formal proof.* The formal proof states this target for `N = l·t` with `l ≥ 0` an integer (FormalProof,
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/UnramifiedDoublingIntegralTwistedPlaceEigenvecto.lean`
(`GlobalTheory.TwistedZeta.local_zeta_twisted`)), so that `a = r + l·t` and `b = r + (l + 1)·t` (for `t = 1`, every `N`);
it asserts that a function `ζ` with (i) and (ii) exists, without naming it, and takes the value of the unramified doubling
integral of `GL_N(k)` (6.11 (c)) as an input. For `N` not of this form the statement is this roadmap's own, proved by the
route below, which uses no relation between `N` and `t`.

*Route.* (1) `c(jgj′) = ξ(det j₂₂)ξ(det j′₂₂)c(g)` for `j, j′ ∈ 𝒫`, from the transformation of `φ_ξ`; `c(1) = ‖φ_ξ‖² > 0`. (2) `c`
vanishes outside the double cosets `𝒫·diag(1_r, ϖ^e)·𝒫`: on the support the upper block of `g` is a unit matrix up to
`𝒫`, because `ξ` is trivial on `1 + 𝔭` and nontrivial on `𝒪^×`. (3) `c(diag(1_r, ϖ^e)) = (μ₀ξ)(ϖ)^{Σe_i}·c(1)·q^{−(b/2)Σ|e_i|}`.
(4) For `x` generic and `ℓ` of the cotype, `m ↦ ξ(det m)⁻¹ℓ(π(diag(1_r, m))x)·H(diag(1_r, m))^{−r/2}` is bi-invariant under
`GL_N(𝒪)` and an eigenfunction of the spherical Hecke algebra of `GL_N(k)`, hence its value at `1` times the zonal
spherical function of parameters `α·μ₀(ϖ)` (the twisted Hecke operators of `x` are the Hecke operators of `x` in
`π ⊗ ξ⁻¹∘det₂₂`, which divides the parameters `α·(μ₀ξ)(ϖ)` by `ξ(ϖ)`); so
`ℓ(π(diag(1_r, ϖ^e))x) = (μ₀ξ)(ϖ)^{Σe_i}·q^{−(r/2)Σ|e_i|}·ω_α(ϖ^e)·ℓ(x)`, and with (3) and `|μ₀ξ| = 1` this gives (i). (5) `ζ·H^{s − t/2}` is bi-invariant under `𝒫`,
`vol(𝒫·diag(1_r, ϖ^e)·𝒫) = q^{rΣ|e_i|}·vol(GL_N(𝒪)ϖ^eGL_N(𝒪))`, and the exponents add up to
`r − (r + b)/2 − (s − t/2) = −(N/2 + s)`: the integral is `Σ_e vol(GL_N(𝒪)ϖ^eGL_N(𝒪))·q^{−(N/2 + s)Σ|e_i|}·ω_α(ϖ^e)`, the unramified
doubling integral of `GL_N(k)` (6.11 (c) with `χ₁ = χ₂ = 1`), absolutely convergent for `Re s > ρ − ½`. No publication is
cited for this target: the route above is its proof.

**Checks.**

- `N = 0`: `ζ = 1_𝒫`, the integral is `vol(𝒫) = 1`, and the right side is the empty product: the Satake parameters of
  the upper block never enter.
- `r = 0`: `𝒫 = GL_N(𝒪)`, `φ_ξ = 1_{M_{b×N}(𝒪)}`, a generic `x` is a spherical vector of `π ⊗ ξ⁻¹∘det` with Satake parameters
  `α·μ₀(ϖ)`, `ζ(ϖ^e) = q^{−(b/2)Σ|e_i|}ω_α(ϖ^e)`, and (ii) is 6.11 (c) for `χ₁ = χ₂ = 1`, the factor
  `H^{s − t/2}·q^{−(b/2)Σ|e_i|} = q^{−(s + N/2)Σ|e_i|}` being the spherical section; the unitary characters have cancelled
  between `conj c` and `ℓ(π(·)x)`.
- `N = 1`, any `t`, `α = q^{ρ}`: the series is `Σ_{e ∈ ℤ} q^{−(½ + s)|e|}α^{e}`, convergent exactly for `Re s > ρ − ½`, with sum
  `(1 − q^{−(2s+1)})/((1 − αq^{−(s+½)})(1 − α⁻¹q^{−(s+½)}))`: the range of (ii) is sharp.

### Examples

Split binary `V` (`m = 2`, `r = 1`, `n = 1`) is not in the range of 6.4a (`m − r = 1 = d(1)`); the regularised MetaplecticAutomorphicForms §6.5 applies instead (6.4a). For `n = 1` the group `U(V) = U(1)` is compact and the unramified doubling integral is `1`, as is `L_{E_v}(s + ½, χ)/L_{F_v}(2s + 1, χ|_{F_v^×})`; for `n = 2` and `π_v` trivial the domain of absolute convergence is `Re s + ½ > ½` when `|χ(ϖ)| = 1`, and the pole of `L_{E_v}(s, χ)` at `s = 0` (for `χ = 1`) is its boundary (6.11). For `n = 1` and `u₁ = u₂ = μ` the inner product formula of 6.13b (iii) reads `‖Θμ‖² = vol([U(B)])·L^S((1 + t)/2)/L^S(1 + t, η^{t+1})·∫_{G^S_int} ⟨ω(g, 1)Φ₁, Φ₂⟩μ(g) dg`, with `L^S` the product of 6.13b (iii) for the Hecke parameters of `μ` (6.13b). For `N = 1` and `α = q^{ρ}` the series of 6.13c (ii) is `Σ_{e ∈ ℤ} q^{−(½ + s)|e|}α^{e}`, convergent exactly for `Re s > ρ − ½`, with sum `(1 − q^{−(2s+1)})/((1 − αq^{−(s+½)})(1 − α⁻¹q^{−(s+½)}))`, and for `N = 0` the integral is `vol(𝒫) = 1` (6.13c). For `n = 1` and `π = μ` a character of `U(1)`, the lift has `L^S(s + ½, μ̃χ⁻¹)`, whose value at `s₀` is `L^S(m/2, μ̃χ⁻¹)`, a central value exactly when `m = 1` (6.13a).

### Dependencies

Layer 5 (5.7a); MetaplecticAutomorphicForms §§5.6, 5.7, 6.1, 6.2, 6.4, 6.4a, 6.5, 6.10, 6.10a, 6.11, 6.12, 6.13; AutomorphicLFunctionsAndLocalFactorsPartII §§1.1, 1.3, 2.3; AutomorphicSpectralTheory §§1.1–1.4, 2.4, 2.4a; HermitianFormsAndLattices §§2.1, 4.2, 6.5; LocalFactorsOfTwistsAndTypes §§3.3, 3.4; SmoothRepresentationsOfLocalGroups §§SR.4.3, SR.4.4.

## Downstream consumers

The theta lifts between definite unitary groups of [ThetaLiftsForDefiniteUnitaryGroups](../ThetaLiftsForDefiniteUnitaryGroups/README.md) rest on these statements: bump vectors, the unramified correspondence, the Fock model and compact dual pairs, local matching and its descent along adapted lines, the global Weil representation, convergence and constant terms of theta integrals, the Siegel–Weil formula and the unramified doubling integral.

The theta-chain roadmaps of this family use them as well. [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) uses the global Weil representation 4.4a for the homomorphism pair of a step, and reads that pair at a real place as a pair of 3.46a in the normalisation of its paragraph *Other normalisations*, with the passage to the dual space and to the contragredient of the integrated member stated there. [RowTowerAndRallisIdentities](../RowTowerAndRallisIdentities/README.md) exhibits, for consecutive members of its row tower at each real place, the data of 3.46a (the lists, the case and the gap hypothesis) and uses 3.46a (a), (c2) and (e) for descents and (b), (c1) and (e) for up-lifts, with the joint harmonic of 3.46a (d); 5.6a for the type and cuspidality of descents and up-lifts; the inner product formula 6.13a (ii) with 6.13b (i), (ii), (iv) and (v) for its bounds, its continuation and the support of its vectors at the split places; and 6.13c at the places of a tame twist, with `N` a multiple of the difference of ranks `t`. [SeesawForThetaChains](../SeesawForThetaChains/README.md), [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md) and [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md) use statements of Layers 3–6 as well.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns, for unitary dual pairs (in the form stated here; the general theorems of which clauses are corollaries are listed under *Not owned here*): the left-action form of the Siegel-parabolic normalisation of the Weil representation and the compatibility of the splittings with orthogonal sums (3.3b); persistence, the stable range and bump vectors (3.9a); the unramified correspondence in the inert and the split case (3.21a); the Fock model, the Bargmann transform of tempered distributions and the infinitesimal Weil representation (3.45); the theta correspondence of compact dual pairs (3.46) and of discrete series with both members non-compact on an explicit Fock module of the determinant-square-root covers, with non-occurrence below first occurrence, multiplicity one, the zeta integral of the joint harmonic and, for an integrable lowest-type coefficient, its value and isometric occurrence (3.46a); local complementary data, local matching at split, unramified inert and real places, irreducibility of the theta quotients at split places and the Casimir gap lemma (3.47–3.47b); three lemmas on functionals at a split place (3.47c); the global Weil representation of a unitary pair with its Siegel-parabolic normalisation, its split law and its characterisation (4.4a); theta integrals of cusp forms of discrete-series type under three local hypotheses at the real places (5.6a); Weil's convergence criterion for unitary pairs with the matrix-coefficient majorant (5.7a); regularised convergence at a split place, archimedean vanishing and the invariant extension (5.7b); constant terms of theta integrals along an isotropic line, with the cone maps, their laws, unfolding, duality, unramified values and persistence of nonvanishing (5.7c); local multiplicity bounds along an adapted line (5.7d); the archimedean cone lemma (5.7e); the Siegel–Weil formula in Weil's convergent range with its corollary on Fourier coefficients (6.4a); the unramified doubling integral at inert and split places with its region of absolute convergence (6.11); the Rallis inner product formula in Weil's convergent range and for anisotropic targets (6.13a); the height of the doubled group, a flat family of integrals, the inner product formula under one integrability hypothesis, integrability at the real places and the support of Weil coefficients at a split place (6.13b); and the local doubling integral with a tame twist on a block (6.13c).

Not owned here. The targets 3.3b and 6.11 extend MetaplecticAutomorphicForms §§3.3b and 6.11: the comparison of the Hermitian Weil operators of four sources with Layer 2 of that roadmap, and the local doubling zeta integral with its unramified value `L_v/d_v`, belong to that roadmap, the unramified value also to AutomorphicLFunctionsAndLocalFactorsPartII §2.3, and this roadmap owns only the statements it adds to them. [MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md) owns the theory these targets extend: Heisenberg groups and Schrödinger models (Layer 0), Stone–von Neumann and the oscillator normalizer (Layer 1), the metaplectic cover and the Weil representation with its local unramified splitting (Layer 2), the unitary dual-pair splittings, split étale Hermitian spaces, theta modules, the type-II input, Howe duality and the unramified parameters (Layer 3), the adelic cover and the adelic Weil representation (Layer 4), theta kernels, global theta lifts and Weil's criterion for split `W` (Layer 5), and the Siegel–Weil formula, the doubling method and the Rallis inner product formula in the ranges stated there (Layer 6). The general theorems of which sections here are corollaries, in the clauses that their `*Corollary of:*` lines name, belong to MetaplecticAutomorphicForms as well: §3.3d (3.3b), §3.9a (3.9a), §§1.5 and 2.5a (3.45), §3.7a (3.46), §5.6a (5.6a) and §§6.10a, 6.11 (6.11); its §§3.22a, 5.7, 6.4a and 6.13 state the published cases of 3.21a, of 5.7a (split `W`), of 6.4a (unitary pairs) and of 6.13a (i) (`n < m ≤ 2n`, without the holomorphy of the bracket at `s₀`). Smooth representations, induction, Jacquet functors, the geometric lemma, the Satake isomorphism and segments belong to [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md); the unitary doubling series, the Satake parameters of bounded spherical functions and the Zelevinsky classification to LocalFactorsOfTwistsAndTypes §§3.3, 3.4, 4.1; the `(GL_n, GL_m)`-duality on polynomials in matrices to TensorInductionAndFiniteGroupInputs §7.1; the local classification of Hermitian spaces, unimodular lattices and Siegel's main theorem to HermitianFormsAndLattices §§2.1, 4.2, 6.5; the zeta integrals of Tate and of Godement–Jacquet to [AutomorphicLFunctionsAndLocalFactors](../../AutomorphicLFunctionsAndLocalFactors/README.md); reduction theory and strong approximation to [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md); Harish-Chandra modules, constant terms and the modules `A_𝔮(λ)` to [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md); Eisenstein series and their continuation to [AutomorphicSpectralTheory](../../AutomorphicSpectralTheory/README.md); local Fourier inversion, partial Fourier transforms and adelic Poisson summation to AnalyticNumberTheoryPartII §§5.3g, 5.3h; the nonvanishing of Hecke `L`-functions at `s = 1` to [LFunctions](../../LFunctions/README.md) Layer 7; the Hermite basis to [OrthogonalL2Bases](../../../Completed/OrthogonalL2Bases/README.md); the Peter–Weyl theorem and branching rules to [RepresentationTheory/CompactGroups](../../RepresentationTheory/CompactGroups/README.md) and [RepresentationTheory/ClassicalGroups](../../RepresentationTheory/ClassicalGroups/README.md). The roadmaps of this family that use these statements are listed under Downstream consumers above.

## Exact supplier contracts

### From TauCetiRoadmap.MetaplecticAutomorphicForms

§0.1: the bilinear Heisenberg law. §0.15: the Schrödinger representation. §§0.17, 0.18: the Hilbert Schrödinger model and the smooth vectors of the oscillator model. §1.1: the smooth Stone–von Neumann theorem (irreducibility and uniqueness of the Heisenberg representation with a given central character). §1.2: the unitary Stone–von Neumann theorem over `ℝ` (4.4a). §1.3: the unitary normalizer extension and the covariance `ω(g)ρ(w)ω(g)⁻¹ = ρ(gw)`. §1.5: the Fock model of the real Heisenberg representation, its Bargmann transform, polynomial Fock vectors and transforms of tempered distributions (3.45, as a corollary). §2.4b: the metaplectic double cover, with the connected preimage of the rotation group of `Sp_2(ℝ)`. §2.4c: the genuine Weil representation. §2.5: the Weil operators on generators. §2.5a: the Fock model of the real Weil representation, its `K`-finite vectors and the infinitesimal Weil representation (3.45, as a corollary). §2.6a: the local unramified compact splitting and the lattice vector. §3.2a: split étale Hermitian spaces and the comparison of the split oscillator with the type-II model and its characters. §3.3: the unitary dual-pair splittings attached to `χ_V`, `χ_W`, the character change and the Check for `V = 0`. §3.3b: the comparison of the Hermitian normalisations of four sources, extended by 3.3b. §3.3d: the compatibility of the unitary splittings with orthogonal sums (3.3b, (a) and (b), as a corollary). §3.4: the big theta module. §3.6: the finite length of theta modules. §3.7: Howe duality, in its archimedean form for Harish-Chandra modules (3.46, 3.46a, 3.47b). §3.7a: compact dual pairs `(U(n), U(p, q))` (3.46, in the clauses its `*Corollary of:*` line names, as a corollary). §3.9a: unitary persistence, the stable range and bump vectors (3.9a, (i), (ii) and the first sentence of (iii), as a corollary). §3.12: Kudla's Jacquet filtration. §3.14: the type-II theta input. §3.18: the unitary equal and almost equal rank correspondence, for the conventions of the characters. §3.22: the unitary theta Hecke map. §3.22a: the unramified unitary theta correspondence in unequal rank at inert places, for even dimensions, `W` split and trivial splitting characters, the published case of 3.21a. §§4.1–4.5: unramified compact splittings, the adelic metaplectic cover, the Weil product formula, the rational symplectic splitting and the adelic Weil representation. §§5.1, 5.2: the theta kernel, its smoothness and its growth. §5.5: metaplectic constant terms. §5.6: the global theta lift. §5.6a: Rallis's tower property for unitary theta lifts (5.6a, the cuspidality of the theta integrals, as a corollary). §5.7: Weil's convergence criterion for split `W` in the datum of GQT, the published case of 5.7a. §§6.1, 6.2, 6.4, 6.5: the measure conventions, the Siegel–Weil section, the anisotropic Siegel–Weil formula and the regularised first-term identity. §6.4a: the Siegel–Weil formula in Weil's convergent range for unitary pairs, the published case of 6.4a. §6.10: the doubling Schwartz map. §6.10a: the standard doubling factors and the standard spherical section (6.11). §6.11: the local doubling zeta integral and its unramified value `L_v/d_v`, extended by 6.11 (with §6.10a, the values in 6.11 (b), (c), as a corollary). §6.12: the factorization of theta pairings. §6.13: the Rallis inner product formula in `d(n) < m ≤ 2d(n)`, `r ≤ n`, for cuspidal `π` with vanishing lower theta lifts; for unitary pairs (`n < m ≤ 2n`) the published case of 6.13a (i), without the holomorphy of the bracket at `s₀`, adapted in 6.13b.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

§SR.2.1: smooth and compact induction, with induced representations as sections over `H\G` (*l-sheaf-model*). §SR.2.2: Jacquet functors, parabolic induction and the geometric lemma (*geometric-lemma*). §SR.3.1: cuspidal support and finite length. §§SR.4.1–SR.4.4: the Satake transform and spherical parameters, the explicit spherical generators of `GL_n` (*gln-generators*, §SR.4.3), and the unramified unitary groups of §SR.4.4 with their standard Hermitian space and lattice, in the unitary normalisation with base-change parameters at inert places. *segment-representations*: segments and their representations `Z(Δ)`, `L(Δ)`.

### From LocalFactorsOfTwistsAndTypes, a sub-roadmap of this family

§3.3 (b): the unitary doubling series, its domain of absolute convergence and its value. §3.4 (i), (ii): the Satake parameters of a bounded spherical function satisfy `Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}`, with the sublattice counts of its route. §4.1 (ii)–(iv): products of segment representations are irreducible exactly when the segments are pairwise unlinked; the Jacquet modules of `Z(Δ)`; the Grothendieck ring of the representations of all `GL_n(F)` is the polynomial ring on the segments. §4.1 (vi): `π₁ × π₂` is irreducible when no member of the cuspidal support of `π₁` is `σ′|·|^j`, `j ∈ {−1, 0, 1}`, with `σ′` in the cuspidal support of `π₂` (5.7d).

### From TensorInductionAndFiniteGroupInputs, a sub-roadmap of this family

§7.1: for `n, m ≥ 1`, the `(GL_n, GL_m)`-duality on complex polynomials in `n × m` matrices, `ℂ[M_{n×m}]_d ≅ ⊕_λ S^λ(ℂⁿ) ⊗ S^λ(ℂ^m)` (`λ ⊢ d`, at most `min(n, m)` parts), irreducible and pairwise non-isomorphic summands, with the products of leading principal minors as joint highest weight vectors, and the same for the restriction to `U(n) × U(m)`.

### From HermitianFormsAndLattices, a sub-roadmap of this family

§2.1 (a): Hermitian spaces over a nonarchimedean local field are classified by dimension and determinant class. §4.2 (a): unimodular lattices at split and unramified places, unique up to `U(V_v)`. §6.5 (a): Siegel's main theorem in Weil's form, the mean value over `[U(V)]` of an orbit sum as a product of local orbital integrals.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

§AL.1: Tate's local zeta integrals, their functional equation and the local `γ`-factors. §AL.2: Godement–Jacquet zeta integrals and the standard local `L`-factor.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII

§§1.1, 1.3: the unitary degenerate principal series and the continuation of the degenerate Siegel Eisenstein series over a CM extension, whose restriction to `U(W)` is the Siegel family of MetaplecticAutomorphicForms §6.2 (6.4a). §2.3: the unramified unitary doubling formula `d_n(s, χ⁻¹)Z_U = L_E(s + ½, BC(π^∨) ⊗ χ⁻¹)` in the right-action convention of that roadmap, compared with 6.11 (b), (c) above.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§2.2: the quotient measure on a coset space with its integration formula in stages (*quotient-measure*) (5.7c). §3.1: rational parabolics and Iwasawa integration. §3.4: adelic Siegel sets, the covering of `G(F)\G(𝔸)` by Siegel sets and the compactness of the arithmetic quotients of anisotropic groups. §3.5: algebraic heights. §4.2: strong approximation for simply connected groups.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§2.1: `K`-finite vectors and admissibility. §2.2: infinitesimal characters. §2.4: discrete series. §4.1: constant terms. §4.2: smooth cusp forms and their cuspidal occurrences (5.6a). §5.4: the Vogan–Zuckerman modules `A_𝔮(λ)` and their characterisation.

### From TauCetiRoadmap.AutomorphicSpectralTheory

§§1.1–1.4: normalised induced families, Eisenstein series and intertwining integrals in the convergence chamber. §§2.4, 2.4a: meromorphic continuation and functional equations of Eisenstein series.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

§ALS.F.6: automorphic forms, constant terms and cusp forms; cusp forms are rapidly decreasing (5.6a).

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

§5.3g: local characters, self-dual measures, Fourier inversion and partial Fourier transforms (5.7c, 5.7e). §5.3h: the adelic Schwartz–Bruhat space, partial Fourier transforms and Poisson summation.

### From TauCetiRoadmap.LFunctions

Layer 7: the `L`-function of a nontrivial Hecke character is holomorphic and nonzero at `s = 1`.

### From TauCetiRoadmap.OrthogonalL2Bases

Part A, A2–A3: the Hermite functions and the Hermite basis of `L²(ℝ)`. Part D: the multidimensional Hermite basis of `L²(ℝ^d)` (3.45).

### From TauCetiRoadmap.RepresentationTheory.CompactGroups

Layers 4–5: Schur orthogonality and the Peter–Weyl theorem.

### From TauCetiRoadmap.RepresentationTheory.ClassicalGroups

§6.1: the branching rule from `GL_n` to `GL_{n−1}`, used for `U(1) × U(P_W − 1) ⊂ U(P_W)` in 5.7d.

### From TauCetiRoadmap.RepresentationTheory.LieHighestWeight

§9.2: the Harish-Chandra isomorphism of a reductive Lie algebra, here `𝔤𝔩_N`, with its central-character evaluations (3.47b (iii)).

### From Mathlib

`MeasureTheory.Measure.ext_of_charFun`: two finite measures on a complete second-countable real inner product space with the same characteristic function are equal (5.7e).

## References

- GQT: Wee Teck Gan, Yannan Qiu and Shuichiro Takeda, The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula, Invent. Math. 198 (2014), arXiv:1207.4709v3: the parameters of Layers 5–6 (§§2.2–2.3, pp. 8–9; Weil's convergent range, §3.1, p. 14), the credits for the Siegel–Weil formula in the convergent range (Theorem 7.1, p. 33, for `r = 0`; proof of Proposition 11.1 (ii), p. 53) (6.4a), the credits for the Rallis inner product formula in Weil's convergent range (§1.7, p. 3) and the doubling form of that formula (Propositions 11.1–11.2, p. 53; §11.6, p. 54) (6.13a).
- Gan–Ichino: Wee Teck Gan and Atsushi Ichino, The Gross–Prasad conjecture and local theta correspondence, arXiv:1409.6824v2, §4.1 (p. 12) and §7.4 (p. 35): the normalisation of the splittings and its Levi formula (3.3b, 4.4a).
- Kudla96: Stephen S. Kudla, Notes on the local theta correspondence, 1996, III.4, Propositions 4.1, 4.3–4.5 (pp. 45–49): persistence and the stable range, for symplectic–orthogonal Witt towers (3.9a).
- Stephen S. Kudla, Splitting metaplectic covers of dual reductive pairs, Israel J. Math. 87 (1994), Theorem 3.1: the splittings and their explicit cochain (3.3b, 4.4a).
- Michael Harris, Stephen S. Kudla and William J. Sweet, Theta dichotomy for unitary groups, J. Amer. Math. Soc. 9 (1996), §1: the splittings (3.3b, 4.4a); Appendix, (a.22)–(a.24), p. 997, the splitting for a non-split space defined by doubling it, and Corollary A.3, p. 998, the compatibility of the splittings with orthogonal sums of the group's own space (3.3b).
- L. Gutiérrez Frez and A. Vera-Gajardo, Weil representations of U(n,n)(F_q^2/F_q), q>3 odd, via presentation and compatibility of methods, arXiv:1606.03346: the Weil representation of `U(n, n)` over a finite field by generators and relations (3.3b).
- L. Gutiérrez, J. Pantoja and J. Soto-Andrade, On generalized Weil representations over involutive rings, arXiv:1009.0877: Weil representations over involutive rings by generators and relations (3.3b).
- A. Murase, On metaplectic representations of unitary groups I: Splitting; II: Character formula, Proc. Japan Acad. Ser. A 77 (2001): local splittings for unitary groups (4.4a).
- A. Murase and T. Sugano, Local theory of primitive theta functions, Compositio Math. 123 (2000): local Weil representations of unitary groups in lattice models (4.4a).
- T. Yang, Eigenfunctions of the Weil representation of unitary groups of one variable, Trans. Amer. Math. Soc. 350 (1998): the local Weil representation of a unitary group of one variable (4.4a).
- A. S. Rapinchuk and W. Tralle, On almost strong approximation in reductive algebraic groups, arXiv:2503.00696 (2025): approximation in reductive groups, a general form of the approximation of 4.4a.
- Jian-Shu Li, Singular unitary representations of classical groups, Invent. Math. 97 (1989), and Nonvanishing theorems for the cohomology of certain arithmetic quotients, J. reine angew. Math. 428 (1992): the stable range (1989) and bump vectors (1992) (3.9a), the unramified doubling integral (6.11) and the inner product formula (6.13a, 6.13b).
- Colette Mœglin, Marie-France Vignéras and Jean-Loup Waldspurger, Correspondances de Howe sur un corps p-adique, Lecture Notes in Math. 1291 (1987): type-I pairs over a `p`-adic field, unitary pairs included (3.9a).
- Jian-Shu Li, Theta lifting for unitary representations with nonzero cohomology, Duke Math. J. 61 (1990): the theta lifts of discrete series for the data of 3.46a (its remark; Theorem 4.1, whose proof Ichino20, §7.4, uses), and the identification of theta lifts with modules `A_𝔮(λ)` (3.47b).
- Ichino20: Atsushi Ichino, Theta lifting for discrete series representations of real unitary groups, arXiv:2002.09148v1 (2020), §1 (pp. 1–2), Theorem 4.1 and Remark 4.2 (pp. 7–8), §7.2 (p. 30): the hypothesis of Li's theorem, the general case and the convergence of the zeta integral (3.46a).
- M. Flensted-Jensen, Discrete series for semisimple symmetric spaces, Ann. of Math. 111 (1980), §7: the function of the lowest `K`-type of a discrete series (the normalised trace of the representation on that type), as Ichino20, §7.4, uses it (3.46a).
- Stephen Rallis, Langlands' functoriality and the Weil representation, Amer. J. Math. 104 (1982): the unramified correspondence, there for orthogonal–symplectic pairs (3.21a, 3.47a).
- Roger Howe, θ-series and invariant theory, Proc. Sympos. Pure Math. 33 (1979): spherical vectors of the oscillator representation (3.21a, 3.47a).
- Roger Howe, Transcending classical invariant theory, J. Amer. Math. Soc. 2 (1989), and Remarks on classical invariant theory, Trans. Amer. Math. Soc. 313 (1989): the Fock model, joint harmonics and the Capelli identity (3.45, 3.46, 3.47b).
- Mínguez08: Alberto Mínguez, Correspondance de Howe explicite : paires duales de type II, Ann. Sci. ÉNS (4) 41 (2008), Théorème 1 (p. 718) and (1.4) (p. 721): the split case (3.9a, 3.21a, 3.47).
- Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups, Ann. of Math. 194 (2021), arXiv:2006.06139v5, Definition 6.8 (pp. 30–31): the data of the Hecke map in 3.21a.
- Yifeng Liu, Arithmetic theta lifting and L-derivatives for unitary groups I, Algebra Number Theory 5 (2011), Appendix: the unramified unitary theta correspondence, after Rallis (3.21a).
- Yifeng Liu, Theta correspondence for almost unramified representations of unitary groups, arXiv:2105.14223 (2021), Theorem 1.1 and Remark 1.4: the unramified unitary theta correspondence at an inert place, for even dimensions and trivial splitting characters (3.21a).
- Valentine Bargmann, Comm. Pure Appl. Math. 14 (1961): the Bargmann transform (3.45).
- Valentine Bargmann, On a Hilbert space of analytic functions and an associated integral transform, Part II (application to distribution theory), Comm. Pure Appl. Math. 20 (1967): the Bargmann transforms of tempered distributions (3.45 (iv)).
- Masaki Kashiwara and Michèle Vergne, On the Segal–Shale–Weil representations and harmonic polynomials, Invent. Math. 44 (1978): the Fock model and compact dual pairs (3.45, 3.46, 3.47b).
- Annegret Paul, Howe correspondence for real unitary groups, J. Funct. Anal. 159 (1998): compact dual pairs (3.46).
- A. Paul and P. Trapa, One-dimensional representations of U(p,q) and the Howe correspondence, J. Funct. Anal. 195 (2002): the identification of theta lifts of one-dimensional representations with modules `A_𝔮(λ)` (3.47b).
- Roger Godement and Hervé Jacquet, Zeta functions of simple algebras, Lecture Notes in Math. 260 (1972): the zeta integrals of 3.47, and equivariant distributions on matrix spaces (3.47c).
- Andrei Zelevinsky, Induced representations of reductive p-adic groups II, Ann. Sci. ÉNS 13 (1980), Theorem 4.2 (p. 184): products of segments (3.47, 5.7d).
- S. Kudla and W. J. Sweet, Degenerate principal series representations for U(n,n), Israel J. Math. 98 (1997): the theta quotients of the trivial representations of complementary spaces (3.47, 3.47a).
- David Vogan and Gregg Zuckerman, Unitary representations with nonzero cohomology, Compositio Math. 53 (1984), Theorem 2.5 (p. 58) and Proposition 6.1 (p. 78): the identification with `A_𝔮(λ)` (3.46a, 3.47b).
- Weil65: André Weil, Sur la formule de Siegel dans la théorie des groupes classiques, Acta Math. 113 (1965), §§V–VI: the convergence criterion and the Siegel–Weil formula in Weil's range (5.7a, 6.4a).
- Stephen Rallis, L-functions and the oscillator representation, Lecture Notes in Math. 1245 (1987): constant terms and the tower property (5.7c, 5.7d).
- Stephen S. Kudla and Stephen Rallis, A regularized Siegel–Weil formula: the first term identity, Ann. of Math. 140 (1994): the tower formula and the maps of 5.7c and 5.7d, and the regularisation of theta integrals (5.7b).
- John Tate, Fourier analysis in number fields and Hecke's zeta-functions (thesis, 1950): the cone integrals and their functional equation (5.7c, 5.7e), and equivariant distributions (3.47c).
- Stephen S. Kudla and Stephen Rallis, On the Weil–Siegel formula II: the isotropic convergent case, J. reine angew. Math. 391 (1988), Theorem, p. 66: the Siegel–Weil formula for isotropic quadratic `V` of even dimension with `m − r > d(n)` and data finite under a maximal compact subgroup (6.4a), as credited in the proof of GQT Proposition 11.1 (ii) (p. 53).
- Atsushi Ichino, On the Siegel–Weil formula for unitary groups, Math. Z. 255 (2007): the convergent range of the Siegel–Weil formula (6.4a), as credited in the proof of GQT Proposition 11.1 (ii) (p. 53), and the Rallis inner product formula (6.13a, 6.13b), as credited in GQT §1.7 (p. 3).
- Rallis84a: Stephen Rallis, On the Howe duality conjecture, Compositio Math. 51 (1984), §1, Theorem 1.1.1 (p. 345): the tower property, for orthogonal–symplectic pairs (5.6a).
- Chenyan Wu, Irreducibility of theta lifting for unitary groups, J. Number Theory 133 (2013), arXiv:1409.0770, §3, Proposition 3.1: the tower property, for unitary pairs (5.6a).
- Rallis84b: Stephen Rallis, Injectivity properties of liftings associated to Weil representations, Compositio Math. 52 (1984), §1, Proposition 1.1 (pp. 149–150): the Rallis inner product formula, for orthogonal–symplectic pairs in Weil's range (6.13a, 6.13b).
- Atsushi Ichino, A regularized Siegel–Weil formula for unitary groups, Math. Z. 247 (2004): the regularisation of theta integrals (5.7b) and the inner product formula (6.13b).
- Ilya Piatetski-Shapiro and Stephen Rallis, L-functions for the classical groups, Part A (pp. 1–52) of S. Gelbart, I. Piatetski-Shapiro and S. Rallis, Explicit constructions of automorphic L-functions, Lecture Notes in Math. 1254 (1987): the doubling method and its unramified computation (6.11, 6.13a, 6.13b).
- Shunsuke Yamana, L-functions and theta correspondence for classical groups, Invent. Math. 196 (2014): doubling integrability (6.13b), and the inner product formula outside `n < m ≤ 2n` (6.13a).
- FormalProof: Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions, announced on 20 November 2026 (Announcement); source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The files and declarations of FormalProof named in this README are those of the first commit of that repository, the source as published, with the file paths relative to its directory `src/`: <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src>. A locator `Dir/…/File.lean` (`Name`) names a file under `src/` and a declaration in it: the forms of the paragraphs *The form of the formal proof* and *Status* (3.9a, 3.21a, 3.45, 3.46, 3.46a, 3.47, 3.47b, 4.4a, 5.6a, 5.7a, 5.7b, 5.7c, 5.7e, 6.13b, 6.13c), and the statements that a target attributes to the formal proof (3.3b, 3.47a, 3.47c, 5.7d, 6.4a, 6.11, 6.13a).
- Announcement: Levent Alpöge, the announcement of that proof, 20 November 2026, <https://alpo.ge/remark.pdf>, p. 1 and footnote 1 (the Lean source).

# Roadmap: Hecke ideals and Taylor–Wiles relations

**Summary.** At a maximal ideal of the big ordinary Hecke algebra of a definite unitary group whose residual Galois determinant is that of a sum of pairwise distinct characters, the Hecke algebra carries a determinant, not a Galois representation. This roadmap compares it with the universal ring of ordinary determinants, gives its Taylor–Wiles patching data, deduces the vanishing of adjoint Bloch–Kato Selmer groups at irreducible automorphic points, and adds Tate–Shafarevich kernels of Galois cohomology with lattice and divisible coefficients. Its headline theorems:

- *The Hecke ideal.* Let `L` be a CM field with `L/L⁺` unramified at every finite place, `l` an odd prime, and `χ̄_1, …, χ̄_n` pairwise distinct characters of `G_{L,S}` with `⊕χ̄_i` isomorphic to its conjugate dual twisted by `ε̄^{1−n}`. Ordinary determinants lifting `det ⊕χ̄_i` are classified by a complete local noetherian ring `B` over the weight algebra `Λ`; the localized big ordinary Hecke algebra `𝕋` carries a unique ordinary determinant, and the classifying map `B → 𝕋` is surjective, with kernel `J` such that `B/J` is finite over `Λ`, `Λ`-torsion-free and reduced. Twisting by a character `γ ≡ 1` as in 3.13a (g) maps `J` into itself.
- *Patching data.* If moreover `μ_l ⊄ L`, then `J` has automorphic patching data: at every Taylor–Wiles level `N`, modules over the ordinary determinant ring with the Taylor–Wiles places added, comparison maps whose composites are multiplication by a product `f` of differences of ordered Hecke eigenvalues, and Taylor–Wiles relations that, multiplied by `f`, act nilpotently with exponent `n!`, independent of `N`.
- *Adjoint vanishing.* If `F` is an imaginary CM field, `n ∈ {2, 3}`, and `ρ = r|_{G_F}` is attached to a regular algebraic conjugate self-dual cuspidal representation of `GL_n(𝔸_F)` and is irreducible on every open subgroup of `G_F`, then `H¹_f(F⁺, ad r) = 0`. For `2 ≤ n ≤ 4` and ordinary `ρ` with residual representation a sum of pairwise distinct characters, `H¹_f(L⁺, ad r) = 0` under the hypotheses of 9.9 (d), among them absolute irreducibility on `G_{L(μ_{p^∞})}` and an element with separable characteristic polynomial in every nonempty open subset of that group.
- *Kernels with lattice coefficients.* For a number field `F`, a prime `p`, a finite set `S` of places containing those above `p` and the infinite ones, and a `ℤ_p`-lattice `T` with continuous `G_{F,S}`-action, the kernel `Ш²_S(F, T)` of localization on `H²(G_{F,S}, T)` is the Pontryagin dual of `Ш¹_S(F, T^D)`, real places included.

The targets extend PotentialAutomorphyInfrastructurePartII (definite unitary groups, their Hecke algebras and Taylor–Wiles data) and [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md) (Poitou–Tate duality). Determinants come from [IntegralHeckeAndGaloisDeterminants](../../IntegralHeckeAndGaloisDeterminants/README.md), the Galois representations of definite unitary groups from [BaseChangeAndGaloisRepresentationsForUnitaryGroups](../BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md), another sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md), and Newton and Thorne's vanishing theorem from ModularityAndLanglandsExtensions.

Layers 3, 4 and 9 below carry the numbers of the layers of PotentialAutomorphyInfrastructurePartII that they extend; Layer 10 extends ArithmeticGaloisDuality instead. Layer 3 builds the universal ordinary determinant ring and the Hecke ideal (3.13a), and Layer 4 its patching data (4.2a). Layer 9 proves adjoint vanishing (9.9): by Newton and Thorne's theorem at points irreducible on every open subgroup, and through Layers 3 and 4 at the other irreducible ordinary points. Layer 10, independent of the others, states the Tate–Shafarevich kernels (10.1).

## Conventions

Notation and conventions not restated here are those of PotentialAutomorphyInfrastructurePartII §§2.1, 3.1–3.13, 4.1–4.2, 9.3, and of its Conventions, in Layers 3, 4 and 9, and those of ArithmeticGaloisDuality §§R02.4.2, D7.6, and of its Conventions, in Layer 10.

- `L` (in 9.9 (a)–(c), `F`) is a CM field with maximal totally real subfield `L⁺` and complex conjugation `c`. For a place `v` of `L⁺` split in `L`, `ṽ` is the chosen place of `L` above it; `G_{L,S}`, the decomposition groups `G_{L_ṽ}` and the inertia groups `I_ṽ` are those of PotentialAutomorphyInfrastructurePartII.
- `O` is the ring of integers of a finite extension `E` of `ℚ_l`, with uniformizer `ϖ`, maximal ideal `𝔪_O` and residue field `k`. In 9.9 (d) and (d′) the coefficient prime is written `p`; it plays the role of `l` in 3.13a and 4.2a.
- `ε` is the cyclotomic character, of Hodge–Tate weight `−1`, and `ε̄` its reduction; local class field theory `Art` sends uniformizers to geometric Frobenius elements; `Teich` is the Teichmüller lift.
- `Frob_w` is a geometric Frobenius element at `w`, as in PotentialAutomorphyInfrastructurePartII §3.7, so `ε(Frob_w) = (Nw)⁻¹`; the Frobenius elements `φ_{N,j}` of 4.2a are geometric as well.
- `𝒢_n = (GL_n × GL_1) ⋊ {1, j}` is the group of PotentialAutomorphyInfrastructurePartII §2.1. For a `𝒢_n`-valued `r`, `ad r` is the adjoint representation and `H¹_f` the Bloch–Kato Selmer group of PotentialAutomorphyInfrastructurePartII §9.3.
- Determinants `D`, their traces `tr_D`, characteristic polynomials `charpoly D(g)` and Cayley–Hamilton quotients are those of IntegralHeckeAndGaloisDeterminants Layers 0–1. For an ideal `J` of a ring `B`, `V(J)` is the closed subset of `Spec B` it defines.
- In Layer 10 the prime is `p`, `T^D = Hom(T, ℚ_p/ℤ_p)(1)` for a lattice `T`, `A^∨` is the Pontryagin dual of `A`, and cohomology is the continuous cohomology of ArithmeticGaloisDuality §D7.6.

## Layer 3: Big ordinary Hecke algebras at a reducible residual determinant

This layer compares the big ordinary Hecke algebra of a definite unitary group, localized at a maximal ideal whose residual
determinant is that of a sum of pairwise distinct characters, with the universal ring of ordinary determinants.

### 3.13a The big ordinary Hecke algebra at a reducible residual determinant, in determinant form

Let `L` be a CM field with `L/L⁺` unramified at every finite place, `l` an odd prime, `n ≥ 1`, `G` the definite unitary group in `n`
variables for `L/L⁺` (PotentialAutomorphyInfrastructurePartII §3.1), and `S = S_l ∪ S_t ∪ {v₀}` a finite set of places of `L⁺` that split in `L`: `S_l` the places above `l`,
`S_t` a set of places prime to `l`, and `v₀` of prime norm `p ∉ {2, l}`, with `p` unramified in `L`. Let `O` be the ring of
integers of a finite extension of `ℚ_l` containing the images of all embeddings of `𝒪_L`, with residue field `k`. Let
`χ̄_1, …, χ̄_n : G_{L,S} → k^×` be **pairwise distinct** characters such that `⊕χ̄_i` is isomorphic to its conjugate dual twisted by
`ε̄^{1−n}` (`ε` the cyclotomic character), and `ψ̄_{v,i}` characters of `G_{L_ṽ}` for `v ∈ S_l`.

(1) (*the universal ordinary determinant ring*) An *ordinary determinant* over a complete local noetherian `O`-algebra `R` with
residue field `k` is a pair `(D, (ψ_{v,i}))`: a continuous `n`-dimensional determinant `D` of `G_{L,S}` over `R`
(IntegralHeckeAndGaloisDeterminants Layer 0) lifting `det ⊕χ̄_i` and polarized in the same sense, and continuous characters
`ψ_{v,i} : G_{L_ṽ} → R^×` lifting `ψ̄_{v,i}` with prescribed restriction to the `l`-torsion of `G_{L_ṽ}^{ab}`, such that
`tr_D(h·(g_1 − ψ_{v,1}(g_1))(g_2 − ψ_{v,2}(g_2))⋯(g_n − ψ_{v,n}(g_n))) = 0` for all `v ∈ S_l`, `g_i ∈ G_{L_ṽ}`, `h ∈ G_{L,S}`, and
`tr_D(h(g − 1)) = 0` for `g` in an inertia group at `S_t` with `χ̄_i(g) = 1` for all `i`. Prove that, provided the residual pair
`(det ⊕χ̄_i, (ψ̄_{v,i}))` is itself an ordinary determinant (otherwise there is none), the functor of ordinary determinants on
complete local noetherian `O`-algebras with residue field `k` is represented by a complete local noetherian `O`-algebra `B` (this
uses Mazur's finiteness condition for `G_{L,S}` and for the `G_{L_ṽ}`), and that the characters `ψ_{v,i}|_{I_ṽ}` define a map
`Λ → B` from the universal ring `Λ` of the inertial characters (a power series ring in `n[L⁺:ℚ]` variables over `O`,
LocalGaloisDeformationRings §1.3).

Let `M` be the localization, at the maximal ideal at which the Hecke polynomial at every split `w ∉ S` reduces to the
characteristic polynomial of `(⊕χ̄_i)(Frob_w)` and `U^j_{λ,ϖ_ṽ}` at `v ∈ S_l` to `∏_{i≤j}(ψ̄_{v,i}ε̄^{i−1})(Art ϖ_ṽ)` (so the maximal
ideal depends on the `ψ̄_{v,i}` as well), of the ordinary part of the space of `Λ`-valued algebraic automorphic forms on `G` of
universal weight (PotentialAutomorphyInfrastructurePartII §§3.8–3.9, weight `0` with the twisted `Λ`-structure), hyperspecial level outside `S`, level `G(𝒪)` at `S_t` with
the type of `⊕Teich(χ̄_i)|_I`, and principal congruence level at `v₀`; let `𝕋 ⊂ End_Λ(M)` be generated by the spherical operators
`T_w^j` at the split places `w ∉ S` and the operators `U^j_{λ,ϖ_ṽ}`, `v ∈ S_l`. If `M = 0`, put `J = B`. Prove:

(a) (*determinant*) there are a unique continuous determinant `D_𝕋 : G_{L,S} → 𝕋` whose characteristic polynomial at `Frob_w`
is the Hecke polynomial of the `T_w^j` (PotentialAutomorphyInfrastructurePartII §3.7), and characters `ψ^𝕋_{v,i}` of `G_{L_ṽ}` given on units by the diamond operators and
on a uniformizer through the `U`-operators, by the Artin map: `ψ^𝕋_{v,i}ε^{i−1}`, `i = 1, …, n`, is on units the inverse of the `i`-th
coordinate of the universal weight character, and `∏_{i≤j}(ψ^𝕋_{v,i}ε^{i−1})(Art ϖ_ṽ) = U^j`; `(D_𝕋, ψ^𝕋)` is an ordinary determinant;
the classifying map `B → 𝕋` is surjective. Let `J` be its kernel.

(b) (*ring*) `M` is finite free over `Λ` with support `V(J)`; `B/J` is finite over `Λ`, `Λ`-torsion-free and reduced; over `B/J`,
`charpoly D(g) = ∏_i (X − ψ_{v,i}(g))` for `g ∈ G_{L_ṽ}`, the products `(g_1 − ψ_{v,1}(g_1))⋯(g_n − ψ_{v,n}(g_n))` lie in the kernel
of `D` (this holds already over `B`: over a residually multiplicity-free base the trace relation of (1) is equivalent to it), and
the restriction of `D` to an inertia group at `S_t` is `det ⊕Teich(χ̄_i)`; if the `χ̄_i` are equal and unramified on the
decomposition group at `v₀` and `ε̄ ≠ 1` there, `D` is unramified at `v₀`. In particular `B/(J + 𝔪_Λ B)` is finite.

(c) (*density*) for every regular weight the points of `V(J)` of that weight whose `n` inertial characters at each `v ∈ S_l` have
pairwise distinct finite parts are Zariski dense; at such a point `D` is the determinant of a representation with a full flag
at each `v ∈ S_l` with characters `ψ_{v,i}`, which is potentially crystalline there.

(d) (*arithmetic points*) at every arithmetic point of `V(J)`, `D` is the determinant of a continuous semisimple `ρ` whose
characteristic polynomials are those of `⊕_i ⊕_{0≤j<m_i} ρ′_i ⊗ ε^{−j}` for continuous representations `ρ′_i` of `G_L` (in the
route below, those of the cuspidal constituents of the base change); if all `m_i = 1`, any two eigenvalues `z, z′` of
`ρ(Frob_w)` satisfy `|z| < Nw·|z′|` (under the fixed isomorphism `ι : ℚ̄_l ≅ ℂ`) for almost all `w`.

(e) (*classicality*) if `ρ` in (d) is irreducible, it is attached to a regular algebraic conjugate self-dual cuspidal
representation of `GL_n(𝔸_L)`.

(f) (*points*) for `2 ≤ n ≤ 4`: an arithmetic point of `B` whose determinant is that of an automorphic `ρ` unramified at `v₀`,
with a full flag at each `v ∈ S_l` with characters `ψ_{v,i}`, no two of which are in ratio `ε`, lies in `V(J)`. Here
*automorphic* means: `ρ` is continuous and attached to a regular algebraic conjugate self-dual cuspidal representation of
`GL_n(𝔸_L)`, and (w1) at each place above `l` at which `ρ` has a full flag with no two characters in ratio `ε`, it has a full
flag with no two characters in ratio `ε` up to a character of finite order; (w2) for every regular algebraic cuspidal `Π′` to
which `ρ` is attached there is a real `t` such that, at every finite place `w` of `L` which is prime to `l` or at which the
conclusion of (w1) holds, `Π′_w` has cuspidal support made of characters `ξ` of `L_w^×`, each with
`(Nw)^{t−1/2} < |ξ(ϖ_w)| < (Nw)^{t+1/2}`.

(g) (*twists*) Let `γ : G_{L,S} → B^×` be a continuous character, `γ ≡ 1` modulo the maximal ideal, with `γ(cgc⁻¹)γ(g) = 1`, trivial on
the inertia groups at `S_t` and at `v₀`, and trivial on the `l`-torsion of the `G_{L_ṽ}^{ab}`, `v ∈ S_l`, prescribed in (1) (for
instance a character with values in `1 + 𝔪_O` factoring through a quotient of `G_{L,S}` isomorphic to `ℤ_l`, unramified outside `l`,
with `γγ^c = 1`). Then `(D ⊗ γ, (ψ_{v,i}γ))` is an ordinary determinant, the endomorphism `τ_γ` of `B` classifying it is the unique
one twisting `D` and the `ψ_{v,i}` by `γ`, and `τ_γ(J) ⊆ J`; for `γ` with values in `1 + 𝔪_O`, `τ_γ` is an automorphism and
`τ_γ(J) = J`.

*Route.* (1) The universal ring of continuous determinants lifting `det ⊕χ̄_i` is noetherian under Mazur's finiteness condition
(Chenevier [Che14], Proposition 3.7, with Example 3.6 for `G_{L,S}` and the `G_{L_ṽ}`, p. 43 of arXiv v2); the characters add a completed group ring of the pro-`l` part of the `G_{L_ṽ}^{ab}` modulo the prescribed torsion;
the ordinary relations, the relations at `S_t` and the polarization are closed conditions; the functor is nonempty exactly when
the residual pair satisfies them (for `ψ̄_{v,i} = χ̄_i|_{G_{L_ṽ}}` it does: the `i`-th factor vanishes on the `i`-th line). (b) `M` is
free over `Λ` because the level at `v₀` makes the arithmetic subgroups act freely (PotentialAutomorphyInfrastructurePartII §3.11), and Hida's control theorem (PotentialAutomorphyInfrastructurePartII §3.12)
identifies its specializations with classical ordinary forms; at a point with distinct inertial characters the classical space
is a sum of Hecke eigenspaces, so `𝕋` is reduced and such points are dense (c). Every automorphic representation of `G` has a
semisimple Galois representation with the Speh shape of (d): its weak base change to `GL_n` is an isobaric sum of Speh blocks
(EndoscopicTransferAndUnitaryTraceComparison §6.29), with the Galois representations of definite unitary groups of
BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 (its hypothesis `[L⁺ : ℚ] ≥ 2` holds, since `L/L⁺` unramified at
every finite place forces `[L⁺ : ℚ]` to be even), and the bound of (d) is the Jacquet–Shalika bound for each cuspidal piece
(AutomorphicLFunctionsAndLocalFactors §AL.3.3.8). At a classical point where the local components above `l` are principal series
of characters distinct on units, the Galois representation is de Rham with the weights of the point and abelian Weil–Deligne
representation with `N = 0` (AutomorphicGaloisRepresentationsPartII §AG2.6, *Full polarized local–global compatibility at `l`*,
whose hypothesis ModularityAndLanglandsExtensions §2.43 proves), hence potentially crystalline, and the unit-root characters
attached by Hida's lemma give crystalline characters of the right weights: the valuations of Frobenius lie on the Hodge polygon,
so it has a full flag with the characters `ψ_{v,i}` (PadicHodgeTheory §3.6, after Berger's theorem, NoncommutativeAndEquivariantIwasawa
§F.6). (a) The determinants at the dense points glue to `D_𝕋` (Chenevier's gluing of determinants over a compact ring which the
dense points separate, `𝕋` being reduced and finite over `Λ`; IntegralHeckeAndGaloisDeterminants §4.1), the characters `ψ^𝕋_{v,i}` come from local class
field theory, and every relation defining an ordinary determinant is an identity in the reduced ring `𝕋`, checked at the dense
points (where a flag gives the relation). Surjectivity: `𝕋` is generated by the `T_w^j`, which are coefficients of characteristic
polynomials of `D_𝕋`, and by the `U`-operators, which are products of values of the `ψ^𝕋_{v,i}`. The second statement of (b): over
a henselian base `A` with residually pairwise distinct `χ̄_i` the Cayley–Hamilton quotient `R` is a generalized matrix algebra of
type `(1, …, 1)`, with orthogonal idempotents `e_a` and `e_a R e_a = A e_a` (IntegralHeckeAndGaloisDeterminants §1.3). Let `x`
satisfy `tr(xy) = 0` for all `y`, and let `w = xz` for some `z`; then `tr(wy) = 0` for all `y`, so `e_a w e_a = 0` and
`e_a w e_b u e_a = 0` for all `a, b, u`, since the trace of `c·e_a` is `c`. Amitsur's formula (IntegralHeckeAndGaloisDeterminants
Layer 0) writes `D(1 − tw)` as a product of factors `D(1 − t^k v)` over words `v` in the `e_a w e_b`; a word along a closed path is
zero, and a word from `a` to `b ≠ a` lies in `e_a R e_b`, whose characteristic coefficients vanish because conjugation by
`λe_a + 1 − e_a` multiplies it by `λ`. So `D(1 − tw) = 1` for every `z`, and `x` lies in the kernel of `D`. (e) PotentialAutomorphyInfrastructurePartII §3.14(b). (f) The flag makes `ρ` potentially crystalline at `S_l`: `ρ` is de Rham
there (AutomorphicGaloisRepresentationsPartII §AG2.6), so each step of the flag is a class in `H¹_g` with coefficients `W`, and
`dim H¹_g − dim H¹_f = dim D_cris(W^∨(1))^{φ=1}` (Bloch–Kato, as in the route of PotentialAutomorphyInfrastructurePartII §9.2)
vanishes, the graded characters of `W^∨(1)` being nontrivial because no two characters of the flag are in ratio `ε`. Hence the
cuspidal representation of `ρ` has level potentially prime to `l` (AutomorphicGaloisRepresentationsPartII §AG2.6) and is
`ι`-ordinary (PotentialAutomorphyInfrastructurePartII §0.5). Its descent to `G` (PotentialAutomorphyInfrastructurePartII §3.5(1)) gives a point of the big
ordinary Hecke algebra above an arithmetic prime (PotentialAutomorphyInfrastructurePartII §3.12, first Check), with the inertial type at `S_t` matched by the type and the
flag matched by the characters. No hypothesis on the maximal ideal is used: the residual determinant may be reducible, and
nothing in (a)–(e) uses that the `χ̄_i` are distinct except the definition of the tame types and of the torsion data and the
second statement of (b). The range `2 ≤ n ≤ 4` of (f) is that of the statement of [FormalProof], in which the restriction is
used at one step only, the descent of the cuspidal representation to `G`; the route above does not depend on `n`, but (f) for
other `n` is not a statement of [FormalProof] and is not claimed here. Clauses (w1) and (w2) are hypotheses of [FormalProof].
(g) (i) For `β` of finite `l`-power order with `β^c = β⁻¹`, trivial on those inertia groups, and a point
`x` of `V(J)` as in (c): `x` comes from an automorphic representation `σ` of `G`; `β = μ/μ^c` (`β` has odd order); twisting `σ` by the
character of `G(𝔸)` attached to `μ` gives an automorphic representation with the same weights, unramified where `σ` and `β` are,
spherical at `v₀`, with the same tame types, ordinary at `S_l` with the characters `ψ_{v,i}β`; so the twisted point lies in `V(J)`.
(ii) Modulo `𝔪_B^N`, `γ` factors through a finite `l`-group `Q`; the universal twist `B → B[Q]` maps `J` into `J·B[Q]`: `B[Q]` is finite
free over `B`, `J` is the ideal of the dense set of points of (c), and at a pair (such a point, character of `Q`) the image of
`b ∈ J` is the value of `b` at the twisted point, zero by (i). Specialising and letting `N` grow, `τ_γ(b) ∈ J + 𝔪_B^N` for all `N`,
and `J` is closed. The twisting endomorphism exists and is unique by the universal property of (1). *Needs:* PotentialAutomorphyInfrastructurePartII §§0.5, 3.5, 3.7–3.14;
IntegralHeckeAndGaloisDeterminants Layers 0–1, §4.1; LocalGaloisDeformationRings §1.3;
EndoscopicTransferAndUnitaryTraceComparison §6.29; AutomorphicGaloisRepresentationsPartII §AG2.6;
BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1; ModularityAndLanglandsExtensions §2.43; PadicHodgeTheory §3.6;
NoncommutativeAndEquivariantIwasawa §F.6; AutomorphicLFunctionsAndLocalFactors §AL.3.3.8.

**Checks.**

- For `n = 1`, `B` is the completed group ring of the relevant ray class group, `𝕋 = B` and `J = 0`.
- At a non-Eisenstein maximal ideal (`⊕χ̄_i` replaced by an absolutely irreducible residual representation) the determinant of
  PotentialAutomorphyInfrastructurePartII §3.13(2)'s `r_𝔪` is `D_𝕋`; at an Eisenstein ideal no `r_𝔪` exists over `𝕋`, which is why the statement is in determinant form.
- The relation in (1) is the determinant form of ordinarity. If `D = det ρ` with `ρ` absolutely irreducible over a field, it is the
  identity `∏_i(ρ(g_i) − ψ_{v,i}(g_i)) = 0` on `G_{L_ṽ}`; together with `charpoly ρ(g) = ∏_i(X − ψ_{v,i}(g))` and the `ψ_{v,i}` pairwise
  distinct this is equivalent to a full flag with successive characters `ψ_{v,1}` (the subrepresentation), …, `ψ_{v,n}`
  (LocalGaloisDeformationRings §7.4). Neither
  addition can be dropped: a scalar `ρ|_{G_{L_ṽ}} = ψ_{v,1}` satisfies the identity for every `ψ_{v,2}`; and for
  `(ψ_{v,1}, ψ_{v,2}, ψ_{v,3}) = (φ, θ, φ)`, an extension of `θ` by `φ ⊕ φ` with two independent classes satisfies both conditions and
  has no flag in that order. If `D` is reducible the relation is a condition on its constituents only: `det(χ₁ ⊕ χ₂)` satisfies it
  for both orders, also when it is the determinant of an extension that is nonsplit at `v` and ordinary in one order only.
  Ordinarity of a representation with a reducible determinant is therefore imposed on the representation,
  never deduced from its determinant.
- The shift in (a) is `ε^{i−1}` for `i = 1, …, n`: at weight `0` the diagonal characters on inertia are `1, ε⁻¹, …, ε^{1−n}` (PotentialAutomorphyInfrastructurePartII §3.13,
  first Check).
- The integer congruences that a consumer extracts from `V(J)` bound sums of valuations over sets of non-isomorphic points; they
  are not orders of congruence modules of `𝕋`.
- The direction of `Frob_w` in the maximal ideal and in (a): for `n = 2`, on the constant functions of weight `0`, `T_w^1` acts by
  the number `Nw + 1` of its cosets and `T_w^2` by `1`, so the Hecke polynomial is `X² − (Nw + 1)X + Nw = (X − 1)(X − Nw)`, the
  characteristic polynomial of `(1 ⊕ ε̄⁻¹)(Frob_w)` because `ε(Frob_w) = (Nw)⁻¹`; and `1 ⊕ ε̄⁻¹` is conjugate self-dual up to
  `ε̄^{1−n} = ε̄⁻¹`, as 3.13a requires. With an arithmetic `Frob_w` the same polynomial would come from `1 ⊕ ε̄`, which is conjugate
  self-dual up to `ε̄` and, when `ε̄² ≠ 1`, not up to `ε̄⁻¹`.

### Examples

- For `n = 1`, `B` is the completed group ring of the relevant ray class group, `𝕋 = B` and `J = 0` (3.13a, first Check).
- If `D = det ρ` with `ρ` absolutely irreducible over a field, the relation of 3.13a (1) is the identity
  `∏_i(ρ(g_i) − ψ_{v,i}(g_i)) = 0`; a scalar `ρ|_{G_{L_ṽ}} = ψ_{v,1}` satisfies it for every `ψ_{v,2}`, and for the characters
  `(φ, θ, φ)` an extension of `θ` by `φ ⊕ φ` with two independent classes satisfies it together with the characteristic polynomial
  condition and has no flag in that order; `det(χ₁ ⊕ χ₂)` satisfies the relation for both orders (3.13a, third Check).
- At weight `0` the diagonal characters on inertia are `1, ε⁻¹, …, ε^{1−n}`, which is the shift `ε^{i−1}` of 3.13a (a) (fourth Check).

### Dependencies

PotentialAutomorphyInfrastructurePartII §§0.5, 2.1, 3.1, 3.5, 3.7–3.14; IntegralHeckeAndGaloisDeterminants Layers 0–1, §4.1;
LocalGaloisDeformationRings §1.3; EndoscopicTransferAndUnitaryTraceComparison §6.29; AutomorphicGaloisRepresentationsPartII §AG2.6;
BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1; ModularityAndLanglandsExtensions §2.43; PadicHodgeTheory §3.6;
NoncommutativeAndEquivariantIwasawa §F.6; AutomorphicLFunctionsAndLocalFactors §AL.3.3.8.

## Layer 4: Automorphic patching data at a reducible determinant

This layer gives Taylor–Wiles patching data at the Hecke ideal of Layer 3, allowing coinciding residual Frobenius eigenvalues at the
Taylor–Wiles places.

### 4.2a Automorphic patching data at a reducible residual determinant

In the setting of 3.13a, assume `μ_l ⊄ L`. A *Taylor–Wiles datum* consists of `q ≥ 0`, elements `σ_1, …, σ_q ∈ G_{L(μ_{l^∞})}`, and
for each `N ≥ 1` places `w_{N,1}, …, w_{N,q}` of `L`, above pairwise distinct places `v_{N,1}, …, v_{N,q}` of `L⁺` that split in `L`
and lie outside `S`, of norm `≡ 1 mod l^N`, with Frobenius elements `φ_{N,j}` whose images in `G_{L,S}` satisfy
`χ̄_i(φ_{N,j}) = χ̄_i(σ_j)` for all `i` and all `N` and converge to `σ_j`, as `N` grows, in the largest quotient of `G_{L⁺,S}` in
which the common kernel of the `χ̄_i` and of `ε mod l` is pro-`l`, and generators `τ_{N,j}` of the `l`-part of tame inertia at
`w_{N,j}`; such data exist for every choice of the `σ_j` (Chebotarev). Put `S_N = S ∪ {v_{N,1}, …, v_{N,q}}`. Say that an ideal
`J ⊂ B` has *automorphic patching data* if for every Taylor–Wiles datum there are a `B`-module `M`, finite free over `Λ`, with
`Supp_B M = V(J)`, lifts `u_{j,i} ∈ O` of the `χ̄_i(σ_j)`, an exponent `e`, and for every `N`:

- a complete local noetherian `O`-algebra `R_N` with residue field `k` carrying an ordinary determinant `(D_N, ψ_N)` in the
  sense of 3.13a(1) for the same residual data and the ramification set `S_N` (no condition at the `w_{N,j}`), a map
  `Λ[[x_{j,i}]] → R_N` (`qn` variables) whose restriction to `Λ` is the map given by the inertial characters of `ψ_N`, and
  elements `U_{j,i} ∈ R_N` lifting the `u_{j,i}`; `R_N` is an algebra over the universal ordinary determinant ring for `S_N`,
  not necessarily that ring;
- an `R_N`-module `M_N`, free of finite rank (the rank may depend on `N`) over `Λ[[x_{j,i}]]/((1 + x_{j,i})^{l^{a_{N,j}}} − 1)` for some
  `a_{N,j} ≥ N`;
- a homomorphism `R_N → Sp` carrying `(D_N, ψ_N)` to the pullback of the universal ordinary determinant of `B` along
  `G_{L,S_N} → G_{L,S}` and the `x_{j,i}` to `0`, where
  `Sp = B[[X_{j,i}]]/(∏_i(X − u_{j,i} − X_{j,i}) = charpoly D(φ_{N,j}))` is `B` with ordered roots of
  the characteristic polynomials of `D(φ_{N,j})` adjoined, sending `U_{j,i}` to `u_{j,i} + X_{j,i}`, and maps `Sp ⊗_B M ⇄ M_N/(x)M_N`
  whose two composites are multiplication by `f = ∏_j ∏_{i≠i′}(U_{j,i} − U_{j,i′})(U_{j,i} − Nw_{N,j}·U_{j,i′})`;
- with the exponent `e` above, independent of `N` (one may take `e = n!`): `(f·tr_{D_N}(h·r))^e` kills `M_N` for every `h ∈ G_{L,S_N}` and
  each of the two kinds of elements `r = ∏_i(φ_{N,j} − U_{j,i})` and `r = ∏_{k≠i}(φ_{N,j} − U_{j,k})(τ_{N,j} − 1 − x_{j,i})`.

Prove that the ideal `J` of 3.13a has automorphic patching data. This is a theorem of [FormalProof]. The route of the
existence of the level modules `M_N` and of the two comparison maps is not given here; the relations have the route below.

*Outline of the mechanism.* For the finite set `Q_N = {w_{N,j}}`, the module `P_{Q_N}` of ordinary forms at Iwahori-type level at the
places of `Q_N` (the pro-`l` part of the diagonal of the Iwahori subgroup) with its smooth action of `∏_j GL_n(L_{w_{N,j}})`: its
invariants under the pro-`l` Iwahori subgroup are finite over `Λ` and projective over the group ring of the diamond group (PotentialAutomorphyInfrastructurePartII §3.4, the
level at `v₀` making the action free), its invariants under the maximal compact subgroup are `M`, and it is detected by its
classical specializations. The ring `R_N` acts through its image in the Hecke algebra; the `U_{j,i}` are the eigenvalues of the
`U`-operators at `w_{N,j}` on the ordinary projection, ordered (PotentialAutomorphyInfrastructurePartII §4.2 for the parahoric projection); the comparison maps are the
parahoric projection and its adjoint, whose composite is the product of the differences of the ordered eigenvalues because the
residual eigenvalues need not be distinct. The construction of the level modules and of the two maps at Iwahori level is not written here. *The relations.* At a Taylor–Wiles place `w`, for an irreducible smooth `π` of
`GL_n(L_w)` with a vector fixed by the pro-`l` Iwahori subgroup and matching `ρ|_{W_{L_w}}`, and a generalized eigencharacter of the
`U`-operators with normalized eigenvalues `α_i`, pairwise distinct and with no ratio `Nw`: the characteristic polynomial of
`ρ(Frob_w)` is `∏(X − α_i)`, and `∏_{k≠i}(ρ(Frob_w) − α_k)(ρ(τ_w) − χ(δ_i)) = 0` (local–global compatibility
at the Taylor–Wiles places, a theorem of the literature; its route is not given here). Hence `f·tr_{D_N}(h·r)` vanishes at every generalized eigencharacter of
every classical point (where `f ≠ 0` the eigenvalues are generic); already the factor of `f` at the place of `r` suffices. An
element of the polynomial ring in the `U`-operators and diamond operators at one place, with coefficients in `R_N`, that vanishes
at every generalised eigencharacter of every classical point has `n!`-th power zero on the level module: the invariants of an
irreducible smooth representation of `GL_n(L_w)` under the subgroup of the Iwahori subgroup defined by a subgroup of the diagonal
residues have dimension at most `n!` (a theorem of the literature, from the geometrical lemma of Bernstein and Zelevinsky
[BZ77], §2.12, and the finite length of Jacquet modules; its route is not given here), a polynomial in commuting operators on a space of dimension `d`
vanishing at all joint eigencharacters has `d`-th power zero (if not, the image of its `d`-th power, stable under the operators,
contains a joint eigenvector, on which the polynomial acts by its value `0`, so a further power kills it, a contradiction), and
the level module is separated by its classical points. The exponent does not depend on the number of Taylor–Wiles places.
The remaining steps of the route are not given here. *Needs:* 3.13a; PotentialAutomorphyInfrastructurePartII §§3.4, 4.1, 4.2;
IntegralHeckeAndGaloisDeterminants §1.3; Chebotarev Layer 10.

**Checks.**

- When the `χ̄_i(σ_j)` are pairwise distinct, `f` is a unit and the data are those of PotentialAutomorphyInfrastructurePartII §4.2 with a residual eigenspace; the
  factor `f` is what allows coinciding residual eigenvalues, the points used being those at which the eigenvalues differ.
- The `U_{j,i}` lift elements `u_{j,i}` of `O` given once for each datum, independent of `N`; `Sp` is finite over `B`, not étale, when the
  `χ̄_i(σ_j)` coincide.

### Examples

- When the `χ̄_i(σ_j)` are pairwise distinct, `f` is a unit and the data of 4.2a are those of PotentialAutomorphyInfrastructurePartII
  §4.2 with a residual eigenspace; when they coincide, `Sp` is finite over `B` and not étale (4.2a, Checks).

### Dependencies

Layer 3 (3.13a); PotentialAutomorphyInfrastructurePartII §§3.4, 4.1, 4.2; IntegralHeckeAndGaloisDeterminants §1.3;
Chebotarev Layer 10.

## Layer 9: Adjoint vanishing at irreducible points

This layer proves the vanishing of adjoint Bloch–Kato Selmer groups at automorphic points irreducible on every open subgroup, in
rank at most three and for `GSp₄`, and at irreducible ordinary points with regular elements in ranks two to four.

### 9.9 Adjoint vanishing at strongly irreducible points, and at irreducible points with regular elements

(a) Let `F` be an imaginary CM field, `n ∈ {2, 3}`, and `r : G_{F⁺} → 𝒢_n(O)` with `ρ = r|_{G_F}` attached to a regular algebraic
conjugate self-dual cuspidal representation `Π` of `GL_n(𝔸_F)`, with `ρ` irreducible on every open subgroup of `G_F`. Prove
`H¹_f(F⁺, ad r) = 0`, `ad r` the adjoint representation of `G_{F⁺}` on `𝔤𝔩_n` through `r` (conjugation on `G_F`, and complex conjugation
acting through the polarization, PotentialAutomorphyInfrastructurePartII §9.3).

(b) Let `ρ : G_ℚ → GSp₄(E)` be irreducible on every open subgroup of `G_ℚ`, and automorphic over an imaginary quadratic field `F`:
`ρ|_{G_F}` attached to a regular algebraic cuspidal representation of `GL₄(𝔸_F)`. Prove `H¹_f(ℚ, 𝔰𝔭₄(ρ)) = 0`, `𝔰𝔭₄(ρ)` the adjoint
representation of `Sp₄` composed with `ρ`.

(c) Let `F` be imaginary quadratic with character `η_F` and `W : G_ℚ → GL₂(E)` with `det W = η_F` (times a power of the cyclotomic
character), such that `W|_{G_F}` satisfies the hypotheses of (a) for `n = 2`. Prove `H¹_f(ℚ, ad W) = 0`.

(a), (b) and (c) are statements of this roadmap, consequences of the theorem of Newton and Thorne [NT23]
(ModularityAndLanglandsExtensions §4.1); they are not statements of [FormalProof].

(d) (*a theorem of [FormalProof]*) Let `p` be odd, `L` a CM field with `L/L⁺` unramified at all finite places, `μ_p ⊄ L`, and every place of
`L⁺` above `p` split in `L`; let `ρ = r|_{G_L}` be attached to a regular algebraic conjugate self-dual cuspidal representation of
`GL_n(𝔸_L)`, `2 ≤ n ≤ 4`, automorphic in the sense of 3.13a (f) (with its clauses (w1), (w2)), ordinary at every place `w` of
`L` above `p` with inertial characters `ε^{m_{w,i}}` up to finite order, `m_{w,1} > ⋯ > m_{w,n}` (the exponents may depend on `w`),
with
residual representation a sum of pairwise distinct characters; assume that `ρ` is unramified outside a finite set `S` of places
split in `L`, trivial on every inertia element at the places of `S` prime to `p` at which all the residual characters are trivial,
and unramified at an auxiliary place `v₀` as in 3.13a, of prime norm, at which the residual characters agree and are unramified
and `Nv₀ ≢ 1 mod p`. Assume moreover: (i) at each place above `p` some element of the decomposition group in the kernel of `ε` has
ordinary characters whose ratios have infinite order; (ii) `ρ|_{G_{L(μ_{p^∞})}}` is absolutely irreducible; (iii) every nonempty open
subset of `G_{L(μ_{p^∞})}` contains an element at which `ρ` has separable characteristic polynomial. Prove `H¹_f(L⁺, ad r) = 0`. The
hypothesis `μ_p ⊄ L` is a hypothesis of the statement of [FormalProof].

(d′) Under the hypotheses of (d), let `Λ → B_det` be the weight algebra of the universal ordinary determinant ring of 3.13a(1)
(a power series ring over `O`) and `J₀` the Hecke ideal, with `B_det/J₀` finite and torsion-free over `Λ`. If moreover the cyclotomic
exponents of `ρ` at each place above `p` differ by at least `2`, then every point derivation of `B_det` at the point of `ρ` (a point
of `V(J₀)` by 3.13a(f)) that vanishes on `Λ` is zero, and every prime of `B_det` contained in the kernel of that point contains
`J₀`. This rests on (d). (d′) in this generality is a statement of this roadmap and not a statement of [FormalProof], which
has it in rank four only, at the seeds (Downstream consumers).

*Route.* (a) If `ρ` is irreducible on every open subgroup of `G_F`, the identity component of the Zariski closure of its image
acts irreducibly, hence so does its derived group, which lies in the Zariski closure of the image of every open subgroup
of `G_{F(μ_{p^∞})}` (the quotient by that group is abelian). In rank at most three that derived group is `SL_n` or, for `n = 3`,
the image of `SL₂` under the symmetric square; in both cases the image of `G_{F(μ_{p^∞})}` is enormous (ArithmeticGaloisRepresentations
§7.10), and ModularityAndLanglandsExtensions §4.1 (Newton–Thorne [NT23], Theorem A, p. 2 of arXiv v3) applies after the twist into unitary type
(AutomorphicGaloisRepresentationsPartII §AG2.2) and gives `H¹_f(F⁺, ad r) = 0`. (b) `ρ|_{G_F}` is conjugate self-dual up to twist, with
`𝒢₄`-valued extension `r`. The derived group of the identity component of the Zariski closure of the image of an open
subgroup acts irreducibly inside `GSp₄`, so it is `Sp₄` or the image of `SL₂` under the symmetric cube (`SL₂ × SL₂` acting by the
tensor product preserves a symmetric form, not an alternating one, and does not occur). Both are enormous: for `Sp₄`, with
`h = diag(a, b, b⁻¹, a⁻¹)` regular, the eigenprojection on the eigenvalue `a` has a nonzero component in each of the three simple
summands `1`, `𝔰𝔭₄`, `∧²₀` of `𝔤𝔩₄`; for the symmetric cube this is Newton–Thorne's symmetric power example (ArithmeticGaloisRepresentations
§7.10). ModularityAndLanglandsExtensions §4.1 gives `H¹_f(ℚ, ad r) = 0`, and `𝔰𝔭₄(ρ)` is the summand of `ad r` on which complex conjugation
acts through `ρ` (the complementary summand `∧²₀ ⊕ 1` is twisted by `η_F`); with `H¹_f(ℚ, ℚ_p) = 0` this gives (b). (c) For the
`𝒢₂`-valued extension `r` of `W|_{G_F}` with `r(c)` built from `W(c)` and the alternating form, `ad r ≅ ad⁰W ⊕ η_F` as `G_ℚ`-modules;
`H¹_f(ℚ, η_F) = 0` (finiteness of the class group of `F`) and `H¹_f(ℚ, ℚ_p) = 0`, so `H¹_f(ℚ, ad W) = H¹_f(ℚ, ad⁰W) = H¹_f(ℚ, ad r) = 0` by
(a). (d) *Outline of the mechanism.* The hypotheses do not give an enormous image in general (an irreducible group need not
contain regular elements: ArithmeticGaloisRepresentations §7.10, Check), so ModularityAndLanglandsExtensions §4.1 is not applied; the mechanism is a count at
the characteristic-zero point, with (ii) and (iii) in place of enormity. A Bloch–Kato class of `ad r` is, at each place above `p`,
an ordinary deformation with fixed inertial characters (a local statement, using (i) and the regular weights), and away from `p`
a coboundary on inertia. The statement reduces in two steps to points at which no two ordinary characters are in ratio `ε` on
the decomposition groups and to cocycles with fixed inertial characters. Put the point on the Hecke side: after normalizing `ρ` to an integral point, 3.13a(f) puts it in `V(J)`
for the residual sum of characters, with the auxiliary place `v₀`, and 4.2a gives the patching data. By (ii) and (iii) finitely
many `σ_j ∈ G_{L(μ_{p^∞})}` at which `ρ` is regular semisimple detect the dual classes: a cocycle `z` of `ad ρ ⊗ ε` with
`tr(z(σ_j)ρ(σ_j)^k) = 0` for all `j, k` is a coboundary (the span of `ρ(G_{L(μ_{p^∞})})` is all of `M_n`, and derivations of a matrix
algebra are inner). At every arithmetic point `x`, an element of the algebra generated by the characteristic polynomial
coefficients a power of which kills `M/𝔭_xM` already kills it (control, and semisimplicity of the unramified Hecke operators on
classical forms); with integrality over `Λ` and the fact that a derivation killing traces kills the ordinary characters, this
gives `t` with `x(t) ≠ 0` such that `t·ker x` kills `M/𝔭_xM`. Then, at one Taylor–Wiles level `N ≫ m`, with no patching limit:
derivations modulo `ϖ^m` dual to the `n[L⁺:ℚ]` weight variables and to the `nq` Taylor–Wiles variables exist up to a constant;
each derivation gives a Selmer cocycle modulo `ϖ^m` with the same trace function; a further derivation at `x` killing the weights
and not the traces would give `|k|^{m(1 + n[L⁺:ℚ] + nq) − C}` trace functions, against the Selmer bound `|k|^{m(n[L⁺:ℚ] + nq) + C}`
(the Greenberg–Wiles formula, the dual term killed by detection). So the ordinary determinant ring is unramified over the weight
algebra at the point, which is the vanishing of the ordinary, hence of the Bloch–Kato, adjoint Selmer group. The derivations
dual to the variables, detection in characteristic zero, and the local statement on Bloch–Kato classes are not written here;
the remaining steps of the route of (d) are not given here. (d′) A point derivation of `B_det` at the point vanishing on `Λ` is a first-order deformation of `ρ` with constant inertial
characters, trivial on the tame inertia killed residually and unramified at `v₀`; its cocycle is, at each place above `p`, an
extension of crystalline characters whose cyclotomic exponents differ by at least `2` in the ordinary order, hence a
Bloch–Kato cocycle (`H¹_f = H¹` for such a character; with a gap of `1` this can fail), so it is a coboundary by (d) and the
derivation is zero. Then the embedding dimension of the local ring of `B_det` at the kernel `𝔭` of the point is at most
`dim Λ − 1`, since point derivations inject into those of `Λ`; the quotient by `J₀` has at least that dimension, by going-down
for the finite torsion-free extension `Λ → B_det/J₀` of a normal domain, `𝔭 ∩ Λ` having height `dim Λ − 1`; so the local ring is
regular of that dimension, a domain equal to its quotient by `J₀`, and `J₀` vanishes in it: each element of `J₀` is killed by an
element outside `𝔭`, hence lies in every prime contained in `𝔭`. *Needs:* 3.13a, 4.2a; PotentialAutomorphyInfrastructurePartII §§9.3, 9.8; ModularityAndLanglandsExtensions
§4.1; ArithmeticGaloisRepresentations §7.10; AutomorphicGaloisRepresentationsPartII §AG2.2; ArithmeticGaloisDuality §R02.5.1;
Chebotarev Layer 10.

**Checks.**

- For `ρ = Sym²` of a non-CM newform restricted to `G_F`, (a) applies: the image is irreducible on every open subgroup, of rank
  three; for `ρ` induced from a character of a cubic extension it is irreducible on `G_F` but not on an open subgroup, and (a)
  says nothing.
- `n = 1` is excluded: `H¹_f(F⁺, ad ρ) = 0` there is the class-group statement of PotentialAutomorphyInfrastructurePartII §9.3's first Check.
- In (b) the adjoint module matters: `𝔤𝔩₄(ρ) = 𝔰𝔭₄ ⊕ ∧²₀ ⊕ 1` over `G_ℚ` contains `∧²₀(ρ)`, which is not a summand of `ad r` without
  the twist by `η_F`.
- In (d), (ii) alone is not enough for the detection step: a group acting irreducibly can contain no regular semisimple
  element, and then no finite set of trace functionals at regular elements is available; (iii) is a separate hypothesis.
- In (d) the conditions on the places above `p`, on the ramification and on `v₀` are those under which 3.13a(f) and 4.2a put the
  point on the Hecke side; at points pure in the sense of weights, (i) holds automatically (the ratio of two ordinary characters
  at a Frobenius lift in the kernel of `ε` has complex absolute value a nonzero power of the norm).
- Ordinarity is not a hypothesis of (a)–(c): Newton–Thorne's theorem needs none, and the routes do not use it.

### Examples

- For `ρ = Sym²` of a non-CM newform restricted to `G_F`, 9.9 (a) applies; for `ρ` induced from a character of a cubic extension,
  irreducible on `G_F` but not on an open subgroup, it says nothing (first Check).
- For `n = 1` the vanishing is the class-group statement of the first Check of PotentialAutomorphyInfrastructurePartII §9.3 (second
  Check).
- Over `G_ℚ`, `𝔤𝔩₄(ρ) = 𝔰𝔭₄ ⊕ ∧²₀ ⊕ 1`, and `∧²₀(ρ)` is a summand of `ad r` only after the twist by `η_F` (third Check).

### Dependencies

Layers 3 and 4 (3.13a, 4.2a); PotentialAutomorphyInfrastructurePartII §§9.3, 9.8; ModularityAndLanglandsExtensions §4.1;
ArithmeticGaloisRepresentations §7.10; AutomorphicGaloisRepresentationsPartII §AG2.2; ArithmeticGaloisDuality §R02.5.1;
Chebotarev Layer 10.

## Layer 10: Tate–Shafarevich kernels with lattice coefficients

This layer defines the kernels of localization on the Galois cohomology of a number field with finite, divisible and lattice
coefficients, with vanishing imposed at a chosen subset of the ramification set, and proves their duality, structure and change
of the two sets of places.

### 10.1 Sha kernels with lattice and divisible coefficients

Let `F` be a number field, `p` a prime, `S` a finite set of places of `F` containing the places above `p` and the
infinite places, and `Σ ⊂ S`. Let `T` be a finite free `ℤ_p`-module (or `O`-module, `O` the integers of a finite
extension of `ℚ_p`) with continuous `G_{F,S}`-action, `V = T ⊗ ℚ_p`, `W = V/T`, and `T^D = Hom(T, ℚ_p/ℤ_p)(1)`. For a finite
discrete `G_{F,S}`-module `M` killed by a power of `p`, and for `M = W`, define

```text
Ш¹_{S;Σ}(F, M) = ker( H¹(G_{F,S}, M) → ∏_{v∈Σ} H¹(F_v, M) ),          Ш¹_S(F, M) = Ш¹_{S;S}(F, M),
Ш²_S(F, T)     = ker( H²(G_{F,S}, T) → ∏_{v∈S} Ĥ²(F_v, T) ),
```

with the continuous cohomology of ArithmeticGaloisDuality §D7.6 and the modified groups at real places of ArithmeticGaloisDuality §R02.4.2; for finite `M`, `Ш¹_S(F, M)` is the
group of ArithmeticGaloisDuality §R02.4.2, and `Ш¹_{S;Σ}` imposes vanishing only at the places of `Σ`. Their lengths `length_{ℤ_p}` (or
`length_O / e_O`) take values in `ℕ∞`.

Prove:

(a) *Limits.* `Ш¹_{S;Σ}(F, W) = colim_n Ш¹_{S;Σ}(F, W[p^n])` and `Ш²_S(F, T) = lim_n Ш²_S(F, T/p^n)`, compatibly with the
transition maps.

(b) *Duality.* The finite-level pairings of ArithmeticGaloisDuality §R02.4.3(a) pass to the limit and give a perfect pairing
`Ш¹_S(F, T^D) × Ш²_S(F, T) → ℚ_p/ℤ_p`, so `Ш²_S(F, T) ≅ Ш¹_S(F, T^D)^∨`; in particular
`length Ш¹_S(F, T^D) = length Ш²_S(F, T)`. Real places are included in both kernels.

(c) *Structure.* `Ш²_S(F, T)` is finitely generated over `ℤ_p` and `Ш¹_S(F, W)` is cofinitely generated; `Ш²_S(F, T)` is finite
exactly when `Ш¹_S(F, T^D)` is.

(d) *Change of the vanishing set.* For `Σ ⊂ Σ′ ⊂ S`, `Ш¹_{S;Σ′} ⊂ Ш¹_{S;Σ}` and the quotient embeds in `∏_{v∈Σ′∖Σ} H¹(F_v, W)`;
for `p` odd the real places contribute nothing.

(e) *Change of the ramification set.* If `S ⊂ S′` and, at every `v ∈ S′ ∖ S`, `W` is unramified with
`H¹_ur(F_v, W) = W/(Frob_v − 1)W = 0`, then inflation identifies `Ш¹_{S;Σ}(F, W)` with `Ш¹_{S′;Σ∪(S′∖S)}(F, W)`. This applies
to `W = ℚ_p/ℤ_p(−e)`, `e ≠ 0`, at every finite `v ∤ p`, where `Frob_v` acts by `Nv^{−e} ≠ 1` on a divisible group.

(f) *Functoriality.* Restriction and corestriction along finite extensions `F′/F`, and maps of lattices, preserve the
kernels; the kernel of restriction `Ш¹_{S;Σ}(F, W) → Ш¹_{S′;Σ′}(F′, W)` (`S′, Σ′` the places above `S, Σ`) lies in
`H¹(Gal(F′/F), W^{G_{F′}})` when `F′/F` is Galois.

These definitions and (a)–(f), in this generality, are statements of this roadmap, classical consequences of Poitou–Tate
duality (ArithmeticGaloisDuality §§R02.4.3, D7.6), and not statements of [FormalProof]. [FormalProof] has one instance only:
`T = ℤ_p(e+1)` and `W = ℚ_p/ℤ_p(−e)` for an integer `e`, the ramification set formed by the places above `p` and the infinite
places, vanishing imposed at the places above `p` only, and (b) as the equality of lengths when `p` is odd or `F` is totally
complex, with no real place in either kernel.

*Route.* (a) Filtered colimits are exact on discrete modules and `H¹(G_{F,S}, W) = colim_n H¹(G_{F,S}, W[p^n])`;
inverse limits of finite groups are exact, and the Milnor sequence of ArithmeticGaloisDuality §D7.6 with finite finite-level groups gives
`H²(G_{F,S}, T) = lim_n H²(G_{F,S}, T/p^n)`, and likewise locally. (b) ArithmeticGaloisDuality §R02.4.3(a) at each finite level, with the
identification `Hom(T/p^n, μ_{p^n}) = T^D[p^n]` and the naturality of the Poitou–Tate pairing in the coefficients;
Pontryagin duality turns the colimit into the limit (*Character duality for the arithmetic topological groups*,
ArithmeticGaloisDuality §R02.4.2). (c) `H²(G_{F,S}, T)` is finitely generated (ArithmeticGaloisDuality §R02.4.4 at finite levels and the limit) and `H¹(G_{F,S}, T^D)` is
cofinitely generated; the finiteness statement is (b). (d)–(f) Inflation–restriction (ProfiniteCohomology §5.4), corestriction
(ProfiniteCohomology Layer 6), and the unramified local groups of ArithmeticGaloisDuality §R02.4.2. *Needs:* ArithmeticGaloisDuality §§R02.1.2, R02.4.2, R02.4.3, R02.4.4, D7.6; ProfiniteCohomology §5.4 and Layer 6.

**Checks.**

- At `p = 2` the real-place condition is not vacuous: complex conjugation acts on `ℚ₂/ℤ₂(−e)` by `(−1)^e`, so
  `H¹(ℝ, ℚ₂/ℤ₂(−e))` is `ℤ/2` for even `e` and `0` for odd `e`. For odd `p` every real local group vanishes, so
  `Ш¹_{S;S_p} = Ш¹_S` by (d) when `S = S_p ∪ S_∞` (`S_p` the places above `p`, `S_∞` the infinite places). With another finite
  place in `S` the two differ: for `F = ℚ`, `p = 3` and `S = {3, 61, ∞}`, a cubic character of conductor `61`, as a class in
  `H¹(G_{ℚ,S}, ℚ₃/ℤ₃)`, is trivial on the decomposition group at `3`, since `3²⁰ ≡ 1 mod 61` makes `3` a cube modulo `61`, so it
  lies in `Ш¹_{S;S_3}(ℚ, ℚ₃/ℤ₃)`; it is ramified at `61`, whereas `Ш¹_S(ℚ, ℚ₃/ℤ₃) = 0`, its classes being unramified everywhere.
- (e) fails at `e = 0`: `H¹_ur(F_v, ℚ_p/ℤ_p) = ℚ_p/ℤ_p ≠ 0`, and enlarging `S` can add unramified-at-`v` classes that are
  nontrivial at `v`.
- `F = ℚ`, `S = {p, ∞}`: `Ш¹_S(ℚ, ℚ_p/ℤ_p) = 0`, since a character of `G_{ℚ,S}` of `p`-power order factors through
  `Gal(ℚ(μ_{p^∞})/ℚ)` (Kronecker–Weber: the maximal abelian extension of `ℚ` unramified outside `p∞` is `ℚ(μ_{p^∞})`) and the
  decomposition group at `p` is all of that group; by (b), with `T = ℤ_p(1)`,
  `T^D = ℚ_p/ℤ_p`, also `Ш²_S(ℚ, ℤ_p(1)) = 0`.
- (c) does not compare `Ш²_S(F, T)` with `Ш¹_S(F, W)`: for `T = ℤ_p(1)`, `Ш²_S(F, ℤ_p(1))` is dual to `Hom(Cl_S(F), ℚ_p/ℤ_p)`, finite,
  while `Ш¹_S(F, ℚ_p/ℤ_p(1))` is dual to `Ш²_S(F, ℤ_p)`, whose rank is the Leopoldt defect of `(F, p)`.

### Examples

- For `F = ℚ` and `S = {p, ∞}`, `Ш¹_S(ℚ, ℚ_p/ℤ_p) = 0`, and by 10.1 (b) with `T = ℤ_p(1)` also `Ш²_S(ℚ, ℤ_p(1)) = 0` (10.1, third Check).
- For `T = ℤ_p(1)`, `Ш²_S(F, ℤ_p(1))` is dual to `Hom(Cl_S(F), ℚ_p/ℤ_p)` and finite, while `Ш¹_S(F, ℚ_p/ℤ_p(1))` is dual to
  `Ш²_S(F, ℤ_p)`, whose rank is the Leopoldt defect of `(F, p)` (fourth Check).
- At `p = 2`, `H¹(ℝ, ℚ₂/ℤ₂(−e))` is `ℤ/2` for even `e` and `0` for odd `e`, so the condition at the real places is not vacuous (first Check).

### Dependencies

ArithmeticGaloisDuality §§R02.1.2, R02.4.2, R02.4.3, R02.4.4, D7.6; ProfiniteCohomology §5.4 and Layer 6. No earlier layer is used.

## Downstream consumers

- UniformWildKernelBounds §1.1 uses 10.1.
- UniformWildKernelBounds §3.11 (ord) imposes ordinarity on a representation with a reducible determinant, not on the determinant
  (third Check of 3.13a).
- UniformWildKernelBounds §3.15 uses the ring `B` of 3.13a and the patching data of 4.2a, in the definition of its hypothesis.
- UniformWildKernelBounds §3.16 (h) uses 3.13a with tame places of `S_t` at which all the `χ̄_i` are ramified through the same
  character, the type at `S_t` being `⊕Teich(χ̄_i)|_I`.
- UniformWildKernelBounds §3.20 (e), the Hecke ideal of a layer in rank four (the sum of the extended Hecke ideals at two auxiliary
  places), uses 3.13a for finiteness, weak purity, automorphy and seeds as points, 3.13a (g) in its clause (inv), 4.2a, and
  9.9 (d′), through 9.9 (d), at the seed.
- UniformWildKernelBounds §4.2 uses 3.13a (finiteness, automorphy, seeds) and 4.2a; UniformWildKernelBounds §4.4 uses 3.13a through
  UniformWildKernelBounds §3.20 (e); UniformWildKernelBounds §4.5 uses 3.13a, 4.2a, and 9.9 (a) over `ℚ(i)`.
- UniformWildKernelBounds §4.3 uses 9.9 (a) at type I points and 9.9 (c) at the rank-two block of type II points;
  UniformWildKernelBounds §4.7 uses 9.9 (b) at points irreducible on every open subgroup and 9.9 (d) over the tower field at the
  other irreducible points. These consumers use 3.13a (f) in the range `2 ≤ n ≤ 4`.
- BernoulliBoundsForClassGroupEigenspaces §6.17 uses 10.1 for the groups `Ш¹(F, ℓ, e) = Ш¹_{S;S_ℓ}(F, ℚ_ℓ/ℤ_ℓ(−e))`,
  `S = S_ℓ ∪ S_∞`, and their duality with étale wild kernels.
- CongruenceModulesOfThetaLifts §7.7b uses 10.1.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

It owns 3.13a, 4.2a, 9.9 and 10.1. The theory they extend is owned by PotentialAutomorphyInfrastructurePartII (definite unitary groups, algebraic modular forms and big ordinary Hecke algebras in its Layer 3; Taylor–Wiles data and patching in its Layer 4; adjoint Bloch–Kato Selmer groups in its Layer 9) and by [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md) (Poitou–Tate duality in its Layers R02.4 and D7). The targets above differ from the nearest statements of their homes as follows.

- 3.13a and 4.2a concern other maximal ideals than PotentialAutomorphyInfrastructurePartII §§3.13 and 4.2. PotentialAutomorphyInfrastructurePartII §3.13 (2) constructs the lift `r_𝔪` over the localized big ordinary Hecke algebra, its ordinarity and the classifying map only for a non-Eisenstein maximal ideal `𝔪`, and PotentialAutomorphyInfrastructurePartII §4.2 uses a residual eigenspace. At the maximal ideals of 3.13a the residual determinant is that of a sum of characters, the Hecke algebra carries a determinant, not a representation, and the comparison with deformation theory is through the universal ordinary determinant ring.
- 10.1 is not in ArithmeticGaloisDuality. ArithmeticGaloisDuality §R02.3.0d defines `Ш^i_S(K, A)` for finite `A` with vanishing imposed outside `S`; ArithmeticGaloisDuality §R02.4.2 defines `Ш^r_S(K, M) = ker(H^r(G_S, M) → P^r_S(K, M))` for finite `M`, with vanishing imposed at every place of the ramification set `S`, archimedean places included; ArithmeticGaloisDuality §D7.6 has the Poitou–Tate sequences for a lattice `T` and for `V/T`, but no kernel for divisible coefficients, no length, and no kernel in which the ramification set and the set of places where vanishing is imposed differ. 10.1 gives these, for instance for classes unramified outside `p` (ramification set `S_p ∪ S_∞`) that vanish at the places above `p` only.
- The automorphy statements for residually reducible deformation rings whose routes pass through 3.13a, 4.2a and 9.9, and the machinery of those routes, are not stated here: their residual representations have constituents exchanged by the polarization, there is no Steinberg place, and the functors are representable only after framing. They belong to UniformWildKernelBounds, which uses these targets. PotentialAutomorphyInfrastructurePartII §§7.6–7.19 and 8.1–8.16 state the published analogues under Schur, primitivity and Steinberg hypotheses.

The existence of the level modules and of the comparison maps in 4.2a, and 9.9 (d), are theorems of [FormalProof]; their routes are outlined at the targets, and the steps not written out are said there to be not given here. Two theorems of the literature inside the route of 4.2a, local–global compatibility at the Taylor–Wiles places and the bound `n!` from the work of Bernstein and Zelevinsky [BZ77], are cited without their proofs.

The users of these targets in this family are UniformWildKernelBounds, BernoulliBoundsForClassGroupEigenspaces and CongruenceModulesOfThetaLifts (Downstream consumers, above).

## Exact supplier contracts

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

- §0.5: an automorphic representation of level potentially prime to `l` whose Galois representation is ordinary at every place above `l` is `ι`-ordinary, for every `n`, used in the route of 3.13a (f).
- §2.1: the group `𝒢_n` (only the group is used; the residual representations of the consumers are not Schur in the sense of that section).
- §3.1: the definite unitary group `G` in `n` variables for `L/L⁺`.
- §3.4: exactness and freeness over the group ring of the diamond group at level without `l`-torsion, used in the outline of 4.2a.
- §3.5 (1): descent of automorphic representations from `GL_n` to `G`, for every `n`, used in the route of 3.13a (f).
- §3.7: the Hecke polynomials of the spherical operators `T_w^j`.
- §§3.8–3.9: Iwahori levels at `l`, the `U`-operators, ordinary parts, and the big ordinary Hecke algebra over `Λ` of universal weight.
- §§3.10–3.11: ordinary deformation data, and finite freeness of ordinary forms over `Λ` when the level at `v₀` makes the arithmetic subgroups act freely.
- §3.12: Hida classicality and control, with its first Check (points above arithmetic primes).
- §3.13: the `Λ`-adic Galois representation at non-Eisenstein maximal ideals, with its first Check (the diagonal characters at weight `0`).
- §3.14 (b): from Hecke eigensystems to regular algebraic conjugate self-dual cuspidal representations of `GL_n(𝔸_L)`, used for 3.13a (e).
- §§4.1–4.2: Taylor–Wiles data with a residual eigenspace, Taylor–Wiles level structures and the parahoric projection.
- §9.3: the adjoint Bloch–Kato Selmer group of a conjugate self-dual representation, with its first Check (the case `n = 1`).
- §9.8: ordinary tangent vectors of trivial weight lie in `H¹_g`.

### From TauCetiRoadmap.ArithmeticGaloisDuality

- §R02.1.2: continuous cochains into inverse limits.
- §R02.4.2: the local terms, the modified groups at real places, the kernels `Ш^r_S(F, M)` for finite `M`, character duality for the arithmetic topological groups, and the unramified local groups.
- §R02.4.3 (a): the Poitou–Tate pairings at finite level, natural in the coefficients.
- §R02.4.4: finiteness of `H²(G_{F,S}, M)` for finite `M`.
- §R02.5.1: the Greenberg–Wiles formula, used in the outline of 9.9 (d).
- §D7.6: continuous cohomology with lattice coefficients, the Milnor sequence, and the Poitou–Tate sequences for `T` and `V/T`.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

- Layers 0–1: continuous determinants, their traces and characteristic polynomials, Amitsur's formula, and Cayley–Hamilton quotients.
- §1.3: over a henselian base with residually pairwise distinct characters the Cayley–Hamilton quotient is a generalized matrix algebra of type `(1, …, 1)` (Chenevier's Theorem 2.22(ii)), used in the route of 3.13a (b).
- §4.1: Chenevier's gluing of continuous determinants over a compact coefficient ring from a jointly injective family of coefficient rings, used in the route of 3.13a (a).

### From TauCetiRoadmap.LocalGaloisDeformationRings

- §1.3: the universal rings of inertial characters, a power series ring over `O` in `n[L⁺:ℚ]` variables in the setting of 3.13a.
- §7.4: over a field, a representation with pairwise distinct prescribed characters satisfying the characteristic-polynomial and ordered-product identities has a full flag with those ordered characters, cited in the third Check of 3.13a.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §6.29: the weak base change of an automorphic representation of `G` to `GL_n` is an isobaric sum of Speh blocks, used for the Speh shape in 3.13a (d).

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- §AG2.2: the twist of a polarized representation into unitary type, used in the route of 9.9 (a).
- §AG2.6: full polarized local–global compatibility at `ℓ`, used in the route of 3.13a (c), (d) and (f).

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

- §2.43: the hypothesis of the local–global compatibility of AutomorphicGaloisRepresentationsPartII §AG2.6.
- §4.1: Newton and Thorne's vanishing of adjoint Bloch–Kato Selmer groups when the image of `G_{F(μ_{p^∞})}` is enormous, used in the routes of 9.9 (a)–(c).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- §AL.3.3.8: the Jacquet–Shalika bound for the Satake parameters of cuspidal representations, used for the eigenvalue bound of 3.13a (d).

### From TauCetiRoadmap.PadicHodgeTheory

- §3.6: labelled ordinary flags and their characters, used in the route of 3.13a (c) to obtain a full flag when the valuations of Frobenius lie on the Hodge polygon.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

- §F.6: the comparison after Berger's theorem used with PadicHodgeTheory §3.6 in the route of 3.13a (c).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §7.10: enormous images, with its Check (an irreducible group need not contain regular elements), used in the routes of 9.9.

### From TauCetiRoadmap.ProfiniteCohomology

- §5.4: inflation–restriction, used in the route of 10.1 (d)–(f).
- Layer 6: corestriction along open subgroups, used in the route of 10.1 (f).

### From TauCetiRoadmap.Chebotarev

- Layer 10: the Chebotarev density theorem in Dirichlet density, used for the existence of Taylor–Wiles places in 4.2a and in the outline of 9.9 (d).

### From BaseChangeAndGaloisRepresentationsForUnitaryGroups, a sub-roadmap of this family

- §16.1: the Galois representations attached to automorphic representations of definite unitary groups, used in the route of 3.13a (d); its hypothesis `[L⁺ : ℚ] ≥ 2` holds in the setting of 3.13a.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The existence of the level modules and comparison maps in 4.2a, and 9.9 (d), are theorems of it.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- [BZ77] I. N. Bernstein and A. V. Zelevinsky, *Induced representations of reductive p-adic groups I*, Annales scientifiques de l'École Normale Supérieure 10 (1977), 441–472, [Numdam](http://archive.numdam.org/article/ASENS_1977_4_10_4_441_0.pdf). The bound `n!` in the route of 4.2a.
- [Che14] G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*, in Automorphic Forms and Galois Representations, vol. 1, LMS Lecture Note Series 414 (2014), 221–285; arXiv:0809.0415v2. [Open preprint](https://arxiv.org/abs/0809.0415v2). Noetherianity of the universal ring of determinants under Mazur's finiteness condition, in the route of 3.13a.
- [NT23] J. Newton and J. A. Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, Journal of the European Mathematical Society 25 (2023), 1919–1967; arXiv:1912.11265v3. [Open preprint](https://arxiv.org/abs/1912.11265v3). The vanishing theorem used in the routes of 9.9 (a)–(c).

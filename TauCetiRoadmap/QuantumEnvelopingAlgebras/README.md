# Quantum enveloping algebras: full root data, integral PBW, and Frobenius

## Scope and placement

This roadmap develops generic quantized enveloping algebras, their integral
forms, and finite-type root-of-unity algebra maps. It complements
`QuantumGroups`: Q8 supplies the generic rank-one `U_q(sl₂)` comparison, not a
higher-rank presentation or specialization theorem. The suggested Lean
signatures illustrate the full-lattice Cartan input, free-algebra relation
quotient, universal map, and native Hopf-algebra construction; the milestone
contracts below are definitive. This algebraic roadmap does not replace the
compact C*-algebra programme.

The dependency order is fixed:

1. a general Kac–Moody/root-data realization supplies the actual lattices and
   Cartan pairing;
2. this owner constructs the generic quantum algebra, Hopf structure,
   triangular decomposition and positive/negative pairing;
3. the Kac–Moody module owner consumes those maps for generic integrable
   modules, crystals and the path comparison;
4. finite-type integral PBW/specialization and root-of-unity Frobenius are
   separate QEA phases, with root-of-unity module results consuming the
   resulting algebra maps.

The generic algebra stage cannot assume the later module/crystal comparison.
The module/crystal owner cannot be required to prove QEA's algebra
presentation. In particular, it must check crystal-lattice stability for the
derived coproduct on `eᵢ=Kᵢ⁻¹Eᵢ` and `fᵢ=FᵢKᵢ`, or provide an explicit
parameter/toral rescaling or tensor-factor reversal. Do not infer stability
of an unrescaled tensor product lattice from a different coproduct convention. A finite Weyl-group longest element is used only in the finite-
type PBW/root-vector phase. Generic symmetrizable Kac–Moody algebra uses the
finite-rank Cartan datum and its real-root reflection action; it does not
pretend to have a global `w₀` or a finite positive-root PBW list.

The algebraic inputs are [Kac–Moody KM0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0fd610c1a42f9fd886468f8797719a170b0001b8/TauCetiRoadmap/KacMoody/README.md) for the full realization and [RootSystems Layer3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/RootSystems/README.md) for abstract Coxeter combinatorics. [QuantumGroups Q8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/QuantumGroups/README.md) supplies the rank-one comparison. The finite classical comparisons use [LieHighestWeight Layers3–6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/797f5b74355c8cee4c8a2dfa1bb34bcb5c90ce69/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md) and [ReductiveGroups Layer9A](https://github.com/TauCetiProject/TauCetiRoadmap/blob/986a551490851718e5394107c45bf446860ba524/TauCetiRoadmap/ReductiveGroups/README.md); their finite hypotheses do not restrict the generic algebra. The path and divisor boundary uses [SchubertGeometry S4 and S7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7cf01b380473933670e894c7b42390e08648eb71/TauCetiRoadmap/SchubertGeometry/README.md). These are construction contracts; the order above selects their independent supplier clauses before any downstream application.

## QEA0. Actual datum and conventions

Take a finite index type `I`, a symmetrizable generalized Cartan matrix
`A = (aᵢⱼ)`, with the convention

`aᵢⱼ = ⟨αⱼ, hᵢ⟩`.

Specify positive integers `dᵢ` satisfying `dᵢ aᵢⱼ = dⱼ aⱼᵢ`, a free weight
lattice `X`, a free cocharacter lattice `Y`, a perfect integral pairing
`⟨-, -⟩ : X × Y → ℤ`, and simple roots `αᵢ ∈ X` and simple coroots
`hᵢ ∈ Y` realizing `A`. Retain the full `X,Y` root datum, including central
and isogeny data. Do not silently replace `Y` by the coroot lattice or `X` by
the root lattice, and do not assume a direct-sum splitting of a central
lattice. The early KM owner must provide the general realization and maps;
finite RootSystems data supplies finite root geometry, not a singular Cartan
realization.

For a formal parameter `v`, put `K = ℚ(v)`, `vᵢ = v^{dᵢ}`, and use symmetric
quantum integers

`[m]ᵢ = (vᵢ^m − vᵢ^(−m))/(vᵢ − vᵢ^(−1))`,

with `[m]ᵢ!` and quantum binomials defined in `K`. In nonsimply-laced type,
every divided power, quantum binomial and braid coefficient uses the
corresponding `vᵢ`; `aᵢⱼ` and `aⱼᵢ` are never interchanged by an ADE-only
shortcut. All module weights live in the supplied `X`.

The finite-type root-of-unity phase uses an explicitly fixed odd integer
`ℓ ≥ 3` with `gcd(ℓ,dᵢ)=1` for every `i`, a primitive `ℓ`th root `ζ`, and
`R = ℤ[ζ]`. Thus every `ζᵢ = ζ^{dᵢ}` has order `ℓ`. The even-order case is a
separate theorem with its own cyclotomic ring, modified root datum and
small-order exceptions; it is not inferred from the odd case. For generic
results `v` is indeterminate. No analytic or unit-circle specialization is
implicit.

## QEA1. Generic Drinfeld–Jimbo algebra and Hopf structure

For the given datum construct `U_v(A,X,Y)` as the quotient of the free
associative `K`-algebra on `Eᵢ,Fᵢ` and the toral symbols `K_μ` (`μ ∈ Y`) by
actual relations. The torus satisfies `K_0=1`, `K_μ K_ν=K_(μ+ν)`, and

`K_μ Eᵢ K_(−μ) = v^⟨αᵢ,μ⟩ Eᵢ`,
`K_μ Fᵢ K_(−μ) = v^(−⟨αᵢ,μ⟩) Fᵢ`.

Set `Kᵢ := K_(dᵢ hᵢ)`. The simple commutator is

`Eᵢ Fⱼ − Fⱼ Eᵢ = δᵢⱼ (Kᵢ − Kᵢ⁻¹)/(vᵢ − vᵢ⁻¹)`.

For `i ≠ j`, impose the divided-power quantum Serre relations

`Σ_(r+s=1−aᵢⱼ) (−1)^r Eᵢ^(r) Eⱼ Eᵢ^(s) = 0`,
`Σ_(r+s=1−aᵢⱼ) (−1)^r Fᵢ^(r) Fⱼ Fᵢ^(s) = 0`,

where the divided powers use `[r]ᵢ!`. Prove the universal property for
homomorphisms into an arbitrary `K`-algebra and identify the simple-root
relations with the actual KM Cartan convention.

Fix the `QuantumGroups` Q8 Hopf convention throughout:

`Δ(K_μ)=K_μ⊗K_μ`,
`Δ(Eᵢ)=Eᵢ⊗1 + Kᵢ⊗Eᵢ`,
`Δ(Fᵢ)=Fᵢ⊗Kᵢ⁻¹ + 1⊗Fᵢ`,
`ε(K_μ)=1`, `ε(Eᵢ)=ε(Fᵢ)=0`,
`S(K_μ)=K_(−μ)`, `S(Eᵢ)=−Kᵢ⁻¹Eᵢ`, `S(Fᵢ)=−FᵢKᵢ`.

Verify each relation and every Hopf identity on the quotient. Derive the
coproduct, counit and antipode formulas for all divided powers and toral
binomials; do not copy the p88–89 formulas without reconciling their factor
order and antipode convention. Prove the antipode is bijective and state its
inverse. For the module/crystal boundary expose the normalized root operators
`eᵢ=Kᵢ⁻¹Eᵢ`, `fᵢ=FᵢKᵢ`; derive
`Δ(eᵢ)=eᵢ⊗Kᵢ⁻¹+1⊗eᵢ` and
`Δ(fᵢ)=fᵢ⊗1+Kᵢ⊗fᵢ`. The downstream KM module owner consumes these operators
and proves the actual Kashiwara-lattice transport. The p88 divided-power
formulas remain a source convention to compare, not a second silent Hopf
instance. Generic modules, tensor products and duals consume this Hopf API.

Define positive and negative halves `U_v^+` and `U_v^-` as the actual
q-Serre quotients of the free algebras. Prove their embeddings into `U_v`,
the triangular multiplication isomorphism

`U_v^- ⊗_K K[Y] ⊗_K U_v^+  ≃  U_v`,

and the root-lattice grading. Let `Q_A=⊕ᵢℤαᵢ` and define `χ(αᵢ,αⱼ)=v^(dᵢaᵢⱼ)`, extended
bilinearly. Give `U_v^+` the braided tensor multiplication
`(a⊗b)(c⊗d)=χ(|b|,|c|)ac⊗bd` and braided coproduct map
`r₊:U_v^+→U_v^+⊗_χU_v^+` with `r₊(Eᵢ)=Eᵢ⊗1+1⊗Eᵢ`; give `U_v^-` the
standard negative braided tensor multiplication
`(a⊗b)(c⊗d)=χ(|b|,|c|)⁻¹ac⊗bd` and braided coproduct map
`r₋:U_v^-→U_v^-⊗_(χ⁻¹)U_v^-` with `r₋(Fᵢ)=Fᵢ⊗1+1⊗Fᵢ`. Here
`deg(Eᵢ)=αᵢ`, `deg(Fᵢ)=−αᵢ`, and `κ(αᵢ)=dᵢhᵢ`. Prove each map descends
through its q-Serre ideal and satisfies braided coassociativity and the
counit identities. Construct the braided antipodes as convolution inverses;
for the negative half require
`S₋(1)=1`, `S₋(Fᵢ)=−Fᵢ`,
`S₋(ab)=χ(|a|,|b|)⁻¹S₋(b)S₋(a)`, and
`m(S₋⊗id)r₋=ηε=m(id⊗S₋)r₋`; state and verify the corresponding χ-braided
positive identities. These are maps on the nilpotent halves, whose
codomains contain no toral symbols. Reconstruct the ordinary Borel
coproducts by
`Δ_B₊(x)=Σx₁K_(κ(|x₂|))⊗x₂` from `r₊(x)=Σx₁⊗x₂`, and
`Δ_B₋(y)=Σy₁⊗K_(κ(|y₁|))y₂` from `r₋(y)=Σy₁⊗y₂`. The negative torus
factor is before `y₂`; this bosonization gives the QEA1 raw `Fᵢ` coproduct.

Define the positive/negative nilpotent pairing `p` on the actual q-Serre
quotients, with `p(Eᵢ,Fⱼ)=δᵢⱼcᵢ` and `cᵢ=(vᵢ−vᵢ⁻¹)⁻¹`. For homogeneous
terms, the Sweedler components below mean `r₊` and `r₋`, respectively:
`p(xx′,y)=Σp(x,y₁)p(x′,y₂)` and
`p(x,yy′)=χ(|y|,|y′|)⁻¹Σp(x₁,y′)p(x₂,y)`. Extend bilinearly, make `p`
zero unless the degrees are opposite, and use the counit unit values. Verify
descent through both Serre ideals and prove nondegeneracy under the hypotheses
actually used. In rank one these formulas give
`p(Eᵢ²,Fᵢ²)=(1+vᵢ⁻²)cᵢ²`, which checks the negative χ⁻¹ convention.

For the Borel pairing use the positive-first, negative-second Hopf algebras
`B₊=U_v^+⋊K[Y]` and `B₋=U_v^-⋊K[Y]` with the actual coproducts fixed above
and the torus coproduct. Write `⟨−,−⟩:B₊×B₋→K′`, where `K′` is the extension
used for `β_t` below. Fix the skew equations, for `a,a′∈B₊`, `b,b′∈B₋`, as
`⟨aa′,b⟩=Σ⟨a,b₁⟩⟨a′,b₂⟩` and
`⟨a,bb′⟩=Σ⟨a₁,b′⟩⟨a₂,b⟩`, with unit rules
`⟨1,b⟩=ε(b)` and `⟨a,1⟩=ε(a)`. Set
`⟨Eᵢ,Fⱼ⟩=δᵢⱼcᵢ`, `⟨Eᵢ,K_y⟩=0`, `⟨K_y,Fᵢ⟩=0`, and
`⟨K_y^+,K_z^-⟩=β_t(y,z)`; extend by these equations. Verify well-definedness,
Serre-ideal compatibility and the mixed generator identities. Use the double
cross rule
`Σ⟨a₁,b₁⟩a₂b₂=Σ⟨a₂,b₂⟩b₁a₁`. With these conventions the `Eᵢ,Fⱼ` cross
relation is exactly
`EᵢFⱼ−FⱼEᵢ=δᵢⱼ(Kᵢ−Kᵢ⁻¹)/(vᵢ−vᵢ⁻¹)`; the toral conjugations must also recover
`K_yEᵢK_(−y)=v^⟨αᵢ,y⟩Eᵢ` and
`K_yFᵢK_(−y)=v^(−⟨αᵢ,y⟩)Fᵢ`. In particular
`⟨K_(dᵢhᵢ)^+,K_y^-⟩=⟨K_y^+,K_(dᵢhᵢ)^-⟩=v^⟨αᵢ,y⟩`.

Construct the toral bicharacter instead of treating it as datum. Put
`H_Q=span_Q{hᵢ}⊂Y⊗Q`. The early Kac–Moody realization supplies independent
`hᵢ`. Define a symmetric rational form on `H_Q×(Y⊗Q)` by
`b(dᵢhᵢ,y)=⟨αᵢ,y⟩`. It is consistent on `H_Q×H_Q`, since
`⟨αᵢ,dⱼhⱼ⟩=dⱼaⱼᵢ=dᵢaᵢⱼ=⟨αⱼ,dᵢhᵢ⟩`. Extend it symmetrically to
`Y⊗Q`; the extension is part of the construction and may be degenerate.
Choose `N>0` clearing all denominators of `b`, adjoin `t` with `t^N=v`, and
over `K'=Q(t)` set `β_t(y,z)=t^(N b(y,z))`. Then `β_t` is a bicharacter on
the whole lattice and
`β_t(dᵢhᵢ,y)=v^⟨αᵢ,y⟩`, with the same value in the reversed order. Compute
its radical `R_b={y∈Y | b(y,z)=0 for every z∈Y}`. The group algebra
generated by `K_r`, `r∈R_b`, is central; also retain every root-annihilating
torus element `K_c` with `⟨αᵢ,c⟩=0` for every `i`. Do not divide out any
of these central torus generators or assert full toral nondegeneracy.

Form the two Borel carriers over `K'` with this pairing. Define their
torus-amalgamated double by identifying the two copies of `K_y` for every
`y∈Y`, retaining all central `K_y` generators, and imposing the displayed
mixed relations. Give the explicit generator map to the full-`Y` quotient
`U_v(A,X,Y)⊗_K K'`, sending each positive or negative simple generator to
`Eᵢ` or `Fᵢ` and both toral copies to `K_y`. Prove it is an isomorphism by
checking the defining relations in both directions and using the triangular
factorization; in particular, do not infer the comparison merely from a
nondegeneracy assertion. Show that the defining cross-relations descend to
`K=Q(v)` and give the inverse comparison with the original full-`Y`
presentation. Prove nondegeneracy of the braided pairing on the nilpotent
halves under the hypotheses actually used, and state separately what radical
remains on the Borel torus. State completion only where an infinite sum is
used. These constructions apply to finite-rank symmetrizable data without a
finite `w₀`; they supply the algebraic input consumed by the later generic
module theory.

For an arbitrary symmetrizable datum, this phase does not enumerate every
positive root or assert a finite ordered-root PBW basis. The finite-type
root-vector phase below is a genuine specialization with extra hypotheses.

## QEA2. Finite-type braid operators and root vectors

Assume the supplied root datum is finite type, with finite Weyl group `W` and
longest element `w₀`. Fix the following Lusztig braid-operator variant. Write
`Kᵢ=K_(dᵢhᵢ)` and `vᵢ=v^{dᵢ}`. The simple-root and toral formulas are

`Tᵢ(Eᵢ)=−FᵢKᵢ`, `Tᵢ(Fᵢ)=−Kᵢ⁻¹Eᵢ`,
`Tᵢ(K_μ)=K_(sᵢ μ)`.

For `j ≠ i`, use the p86 factor order and signs:

`Tᵢ(Eⱼ)=Σ_(r=0)^(−aᵢⱼ) (−1)^(r−aᵢⱼ) vᵢ^(−r)
 Eᵢ^(−aᵢⱼ−r) Eⱼ Eᵢ^(r)`,

`Tᵢ(Fⱼ)=Σ_(r=0)^(−aᵢⱼ) (−1)^(r−aᵢⱼ) vᵢ^r
 Fᵢ^(r) Fⱼ Fᵢ^(−aᵢⱼ−r)`.

Prove these formulas preserve every defining relation; give the explicit
inverse-generator formulas for this same variant and prove both composites
are identities. Prove the braid relations with length determined by
`aᵢⱼaⱼᵢ` (including lengths 2, 3, 4, 6) and no isolated-entry shortcut. On
the torus prove the formula is the reflection on the actual `Y` lattice.
The displayed consequence
`Tᵢ(Kⱼ)=KⱼKᵢ^(−aᵢⱼ)` holds in every symmetrizable type: with
`aᵢⱼ=⟨αⱼ,hᵢ⟩`,
`sᵢ(dⱼhⱼ)=dⱼhⱼ−dⱼaⱼᵢhᵢ=dⱼhⱼ−dᵢaᵢⱼhᵢ` by symmetrizability.
Derive it from `Tᵢ(K_μ)=K_(sᵢμ)`; retain the general formula on arbitrary
`K_μ` and do not interchange `aᵢⱼ` with `aⱼᵢ` or omit the `d` factors.

For a reduced expression `w₀=s_(i₁)…s_(i_N)`, define the ordered positive
roots `β_k=s_(i₁)…s_(i_(k−1))(α_(i_k))` and root vectors
`E_(β_k)=T_(i₁)…T_(i_(k−1))(E_(i_k))`, `F_(β_k)` analogously. Define divided
root powers inside `U_v` by the corresponding `v_(β_k)` factorials. Prove
independence of the braid action, root-vector membership in the integral
form, the straightening relations and the basis below. The *ordered basis*
depends on the chosen reduced word; prove integral transition maps between
reduced-word bases, not literal equality of their ordered monomials. Include
the two `A₂` reduced words `121` and `212` as a check of root order and braid
normalization.

## QEA3. Full-Y integral extension and finite-type PBW

Let `A=ℤ[v,v⁻¹]`. Define `U_A` as the `A`-subalgebra of the actual
`U_v(A,X,Y)` generated by all `Eᵢ^(m)`, `Fᵢ^(m)`, `K_μ` for `μ∈Y`, and
the toral quantum binomials for the chosen integral torus. The simple-coroot symbols are

`[Kᵢ;0 choose m] = Π_(s=1)^m
 (Kᵢ vᵢ^(−s+1) − Kᵢ⁻¹ vᵢ^(s−1))/(vᵢ^s − vᵢ^(−s))`.
For each `y∈Y`, also include the full-lattice binomials
`[K_y;0 choose m]_v` with the same formula using `K_y` and `v`. This full-Y
extension is deliberate: it retains central toral directions and is not
silently identified with the smaller standard semisimple toral form. Prove
the integral toral straightening and basis-change identities, so the
construction is independent of the chosen `ℤ`-basis of `Y` and does not
require a splitting of the central or coroot sublattice.

Choose a `ℤ`-basis `y₁,…,y_r` of the full free lattice `Y`, and define the
full-lattice toral form using the group elements `K_y` and quantum binomials
`[K_y;0 choose n]` in these basis directions. Prove that its `A`-basis is
`K_(Σ_j ε_j y_j) · ∏_j [K_(y_j);0 choose n_j]`, with
`ε_j∈{0,1}` and `n_j∈ℕ`; prove spanning, linear independence and integral
change-of-basis formulas for every other basis of `Y`. Prove that each simple
coroot binomial `[Kᵢ;0 choose m]` and every required full-`Y` binomial lies in
this form, and that adjoining them does not enlarge it. This construction
retains central directions and does not split off a central lattice. It is a
coordinate construction whose basis-change theorem is part of the target,
not a claim that the chosen coordinates are canonical. Use
`ε∈{0,1}`. The source's `ε=±1` family fails already over the generic
one-dimensional torus: write `C_n(K)=[K;0 choose n]`. For `n>0`,
`C_n(1)=C_n(−1)=0` because its numerator contains `K−K⁻¹`; for `n=0`,
`K(1)=K⁻¹(1)=1` and `K(−1)=K⁻¹(−1)=−1`. Every linear combination of
`K C_n(K)` and `K⁻¹ C_n(K)` therefore has values satisfying
`f(−1)=−f(1)`, while the constant `1` does not. Thus that family does not
span the generic toral form. The `ε∈{0,1}` basis above still requires its
own spanning, independence and basis-change proof.

With a proved toral basis `B_Y`, prove that the products

`F_(β₁)^(a₁)…F_(β_N)^(a_N) · t ·
 E_(β₁)^(b₁)…E_(β_N)^(b_N)`

for `a_k,b_k∈ℕ` and `t∈B_Y` form an `A`-basis of `U_A`. Prove integral
straightening and multiplication, for example

`E_α^(a) E_α^(b) = [a+b choose a]_(v_α) E_α^(a+b)`,

and the corresponding divided-power opposite-root and different-root
commutation formulas. Keep every coefficient in `A`; identify and retain
primes in nonsimply-laced coefficients rather than invert them to simplify a
formula. Prove the integral Hopf structure preserves `U_A`; base change its
free `A`-basis and Hopf maps to every commutative `A`-algebra without
redefining a specialized divided power by division by a vanishing factorial.

At `v=1`, prove the quotient with `K_μ=1` for all `μ` identifies with the
full-`Y` classical Kostant form from ReductiveGroups 9A, including each
`binom(H_y,m)`. The semisimple presentation uses only simple-Cartan binomials; the full-`Y`
extension and its comparison to ReductiveGroups 9A are part of this target. Compare the full `X,Y` root datum maps under central
isogenies. A rational Lie-algebra isomorphism alone does not identify
integral forms. The `ε∈{0,1}` choice above is part of the basis theorem.

## QEA4. Integral highest-weight lattices and the generic-module boundary

For finite type and dominant `λ∈X`, construct the generic finite-dimensional
type-1 highest-weight module and a highest vector `v_λ`. Define
`V_A(λ)=U_A·v_λ`; prove it is a finite free `A`-lattice, exhibit a basis and
prove stability under every divided power and toral binomial. Prove base
change gives an action of `U_R` for every commutative `A`-algebra `R`.

The generic type-1 highest-weight classification, character equality and
integrable module/crystal comparison are downstream KM module-owner work.
QEA supplies the algebra, Hopf, root operators, divided powers and lattice
maps; it does not make its generic presentation depend on that later
classification. The characteristic-zero `v=1` comparison consumes
ReductiveGroups 9A and LieHighestWeight's finite-dimensional highest-weight
modules. Do not infer simplicity after an arbitrary specialization from
generic simplicity or from the `v=1` comparison.

## QEA5. Odd-order quantum Frobenius for finite type

Assume finite type, `ℓ≥3` odd and coprime to every `dᵢ`, and fix a primitive
`ℓ`th root `ζ` together with the map `A→R=ℤ[ζ]`, `v↦ζ`. Put
`U_ζ=U_A⊗_A R`. Construct the classical target `U_ℤ(g)⊗_ℤ R` using the
full-`Y` Kostant form, and construct a Hopf algebra homomorphism

`Fr : U_ζ → U_ℤ(g)⊗R`.

On the pinned generators it has

`Fr(Eᵢ^(m)) = Xᵢ^(m/ℓ)` and
`Fr(Fᵢ^(m)) = Yᵢ^(m/ℓ)` when `ℓ | m`, and zero otherwise;
`Fr(K_μ)=1`;
`Fr([Kᵢ;0 choose m]) = binom(H_(hᵢ),m/ℓ)` when `ℓ | m`, and zero
otherwise, with the `vᵢ`-binomial normalization. For each `y∈Y`, also prove
the matching formula for its full-lattice toral binomial in the `H_y`
direction, with the formula derived from the chosen full-`Y` toral basis.
Prove well-definedness
on every defining relation, coproduct/counit/antipode compatibility and
compatibility with the chosen central-isogeny maps. Do not define these
specialized operators by dividing by `[m]!` after specialization.

Construct the positive and negative divided-power maps separately on their
actual nilpotent domains. Do not call either one a unital section of all
`U_ℤ(g)` unless a separate construction proves it. Any positive Frobenius map on Cartan binomials has its own stated domain:
a positive nilpotent algebra does not contain toral generators.

### Even order: the modified Frobenius map

Let `ℓ≥2` be even, let `A=ℤ[v,v⁻¹]`, and specialize through
`A_ℓ=A/(Φ_(2ℓ)(v))` with image `ζ` of order `2ℓ`, so `ζ^ℓ=−1`. Start with
the finite-type root datum already fixed in QEA0: finite free `X,Y` with
perfect pairing, roots `αᵢ`, coroots `hᵢ`, Cartan entries
`aᵢⱼ=⟨αⱼ,hᵢ⟩`, and positive integral symmetrizers `dᵢ`. Put

`ℓᵢ = min {m>0 : m dᵢ ∈ ℓℤ} = ℓ/gcd(ℓ,dᵢ)`,

`X* = {λ∈X : ⟨λ,hᵢ⟩∈ℓᵢℤ for every i}`, and `Y*=Hom(X*,ℤ)` with its
evaluation pairing. Use the actual inclusion `X* ↪ X` and restriction
`Y → Y*`. Define `αᵢ* = ℓᵢ αᵢ ∈ X*`, define
`hᵢ*(λ)=⟨λ,hᵢ⟩/ℓᵢ` on `X*`, and hence
`aᵢⱼ* = ℓⱼ aᵢⱼ/ℓᵢ` and `dᵢ* = ℓᵢ² dᵢ`. Prove these are integral and
satisfy the modified Cartan and symmetrizer identities. The target parameter
is `ζᵢ* = ζ^(dᵢ ℓᵢ²) ∈ {1,−1}`. Do not identify the target with the ordinary
classical enveloping algebra when one of these parameters is `−1`.

Build the divided-power modified integral form `dot U_A(X,Y)` as a
non-unital, locally unital `A`-algebra with orthogonal weight idempotents
`1_λ` for `λ∈X`. Its generators are `Eᵢ^(n)1_λ` and `Fᵢ^(n)1_λ` for `n≥0`.
Include `1_λ1_μ=δ_(λ,μ)1_λ`, the shifts
`Eᵢ^(n)1_λ=1_(λ+nαᵢ)Eᵢ^(n)1_λ` and
`Fᵢ^(n)1_λ=1_(λ−nαᵢ)Fᵢ^(n)1_λ`, same-root products
`Eᵢ^(a)Eᵢ^(b)1_λ=[a+b choose a]ᵢEᵢ^(a+b)1_λ` and the corresponding `F`
formula, and both divided-power quantum Serre families. Fix the following
mixed presentation convention. For `i≠j`,

`Eᵢ^(a)1_λFⱼ^(b)=Fⱼ^(b)1_(λ+aαᵢ+bαⱼ)Eᵢ^(a)`.

For `i=j`,

`Eᵢ^(a)1_λFᵢ^(b) = Σ_(t=0)^min(a,b) [⟨λ,hᵢ⟩+a+b choose t]ᵢ Fᵢ^(b−t)1_(λ+(a+b−t)αᵢ)Eᵢ^(a−t)`.

Prove this presentation agrees with the full-`Y` divided-power integral
form acting on `X`-weight modules, including every toral multiplier. For
`y∈Y`, the source multiplier `K_y` acts on `1_λ` by
`ζ^⟨λ,y⟩`; its full-lattice toral binomial `C_y(c,n)` acts by the signed
symmetric-Gaussian value `[⟨λ,y⟩+c choose n]_ζ` (for every `c∈ℤ`,
`n∈ℕ`, with the declared integral normalization). For `λ∈X*` set
`y*=y|_(X*)∈Y*`. On that same actual label prove the explicit target laws
`K*_(y*)1_λ=ζ^⟨λ,y*⟩1_λ` and
`C*_(y*)(c,n)1_λ=[⟨λ,y*⟩+c choose n]_ζ1_λ`. Thus the source and target
multiplier scalars agree by restriction and evaluation on `λ`; the target
Gaussian here is evaluated at the original `ζ`. Do not replace `λ` by `λ/ℓ`
or import the odd-order unmodified full-`Y` scaling formula without a proof
for this modified lattice.

For each finite subset `S⊂X`, the sum `Σ_(λ∈S)1_λ` is a local unit on
finitely many elements supported at those source and target weights. There
is no global identity when `X` is infinite. Construct the target
`dot U*_(A_ℓ)(X*,Y*)` by the same modified divided-power presentation for the
star datum and specialize it over `A_ℓ`; it has its own star-weight
idempotents and is not an ordinary unital Hopf algebra.

Assume the exact Lusztig hypotheses

`ℓᵢ ≥ 1−aᵢⱼ whenever i≠j and ℓⱼ≥2`, and the Cartan diagram has no odd
cycle.

Construct the surjective non-unital algebra homomorphism

`Fr : dot U_(A_ℓ)(X,Y) → dot U*_(A_ℓ)(X*,Y*)`

on generators by

`Fr(Eᵢ^(n)1_λ) = eᵢ^(n/ℓᵢ)1_λ` and
`Fr(Fᵢ^(n)1_λ) = fᵢ^(n/ℓᵢ)1_λ`

when `λ∈X*` and `ℓᵢ | n`, and by zero otherwise. At `n=0`, this sends
`1_λ` to the target `1_λ` for `λ∈X*`, and to zero for `λ∉X*`. Prove the map
is well-defined on the presentation, respects the finite-support local-unit
actions, is surjective, and pulls every target `X*`-weight module back to a
source `X`-weight module supported on `X*`. Prove the full-`Y` multiplier
intertwining on every `1_λ` using the scalar laws above; do not infer a
unital Hopf map from this modified-algebra homomorphism.

For every normalized simply-laced finite-type datum (`dᵢ=1`), these
conditions hold for every even `ℓ≥2`: `ℓᵢ=ℓ`, `ζᵢ*=ζ^(ℓ²)=1`, and the target
is the classical modified enveloping algebra for the actual lattice
`(X*,Y*)`. This does not identify `(X*,Y*)` with an independently chosen
simply-connected lattice. For other positive symmetrizer normalizations,
retain the general hypotheses above; for example, in type `A₁` with `d₁=2`
and `ℓ=2`, `ℓ₁=1` and `ζ₁*=−1`, so the ordinary classical-target conclusion
does not follow from the type name alone. For non-simply-laced data, state
and prove the displayed order hypotheses rather than asserting all even
orders. They fail for `B₂` and `G₂` at `ℓ=2`, so this theorem makes no
Frobenius claim in those cases.

As a regression, the ordinary unmodified rule `Fr(Kᵢ)=1` cannot accompany
the divided-power rule `Fr(Eⱼ^(ℓ))=Xⱼ` in adjacent normalized simply-laced
type `A₂`: when `ζ^ℓ=−1` and `aᵢⱼ=−1`, conjugation gives
`Kᵢ Eⱼ^(ℓ) Kᵢ⁻¹ = −Eⱼ^(ℓ)`, whereas the proposed classical image is fixed
by `Fr(Kᵢ)=1`. This obstruction is to that ordinary unmodified map; the
modified-algebra map above uses the star weight idempotents.

## QEA6. Root-of-unity modules, heads and Frobenius pullback

Separate four objects in every statement: the integral Weyl lattice, its
specialized Weyl module, its simple head, and the Frobenius pullback of a
classical module. After an explicit embedding `R→ℂ`, construct the
finite-dimensional type-1 modules and prove the root-of-unity assertions with
the stated `ℓ` hypotheses. For a classical simple `L(λ)`, the Frobenius
pullback `Fr^*L(λ)` has ordinary `Eᵢ,Fᵢ` acting by zero for `ℓ>1`, and
`Eᵢ^(ℓ),Fᵢ^(ℓ)` acting as `Xᵢ,Yᵢ`; its highest weight in the quantum weight
lattice is `ℓλ`. Prove

`Fr^* L(λ) ≅ L_ζ(ℓλ)`,

where `L_ζ(ℓλ)` denotes the simple highest-weight module, and separately
construct the surjection from the quantum Weyl module
`Δ_ζ(ℓλ) → L_ζ(ℓλ)`. Dualize using the pinned antipode and dual convention.

For the quantum-Lucas formula allow every integer upper argument
`m∈ℤ` and lower argument `r∈ℕ`. Define the symmetric Gaussian binomial for
signed `m` by its Laurent-polynomial extension from
`∏_(j=1)^r [m−j+1]_v/[j]_v`. Write the Euclidean decompositions
`m=m₀+ℓm₁`, `r=r₀+ℓr₁`, with `0≤m₀,r₀<ℓ`, `m₁∈ℤ` and `r₁∈ℕ`. Prove

`[m choose r]_ζ = [m₀ choose r₀]_ζ · binom(m₁,r₁)`,

where the ordinary binomial for negative integer upper argument is its
integer-valued polynomial value. In particular
`[−ℓ choose ℓ]_ζ=binom(−1,1)=−1`. This signed formula is the one used for
toral eigenvalues on all integral weights; the nonnegative-upper case is
included.

Derive toral quantum-binomial eigenvalues on actual highest-weight vectors
from this formula. Do not conclude that a nonzero integer
`⟨λ,hᵢ⟩` makes `Fᵢv_λ` a highest vector: test every positive divided power
on that vector. Give the explicit rank-one counterexamples and nonsimple
specialized Weyl modules, with the simple head identified separately.

The finite-type Steinberg tensor-product theorem is a distinct target, stated
first for the simply-connected semisimple root datum where every dominant
weight has the required `λ₀+ℓλ₁` decomposition, `0≤⟨λ₀,hᵢ⟩<ℓ`. Prove
`L_ζ(λ₀+ℓλ₁) ≅ L_ζ(λ₀)⊗Fr^*L(λ₁)` and then state any extension to other
root data only with its actual lattice hypotheses. This is not required to
construct the Frobenius algebra homomorphism.

## QEA7. Frobenius contraction and nilpotent restrictions

For a type-1 `U_ζ`-module `M`, require an internal algebraic direct-sum
`X`-weight decomposition `M=⊕_(μ∈X)M_μ` with the actual `K_y` character
`K_y m=ζ^⟨μ,y⟩m` for every `y∈Y` and `m∈M_μ`. The integral label is part of
the structure even when distinct weights have the same root-of-unity
character. Require also the full toral divided-binomial character laws, for
every `μ∈X`, `y∈Y`, `n∈ℕ` and `m∈M_μ`,
`[K_y;0 choose n]m = [⟨μ,y⟩ choose n]_ζ m`, using the signed-upper Gaussian
specialization fixed in QEA6. For each simple coroot require the separate
`vᵢ`-normalized law
`[Kᵢ;0 choose n]m = [⟨μ,hᵢ⟩ choose n]_(ζᵢ)m`. The divided-root shift laws
are `Eᵢ^(r)M_μ⊆M_(μ+rαᵢ)` and
`Fᵢ^(r)M_μ⊆M_(μ−rαᵢ)` for all `r≥0`; toral operators preserve each weight
space. These are hypotheses on the full divided-power action, not consequences
of the `K_y` eigenvalues: on the counit module `K_y=1` and the positive toral
divided binomials vanish, so it cannot be relabelled as a nonzero weight `ℓν`
when that label would require a nonzero binomial eigenvalue. Define

`M^(ℓ) = ⊕_(ν∈X) M_(ℓν)`

with new weight `ν` on the summand formerly indexed by `ℓν`. For every
`m≥0`, define the classical divided root operators `Xᵢ^(m)` and `Yᵢ^(m)` by
the restrictions of `Eᵢ^(ℓm)` and `Fᵢ^(ℓm)` to this selected weight sum; in
particular the ordinary generators use exponent `ℓ`. On `M_(ℓν)`, every
full-lattice divided Cartan operator in direction `y∈Y` is the specialization
of `[K_y;0 choose ℓm]` and must act by `binom(⟨ν,y⟩,m)`. The simple-coroot
operator is the corresponding `vᵢ`-normalized binomial and acts by
`binom(⟨ν,hᵢ⟩,m)`. Prove each divided operator preserves the selected sum,
all full-`Y` Kostant relations hold, and the construction is functorial for
maps preserving the weight decomposition and divided-power action. The specialized toral-binomial formula, including its normalization,
is part of the theorem; ordinary `K_y` eigenvalues alone do not specify the
Cartan action.
Compare the contraction with `Fr^*` on the precise subcategory where the
comparison is true, and prove dual/tensor comparisons separately with the
actual coproduct. This is a projected-weight construction; it does not assume
a splitting `U(g)→U_ζ`.

Keep the positive and negative unprojected divided-power restrictions as
separate `U(n⁺)` and `U(n⁻)` actions. The positive and negative unprojected restrictions are actions of their
respective nilpotent algebras; they do not make every original weight summand
a module for the full classical enveloping algebra.

## QEA8. Examples and geometry boundary

Reconstruct the p92 quantum plane with `xy=v yx`, ordered basis `y^j x^k`,
its multiplication, grading and the displayed symmetric-quantum-integer
`E,F,K` formulas. Prove the module relations, the generic degree-`n`
highest-weight identification and the `v=1` binary-form comparison. The
module-algebra action must use the QEA1 Hopf convention and stated
root-operator normalization; check the action directly on `xy−v yx` before
claiming compatibility. The displayed p88 coproduct convention is used only after its factor order
has been reconciled with QEA1.

The p81 Chevalley/Pieri divisor formula is a geometric statement owned by the
finite SchubertGeometry layer with its codimension-one predecessor,
normalized extremal section and coroot-coefficient inputs. QEA provides no
quantum flag variety, quantum cohomology ring, or quantum Schubert product.
Any such development requires its own geometric carrier, coefficient ring,
deformation parameter and comparison maps before it can consume QEA. Kac–Moody flag/ind-scheme geometry
is not inferred from the finite-type formula.
## References

The even-order modified Frobenius contract uses Kevin McGerty, [*Hall algebras and the quantum Frobenius homomorphism*, §2](https://arxiv.org/html/math/0601150v1#S2), including its modified root datum and small-order hypotheses. The normalized simply-laced case is included; failure of those sufficient hypotheses asserts no nonexistence theorem.
